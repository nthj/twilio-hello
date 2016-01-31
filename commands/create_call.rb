class CreateCall < Struct.new(:params)
  def execute
  	case params[:To]
  	when '+1512xxxxxxx' then Call.new('+1512xxxxxxx') # Nathaniel
  	when '+1512xxxxxxx' then Call.new('+1512xxxxxxx') # PJ
  	when '+1512xxxxxxx' then Call.new('+1512xxxxxxx') # Lindsey
  	when '+1512xxxxxxx' then Call.new('+1512xxxxxxx') # Jonah
  	when '+1512xxxxxxx' then Call.new('+1512xxxxxxx') # Victoria
  	end.text
  end
end
