class PartsController < ApplicationController

  def index
    @parts = Part.all
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      redirect_to parts_path
    else
      flash[:alert] = "Erreur"
      render :new
    end
  end

  def destroy
  end

  private

  def part_params
    params.require(:part).permit(:name)
  end
end