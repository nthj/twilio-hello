class CreateCompletionMessage < Struct.new(:params)
  include Speakable

  def execute
    speak("Completed #{params[:RecordingDuration]}s call to #{params[:To]} from #{params[:From]} (#{params[:CallerName]}) in #{params[:FromCity]}, #{params[:FromState]}. Listen: #{params[:RecordingUrl]}")

    # TODO: ping Google Analytics with $conversionID

    "Completed."
  end
end
