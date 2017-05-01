class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      falsh[:success] = "<strong>#{@group.name}</strong> created."
      redirect_to groups_path
    else
      flash.now[:warning] = "somthing went wrong"
      render 'new'
    end
  end

  def edit
   @group = Group.find(params[:id])   
  end

  def update
    @group = Group.find(params[id])
    if @group.save
      flash[:success] = "<strong>#{@group.name}</strong> was successfully updated"
      redirect_to groups_path
    else
      flash.now[:warning] = "somthing went wrong"
      render 'edit'
    end
  end
  
  def show
    @group = Group.find(params[:id])
  end

  def destroy
  end
end


def group_params
  params.require(:group).permit(:name, :grade_id)
end
