class SlackUsersController < ApplicationController
  before_action :set_slack_user, only: [:show, :update, :destroy]

  # GET /slack_users
  def index
    @slack_users = SlackUser.all

    render json: @slack_users
  end

  # GET /slack_users/1
  def show
    render json: @slack_user
  end

  # POST /slack_users
  def create
    @slack_user = SlackUser.new(slack_user_params)

    if @slack_user.save
      render json: @slack_user, status: :created, location: @slack_user
    else
      render json: @slack_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /slack_users/1
  def update
    if @slack_user.update(slack_user_params)
      render json: @slack_user
    else
      render json: @slack_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /slack_users/1
  def destroy
    @slack_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slack_user
      @slack_user = SlackUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def slack_user_params
      params.require(:slack_user).permit(:username, :points)
    end
end
