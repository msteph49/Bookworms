class ReviewsController < ApplicationController
    before_action :authenticate_user!, except: %i[new edit]
    before_action :set_book
    before_action :check_if_reviewed, only: [:new, :create]
    before_action :set_review, only: %i[ show edit update destroy ]

    def show
    end

    def new
        @review = current_user.reviews.new
    end

    def edit
    end

    def create
        @review = @book.reviews.new(review_params)
        @review.user = current_user
    
        respond_to do |format|
          if @review.save
            format.html { redirect_to @book, notice: "Review was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
          if @review.update(review_params)
            format.html { redirect_to @review, notice: "Review was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @review.destroy
        respond_to do |format|
          format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
        end
    end

    private
    def check_if_reviewed
      if current_user.reviews.find_by(book: @book)
        redirect_to @book, notice: "already reviewed."
      end
    end

    def set_book
        @book = Book.find(params[:id])
    end

    def set_review
        @review = @book.reviews.find(params[:review_id])
    end

    def review_params
        params.require(:review).permit(:rating, :review)
    end
end
