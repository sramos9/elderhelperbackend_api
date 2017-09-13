class EldersController < ApplicationController
  before_action :set_elder, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_elder, except: [:login, :create, :index]

  #elder login, /login
  def login
    # puts 'testing'
    # puts params[:elders][:username]
    elder = Elder.find_by(username: params[:elder][:username])
    # puts 'on line 10'
    # puts elder
    if elder && elder.authenticate(params[:elder][:password])
      # puts 'line 14'
      token = create_token(elder.id, elder.username)
      render json: {status: 200, token: token, elder: elder}
    else
      # puts 'inside of else line 18'
      render json: {status: 401, message: "Unauthorized"}
    end
end


  # GET /elders
  def index
    puts 'index'
    @elders = Elder.all

    render json: @elders.to_json(include: :tasks)
  end

  # GET /elders/1
  def show
     render json: @elder
     #.to_json(include: :tasks)
    # render json: get_current_elder
  end

  # POST /elders
  def create
    @elder = Elder.new(elder_params)


    if @elder.save
      render json: @elder, status: :created, location: @elder
    else
      render json: @elder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /elders/1
  def update
    if @elder.update(elder_params)
      render json: @elder
    else
      render json: @elder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /elders/1
  def destroy
    @elder.destroy
  end

  private

  def create_token(id, username)
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload(id, username)
    {
      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      elder: {
        id: id,
        username: username
      }
    }
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_elder
      @elder = Elder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def elder_params
      params.require(:elder).permit(:name,  :email, :username, :password)
    end
end
