class FoldersController < ApplicationController
    def index
    end

    def create
    end

    def index
    end

    def new
    end

    def edit
    end

    def show
    end

    def destory
    end

    private

    def folder_params
        params.require(:folder).permit(:folderName)

    end

end
