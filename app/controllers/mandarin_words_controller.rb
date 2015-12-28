class MandarinWordsController < ApplicationController
  def index
    render json: MandarinWord.search(params[:query], params[:mode])
  end
end
