require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'
require 'pry'

def data_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('./test/data', __dir__)
  else
    File.expand_path('./data', __dir__)
  end
end

def users_path
 if ENV['RACK_ENV'] == 'test'
   File.expand_path('./test/users.yaml', __dir__)
 else
   File.expand_path('./users.yaml', __dir__)
 end
end

configure do
  enable :sessions
  set :session_secret, 'secret'
end

helpers do
  def signed_in?
    session[:username]
  end

  def dup_doc_filename(file_name)
    "#{File.basename(file_name, '.*')}_v2#{File.extname(file_name)}"
  end
end

def redirect_with_unauthorized_message
  session[:message] = 'You must be signed in to do that.'
  redirect '/'
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(file_path)
  file = File.read(file_path)
  case File.extname(file_path)
  when '.md'
    erb render_markdown(file)
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    file
  else
    "#{File.extname(file_path)} file format not supported..."
  end
end

def load_users
  YAML.load_file(users_path)
end

def add_user(username, password)
  users = load_users

  password_hash = BCrypt::Password.create(password).to_s
  users[username] = { 'password' => password_hash}

  updated_users = YAML.dump(users)
  File.write(users_path, updated_users)
end

def password_matches?(username, password)
  users = load_users

  if users[username]
    encrypted_password = users[username]['password']
    BCrypt::Password.new(encrypted_password) == password
  else
    false
  end
end

def validate_user_signup(username, password, confirm_password)
  errors = []
  users = load_users

  # Validate username
  if username.strip.empty?
    errors << 'Username must not be blank'
  elsif users.keys.include?(username)
    errors << 'Username is unavailable, please pick a new username'
  elsif username.length > 20
    errors << 'Username must be 20 characters or less'
  end

  if password != confirm_password
    errors << 'Passwords provided do not match'
  end

  errors
end

# Display index page
get '/' do
  pattern = File.join(data_path, '*')
  @files = Dir.glob(pattern).map do |file_name|
    File.basename(file_name)
  end

  erb :index
end

# Render new doc form
get '/new' do
  redirect_with_unauthorized_message unless signed_in?

  erb :new
end

# Create new file
post '/new' do
  redirect_with_unauthorized_message unless signed_in?

  if params[:file_name].strip.empty?
    session[:message] = 'A name is required.'
    status 422
    erb :new
  else
    file_path = File.join(data_path, params[:file_name])

    File.write(file_path, "")

    session[:message] = "#{params[:file_name]} was created."
    redirect '/'
  end
end

# Display file
get '/:file_name' do
  file_path = File.join(data_path, params[:file_name])

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:file_name]} does not exist."
    redirect '/'
  end
end

# Edit file
get '/:file_name/edit' do
  redirect_with_unauthorized_message unless signed_in?

  file_path = File.join(data_path, params[:file_name])

  if File.exist?(file_path)
    @filename = params[:file_name]
    @content = File.read(file_path)
    erb :edit
  else
    session[:message] = "#{params[:file_name]} does not exist."
    redirect '/'
  end
end

# Update file
post '/:file_name' do
  redirect_with_unauthorized_message unless signed_in?
  file_path = File.join(data_path, params[:file_name])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:file_name]} has been updated"
  redirect '/'
end

# Delete file
post '/:file_name/destroy' do
  redirect_with_unauthorized_message unless signed_in?

  file_name = params[:file_name]
  file_path = File.join(data_path, file_name)

  File.delete(file_path)

  session[:message] = "#{file_name} has been deleted."
  redirect '/'
end

# Duplicate file form
get '/:file_name/duplicate' do
  redirect_with_unauthorized_message unless signed_in?

  erb :duplicate
end

# Create duplicate file
post '/:file_name/duplicate' do
  redirect_with_unauthorized_message unless signed_in?

  file_name = params[:file_name]
  destination_name = params[:dup_file_name].strip

  if destination_name == params[:file_name]
    session[:message] = 'You cannot name duplicate file the same name as the current file.'
    status 422
    erb :duplicate
  else
    copy_file = File.join(data_path, file_name)
    destination = File.join(data_path, destination_name)

    FileUtils.cp copy_file, destination

    session[:message] = "#{file_name} has been copied to #{destination_name}"
    redirect '/'
  end
end

# Render signin page
get '/users/signin' do
  erb :signin
end

# Validate and sign in user
post '/users/signin' do
  username = params[:username]

  if password_matches?(username, params[:password])
    session[:username] = params[:username]

    session[:message] = 'Welcome!'
    redirect '/'
  else
    session[:message] = 'Invalid credentials'
    status 422
    erb :signin
  end
end

# Signout user
post '/users/signout' do
  session.delete(:username)

  session[:message] = 'You have been signed out.'
  redirect '/'
end

# Signup user
get '/users/signup' do
  erb :signup
end

# Validate and create user after signup
post '/users/signup' do
  username = params[:username]
  password = params[:password]
  confirm_password = params[:confirm_password]

  errors = validate_user_signup(username, password, confirm_password)
  if errors.empty?
    add_user(username, password)
    session[:username] = username

    session[:message] = "Welcome to the CMS site, #{username}!"
    redirect '/'
  else
    session[:message] = errors.join(', ')
    status 422
    erb :signup
  end
end
