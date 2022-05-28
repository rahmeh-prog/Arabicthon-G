import speech_recognition
from flask import Blueprint, request

voiceRecognitionAPI = Blueprint('voiceRecognitionAPI', __name__)


def speechToText(filename, recognizer):
    audioFile = speech_recognition.AudioFile(filename)

    with audioFile as source:
        audio = recognizer.listen(source)
        try:
            recognizedText = recognizer.recognize_google(audio, language='ar-AR')

        except speech_recognition.UnknownValueError:
            return "Unknown"
        except speech_recognition.RequestError:
            return "Service down"
        return recognizedText


def parseAudioFile(filename, requestBody):
    pass


@voiceAPI.route("/voice", methods=['GET', 'POST'])
def recognizeVoice():
    requestBody = request.get_json(force=True)
    filename = ''
    parseAudioFile(filename=filename, requestBody=requestBody)
    recognizer = speech_recognition.Recognizer()
    recognizedText = speechToText(filename=filename, recognizer=recognizer)
    return recognizedText