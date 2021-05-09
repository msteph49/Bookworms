class AuthorsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_author, only: %i[ show edit update destroy ]

    def index
        @authors = Author.all
    end

    def show
    end

    def new
        @author = Author.new
    end

    def edit
    end

    def create
        @author = Author.new(author_params)
    
        respond_to do |format|
          if @author.save
            format.html { redirect_to @author, notice: "Author was successfully created." }
            else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
          if @author.update(author_params)
            format.html { redirect_to @author, notice: "Author was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @author.destroy
        respond_to do |format|
          format.html { redirect_to authors_url, notice: "Author was successfully destroyed." }
        end
      end
    
      private

        def set_author
          @author = Author.find(params[:id])
        end
    
        def author_params
          params.require(:author).permit(:name)
        end
    end
    
end
