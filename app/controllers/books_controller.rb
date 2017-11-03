class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html #html is the format this action will respond to
      format.csv
      format.text
    end
  end

end
