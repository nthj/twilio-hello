class Call < Twilio::TwiML::Response
  def initialize number
    super(*[]) do |response|
      options = { 
        action: "/#{ENV['SECRET']}/completed", 
        record: true
      }
      response.Dial(options) do |dial|
        dial.Number number
      end

      puts response.text
    end
  end
end

module Speakable
  def speak message
    @campfire ||= Tinder::Campfire.new(
      ENV['CAMPFIRE_SUBDOMAIN'], 
      token: ENV['CAMPFIRE_API_KEY']
    )

    @campfire.rooms.first.speak(message)
  end
end
