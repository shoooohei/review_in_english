class PhrasesController < ApplicationController

  def create
    binding.pry

  end


  private
  def phrase_params
    params.require(:phrase).permit(:content,:comment)
  end
end
