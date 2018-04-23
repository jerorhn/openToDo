class Api::ListsController < ApiController
  before_action :authenticated?
  before_action :set_user

  def create
    list = List.new(list_params)
    list.user = @user
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def list_params
    params.require(:list).permit(:title, :user_id, :private)
  end

end
