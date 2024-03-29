class PlantTagsController < ApplicationController
  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
    @tags = Tag.where.not(id: @plant.tags)
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new(plant_tag_params)
    @plant_tag.plant = @plant
    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
