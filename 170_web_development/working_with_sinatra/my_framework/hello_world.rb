# hello_world.rb

require_relative 'advice'

# HelloWorld driver class for application
class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', { 'Content-Type' => 'text/html' }, [erb(:index)]]
    when '/advice'
      piece_of_advice = Advice.new.generate
      ['200', { 'Content-Type' => 'text/html' },
       [erb(:advice, message: piece_of_advice)]]
    else
      ['404', { 'Content-Type' => 'text/html' }, [erb(:not_found)]]
    end
  end

  private

  def erb(view, local = {})
    b = binding
    message = local[:message]
    template = File.read("views/#{view}.erb")
    ERB.new(template).result(b)
  end
end
