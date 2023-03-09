class FoldersController < ApplicationController
    def home
        @folders = folder.all
    end
   
   def index
      @folders = current_user.folders
   end
 
   def show
       find_folder
   end
 
   def new
       @folder = Folder.new 
   end
 
   def create
        #@folder = current_user.folders.new(folder_params)
       # @folder.user_id = current_user.id
        @folder = folder.new(folder_params)
      
       if @folder.save
           redirect_to '/folders', notice: 'Created'
       else
           redirect_to '/folders', notice: 'Error'
       end
 
   end
 
   def edit
       find_folder
   end
 
   def update
       find_folder
           if @folder.update(folder_params)
              
               redirect_to '/folders', notice: 'Updated'
           else
               render :edit
       end
   end
 
   def destroy
       find_folder
       @folder.destroy
       redirect_to '/folders', notice: 'Deleted' 
   end
 
   def remove_image
     @folder = folder.find(params[:id])
     @folder.image.purge
     redirect_to @folder
   end
 
   def remove_pictures
     @folder = folder.find(params[:id])
     @folder.pictures.purge
     redirect_to @folder
   end
 
 
   private
 
   def folder_params
       params.require(:folder).permit(:toyName, :content, :price, :email, :image, pictures: [])
   end
 
   def find_folde
     @folder = folder.find(params[:id])
   end
 
 end
