class SubsController < ApplicationController


  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    # Fail
    if @sub.valid?
      @sub.save
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @sub = Sub.find_by_id(params[:id])
    render :show
  end

  def sub_params
    params.require(:sub).permit(:name, :description)
  end
end
