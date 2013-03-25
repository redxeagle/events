require 'fileutils'

class Admin::AssetsController  < ApplicationController
  access_control do
    allow :admin
  end

  def new
    @asset = Asset.new
    @events = Event.all.map{|event| [event.name, event.id]}
  end

  def create
    tmp = params[:asset][:file].tempfile
    file = File.join("public/assets", params[:asset][:file].original_filename)

    FileUtils.cp tmp.path, file

    asset = Asset.new(params[:asset])
    asset.filename = asset.file.original_filename
    if asset.save
       flash[:notice] = "neues Asset angelegt!"
       redirect_to root_path
    else
       render :action => :new
    end
  end
end