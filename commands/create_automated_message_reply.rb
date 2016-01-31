class Reply < Twilio::TwiML::Response
	def initialize email, params = { }
    @email, @params = email, params

		forward_to_email!

		super(*[]) do |response|
			response.Sms "Thank you for your message. I am unable to receive texts at this time. Please call or send an email to #{email}"
		end
	end

  def forward_to_email!
    m = Mail.new
    m.to @email
    m.from 'hello@thirdprestige.com'
    m.subject "SMS message from #{@params[:From]} in #{@params[:FromState]}"
    m.body "#{@params[:Body]}"
    m.deliver
  end
end

class CreateAutomatedMessageReply < Struct.new(:params)
  def execute
  	case params[:To]
  	when '+1512xxxxxxx' then Reply.new('nj@thirdprestige.com', params) # Nathaniel
  	when '+1512xxxxxxx' then Reply.new('lf@thirdprestige.com', params) # Lindsey
  	when '+1512xxxxxxx' then Reply.new('jh@thirdprestige.com', params) # Jonah
  	when '+1512xxxxxxx' then Reply.new('vh@thirdprestige.com', params) # Victoria
  	end.text
  end
end
