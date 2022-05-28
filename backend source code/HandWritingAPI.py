from flask import request, jsonify
import numpy as np
import base64
import cv2
from flask_cors import cross_origin
from flask import Blueprint

handWritingAPI = Blueprint('handWritingAPI', __name__)


def getImage(responseBody, imageIndex):
    encodedImage = responseBody['images'][imageIndex]
    return encodedImage


def decodeImage(encodedImage):
    # base64 to image decoding
    strImage = base64.b64decode(encodedImage)
    arrImage = np.fromstring(strImage, np.uint8)
    image = cv2.imdecode(arrImage, cv2.IMREAD_COLOR)
    return image


def encodeImage(image):
    # Image to base64 encoding
    _, strImg = cv2.imencode('.png', image)
    encodedImage = base64.b64encode(strImg)
    return encodedImage


def sharpenImage(image, thresh):
    image = cv2.bitwise_not(image)
    _, binaryThreshImage = cv2.threshold(image, thresh, 255, cv2.THRESH_BINARY)
    image = cv2.bitwise_not(binaryThreshImage)
    return image


def countPixels(image, value):
    temp = np.sum(image == value, axis=-1)
    count = np.sum(temp == 3)
    return count

def toBlackAndWhite(image):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    thresh, blackAndWhite = cv2.threshold(gray, 240, 255, cv2.THRESH_BINARY)
    blackAndWhite= cv2.cvtColor(blackAndWhite,cv2.COLOR_GRAY2BGR)
    return blackAndWhite


def getDifference(original, duplicate):

    if original.shape == duplicate.shape:  # Check if images have same size and channels

        difference = cv2.subtract(original, duplicate)
        remainingPixels = countPixels(difference, 255)  # how many pixels did the user miss

        difference[np.where((difference == [255, 255, 255]).all(axis=2))] = [0, 0, 255]

    return difference, remainingPixels


@handWritingAPI.route('/handwriting', methods=['GET', 'POST'])
@cross_origin()
def writing():

    # Read input image
    requestBody = request.get_json(force=True)
    encodedImage = getImage(requestBody, imageIndex=0)
    original = decodeImage(encodedImage)

    # Keep only the green color and get a black and white version
    original[np.where((original != [0, 255, 0]).all(axis=2))] = [255, 255, 255]
    original[np.where((original == [0, 0, 0]).all(axis=2))] = [255, 255, 255]
    blackAndWhite = toBlackAndWhite(original)
    original[np.where((original == [255, 255, 255]).all(axis=2))] = [0, 0, 0]

    # Read target image
    encodedImage = getImage(requestBody, imageIndex=1)
    duplicate = decodeImage(encodedImage)
    duplicate[np.where((duplicate == [0, 0, 0]).all(axis=2))] = [255, 255, 255]
    duplicate = sharpenImage(duplicate, 1)

    originalPixels = countPixels(duplicate, 0)  # how many pixles there are in the target image

    difference, remainingPixels = getDifference(blackAndWhite, duplicate)
    responseImage = cv2.add(difference, original)  # add the input and the difference so we can compare them

    # Prepare the output to be sent through the api
    encodedImage = encodeImage(responseImage)
    accuracy = round((1 - remainingPixels / originalPixels) * 100)

    result = jsonify({'image': str(encodedImage)[2:-1], "accuracy": accuracy})
    result.headers.add("Access-Control-Allow-Origin", "*")
    return result
