class CreateTranscription < Struct.new(:params)
  include Speakable

  def execute
    speak("Listen: #{params[:RecordingUrl]}")
    speak(params[:TranscriptionText])

    "Completed."
  end
end
