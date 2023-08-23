class BooksController < ApplicationController
    def import
        query = params[:query]
        @book_data = GoogleBooksService.search_books(query)
    end
end