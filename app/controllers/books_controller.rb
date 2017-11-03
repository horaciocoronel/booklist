class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html #html is the format this action will respond to
      format.csv do
        csv_data = Book.generate_csv(@books)
        render plain: csv_data
      end
      format.text
      format.json do
        json_data = @books.map {|book|
          {title: book.title, author: book.author, already_read: book.already_read}
        }
        # render json: json_data
        render json: { books: json_data,
                       time: Time.now,
                       count: @books.count }
        end
    end
  end

end
