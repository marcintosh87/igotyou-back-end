class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/users" do
    user=User.all
    user.order(created_at: :desc).to_json(include: [:hposts, :gposts])

  end

  post '/users' do
    user=User.create({first_name:params[:first_name],last_name:params[:last_name], email:params[:email],phone:params[:phone],city:params[:city],profile_url:params[:profile_url],id:params[:id]})
    user.to_json(include: [:hposts, :gposts])
  end

  post '/help' do
  help=Hpost.create({title:params[:title],h_request:params[:h_request], user_id:params[:user_id]})
  help.to_json

  end

  post '/gratitude' do
    
    grat=Gpost.create({likes:params[:likes],comment:params[:comment], user_id:params[:user_id]})
    grat.to_json
  
  end


  patch '/gratitude/:id' do
  grat=Gpost.find(params[:id])
  grat.update({likes:params[:likes]}) 
  
  end
  get "/gratitude" do
    

    gpost=Gpost.all
    gpost.to_json
  end

  get "/help" do

    hpost=Hpost.all
    hpost.to_json
  end
end
