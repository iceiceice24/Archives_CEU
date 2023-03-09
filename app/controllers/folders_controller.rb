class FoldersController < ApplicationController
    def index
         @folders = Folder.all
    end
  
    def show
        find_folder
    end
  
    def new
        @folder = Folder.new 
    end
  
    def create
        @folder = Folder.new(folder_params)
       
        if @folder.save
          redirect_to folders_path, notice: 'Folder created successfully.'
        else
          render :new
        end
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
  
  
    private
  
    def folder_params
     params.require(:folder).permit(:folderName)
   end
   
  
  end