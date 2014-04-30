class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end
end
