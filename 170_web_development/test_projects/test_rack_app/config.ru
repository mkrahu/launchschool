# app = lambda { |env| ['200', { 'Content-Type' => 'text/plain'}, ['Hello world!']] }

# app = Proc.new { |env| ['200', { 'Content-Type' => 'text/plain'}, ['Hello world!']] }

require_relative 'advice'

class App
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', { 'Content-Type' => 'text/html' }, [erb(:index)]]
    when '/advice'
      advice = Advice.new.generate
      ['200', { 'Content-Type' => 'text/html' }, [erb(:advice, advice: advice)]]
    else
      ['404', { 'Content-Type' => 'text/plain' }, ['Unknown resource']]
    end
  end

  private

  def erb(template, locals = {})
    file = File.read("views/#{template}.erb")
    ERB.new(file).result_with_hash(locals)
  end
end

# run app

run App.new
