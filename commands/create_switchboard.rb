class Receptionist < Twilio::TwiML::Response
  POSSIBLE_RECEPTIONISTS = [
    { initials: 'vh', extension: 5 },
    { initials: 'nj', extension: 1 }
  ]

  class << self
    attr_accessor :available_receptionist

    self.available_receptionist = 1

    def poll!
      Thread.new do
        @room = Tinder::Campfire.new(
          ENV['CAMPFIRE_SUBDOMAIN'],
          token: ENV['CAMPFIRE_API_KEY']
        ).rooms.first

        loop do
          self.available_receptionist = @room.current_users.find do |user|
            POSSIBLE_RECEPTIONISTS.any? do |receptionist|
              receptionist[:initials]
            end
          end[:extension] rescue 1 # Default extension

          sleep 120
        end
      end
    end
  end

  def initialize
    super do |response|
      response.Gather numDigits: '1', action: "/#{ENV['SECRET']}/switchboard" do |gather|
        gather.Play ENV['RECEPTIONIST']
      end
      response.Dial self.class.available_receptionist # Whoever is most active in Campfire right now
    end
  end
end

class CreateSwitchboard < Struct.new(:digits, :from, :from_state)
  def execute
  	case digits.to_i
  	when 1 then Call.new('+1512xxxxxxx') # Nathaniel
  	when 2 then Call.new('+1512xxxxxxx') # PJ
  	when 3 then Call.new('+1512xxxxxxx') # Lindsey
  	when 4 then Call.new('+1512xxxxxxx') # Jonah
  	when 5 then Call.new('+1512xxxxxxx') # Victoria
  	else Receptionist.new
  	end.text
  end
end
