require_relative 'config/environment'

class App < Sinatra::Base
  # match, assign :name to @name, reverse @name, send back
  get '/reversename/:name' do 
    @name = params[:name]

    erb :reversename
  end

  get '/square/:number' do
    @number = params[:number].to_i

    erb :square
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]

    erb :say_number_phrase
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @words = params.map {|k, v| v}

    erb :say_word1_word2_word3_word4_word5
  end

  get '/:operation/:number1/:number2' do
    params.each {|k,v| instance_variable_set("@#{k}", v)}
    @answer = case @operation
    when 'add'
      (@number1.to_i + @number2.to_i).to_s
    when 'subtract'
      (@number1.to_i - @number2.to_i).to_s
    when 'divide'
      (@number1.to_i / @number2.to_i).to_s
    when 'multiply'
      (@number1.to_i * @number2.to_i).to_s
    end
    erb :operation_number1_number2
  end
end