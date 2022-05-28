import os
from flask import request, jsonify, Blueprint
import speech_recognition as sr
import base64
from flask_cors import cross_origin


voiceChatAPI = Blueprint('voiceChat', _name_)


def decode_audio(encoded_data):
    decode_file = open("temp.wav", "wb")
    decoded_audio = base64.b64decode(encoded_data)
    decode_file.write(decoded_audio)
    return "temp.wav"


def to_text(audio_file):
    recognizer = sr.Recognizer()
    with sr.AudioFile(audio_file) as source:
        audio = recognizer.record(source)
        try:
            voice_data = recognizer.recognize_google(audio, language='ar-AR')
        except Exception:
            return ""
        return voice_data


def respond(voice_data):
    if voice_data == "":
        return "response_audios/noSound.txt"

    elif any(word in voice_data for word in ["لوني المفضل", "اللون المفضل"]):
        return "response_audios/colorAnswer.txt"

    elif any(word in voice_data for word in ["اين تعيش", "اين انت", "وين انت"]):
        return "response_audios/from.txt"

    elif any(word in voice_data for word in ["طرفة", "نكته"]):
        return "response_audios/joke.txt"

    elif "اسمك" in voice_data:
        return "response_audios/name.txt"

    elif "قصة" in voice_data:
        return "response_audios/store.txt"

    elif "نوم" in voice_data:
        return "response_audios/sleep.txt"

    elif "لونك" in voice_data:
        return "response_audios/colorAsked.txt"

    else:
        return "response_audios/else.txt"


@voiceChatAPI.route('/voicechat', methods=['GET', 'POST'])
@cross_origin()
def voice_chat():
    request_body = request.get_json(force=True)
    encoded_audio = request_body["audio"]
    decoded_audio = decode_audio(encoded_audio)
    voice_data = to_text(decoded_audio)
    response = respond(voice_data)
    os.remove("temp.wav")
    result = jsonify({"audio": str(open(response).read())})
    result.headers.add("Access-Control-Allow-Origin", "*")
    return result
