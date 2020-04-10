class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_displayed }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    render plain: new_user.to_displayed
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists? ? "Logged in Successfully....True" : "Login Failed...Please try again...False"
  end
end
