class ActorsController < ApplicationController
  load_and_authorize_resource

  respond_to :html

  def index
    @actors = Actor.order(:name).all
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def edit
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

    redirect_to actors_path, notice: 'Actor was successfully deleted.'
  end
end
