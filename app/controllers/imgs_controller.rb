class ImgsController < ApplicationController
    def create
      if params[:file].class == ActionDispatch::Http::UploadedFile
        respond_to do |format|
          puts params[:filename]
          path = Rails.root.join('public', 'imgs', Date.today.strftime('%Y%m'))
          FileUtils.mkdir_p(path) unless File.exist?(path) 
          filename = "#{SecureRandom.uuid}#{File.extname(params[:file].original_filename)}"
          File.open(File.join(path, filename), "wb") do |f|   
            f.write(params[:file].tempfile.read)  
          end 
          format.json { render json: { "location": "/imgs/#{Date.today.strftime('%Y%m')}/#{filename}" }.to_json, status: :ok }
        end
      end
    end
  end