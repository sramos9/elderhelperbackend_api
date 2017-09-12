class ApplicationController < ActionController::API

  def authenticate_token
     puts "AUTHENTICATE JWT"
     render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
   end

   def bearer_token
     puts "BEARER TOKEN"
     puts header = request.env["HTTP_AUTHORIZATION"]

     pattern = /^Bearer /
     puts "TOKEN WITHOUT BEARER"
     puts header.gsub(pattern, '') if header && header.match(pattern)
     header.gsub(pattern, '') if header && header.match(pattern)
   end

   def decode_token(token_input)
     puts "DECODE TOKEN, token input: #{token_input}"
     puts token = JWT.decode(token_input, ENV["JWT_SECRET"], true, { :algorithm => 'HS256'})
     JWT.decode(token_input, ENV["JWT_SECRET"], true, { :algorithm => 'HS256'})
   rescue
     render json: { status: 401, message: 'Unauthorized' }
   end

   def get_current_elder
     return if !bearer_token
     decoded_jwt = decode_token(bearer_token)
     Elder.find(decoded_jwt[0]["elder"]["id"])
   end

   def authorize_elder
     puts "AUTHORIZE ELDER"
     puts "elder id: #{get_current_elder.id}"
     puts "params: #{params[:id]}"
     render json: { status: 401, message: 'Unauthorized'} unless get_current_elder.id == params[:id].to_i
   end

end
