class ZombiesController < ApplicationController
  before_action :set_zombie, only:[:show, :edit, :update]

  def index
    @zombie = Zombie.all
  end

  def show

  end

  def new
    @zombie = Zombie.new
  end

  def create
    zombie = Zombie.new(zombie_params)
    if zombie.save
      flash[:notice] = "You successfully saved a zombie"
      redirect_to zombie_path(zombie)
    else
      @zombie = zombie
      render :new
    end
  end

  def edit
  end

  def update
    if @zombie.update(zombie_params)
      flash[:notice] = "You successfully updated your zombie"
      redirect_to zombie_path(@zombie)
    else
      render :edit
    end
  end

  def destroy
    zombie = Zombie.find(params[:id])
    zombie.destroy
    flash[:notice] = "You killed a zombie!"
    redirect_to zombies_path
  end

  private

  def zombie_params
    params.require(:zombie).permit(:name, :age)
  end

  def set_zombie
    @zombie = Zombie.find(params[:id])
  end
end
