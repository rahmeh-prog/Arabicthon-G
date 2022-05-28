from flask import Flask
from flask_cors import CORS
from VoiceRecognitionAPI import voiceRecognitionAPI
from HandWritingAPI import handWritingAPI
from VoiceChatAPI import voiceChatAPI


app = Flask(__name__)
app.register_blueprint(voiceRecognitionAPI, url_prefix='/games')
app.register_blueprint(handWritingAPI, url_prefix='/games')
app.register_blueprint(voiceChatAPI)

cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'


if __name__ == '__main__':
    app.run(host='localhost')