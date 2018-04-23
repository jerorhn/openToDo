class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    @item = Item.new(item_params)
    @item.list = @list

    if @item.save
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def set_list
    @list = @item ? @item.list : List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:name, :list, :completed)
  end

end
