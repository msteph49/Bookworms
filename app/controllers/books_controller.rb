class BooksController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    def new
        @book = Book.new
    end
end
