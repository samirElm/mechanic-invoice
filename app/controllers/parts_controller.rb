# class PartsController < ApplicationController

#   def index
#     @parts = current_user.parts
#   end

#   def new
#     raise
#     @part = current_user.parts.build
#   end

#   def create
#     @part = current_user.parts.build(part_params)

#     if @part.save
#       redirect_to parts_path
#     else
#       flash[:alert] = "Erreur"
#       render :new
#     end
#   end

#   def destroy
#   end

#   private

#   def part_params
#     params.require(:part).permit(:name)
#   end
# end