class ActorsController < ApplicationController
  respond_to :html

  def index
    @actors = Actor.order(:name).all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def create
    @actor = Actor.new(params[:actor])

    if @actor.save
      redirect_to @actor, notice: 'Actor was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @actor = Actor.find(params[:id])

    if @actor.update_attributes(params[:actor])
      redirect_to @actor, notice: 'Actor was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
  end
end
