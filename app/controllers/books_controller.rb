class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
    if  book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(book.id)
    else
        @book = Book.find(params[:id])
        flash.now[:notice] = "error.Book was not updated."
        render :edit
    end
  end

  def destroy
    flash[:notice] = "Book was successfully destroyed."
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
