class CreateVerificationMessage < Struct.new(:message)
  include Speakable

  def execute 
    puts "Sending verification code to Campfire, message is: #{message}"
    speak("Verification code: #{message}")

    "Verified."
  end
end
