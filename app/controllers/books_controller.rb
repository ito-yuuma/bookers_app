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
    flash[:notice] = "Book was successfully created."
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)

  end

  def destroy
    flash[:notice] = "Book was successfully created."
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
