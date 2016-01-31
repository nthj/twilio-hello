require './setup'
require './lib'
require './commands/create_automated_message_reply'
require './commands/create_call'
require './commands/create_completion_message'
require './commands/create_switchboard'
require './commands/create_verification_message'

CreateSwitchboard::Receptionist.poll!

before do
  params.each_pair do |key, value|
    puts [
      key.rjust(params.keys.sort_by(&:length).last.length),
      value
    ].join(' :: ')
  end
end

post "/#{ENV['SECRET']}/:action" do
  case params[:action].to_s.strip
  when 'call'         then CreateCall.new(params)
  when 'completed'    then CreateCompletionMessage.new(params)
  when 'messages' 		then CreateAutomatedMessageReply.new(params)
  when 'verification'	then CreateVerificationMessage.new(params['Body'])
  else                     CreateSwitchboard.new(params['Digits'])
  end.execute.tap do |command|
    puts command
  end
end
