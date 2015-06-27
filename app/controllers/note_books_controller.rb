class NoteBooksController < ApplicationController
  before_action :set_note_book, only: [:show, :edit, :update, :destroy]

  # GET /note_books
  # GET /note_books.json
  def index
    @note_books = NoteBook.all
  end

  # GET /note_books/1
  # GET /note_books/1.json
  def show
    @note_book = NoteBook.find(params[:id])
  end

  # GET /note_books/new
  def new
    @note_book = NoteBook.new
  end

  # GET /note_books/1/edit
  def edit
  end

  # POST /note_books
  # POST /note_books.json
  def create
    @note_book = NoteBook.new(note_book_params)

    respond_to do |format|
      if @note_book.save
        format.html { redirect_to @note_book, notice: 'Note book was successfully created.' }
        format.json { render :show, status: :created, location: @note_book }
      else
        format.html { render :new }
        format.json { render json: @note_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_books/1
  # PATCH/PUT /note_books/1.json
  def update
    respond_to do |format|
      if @note_book.update(note_book_params)
        format.html { redirect_to @note_book, notice: 'Note book was successfully updated.' }
        format.json { render :show, status: :ok, location: @note_book }
      else
        format.html { render :edit }
        format.json { render json: @note_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_books/1
  # DELETE /note_books/1.json
  def destroy
    @note_book.destroy
    respond_to do |format|
      format.html { redirect_to note_books_url, notice: 'Note book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_book
      @note_book = NoteBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_book_params
      params.require(:note_book).permit(:title, :about)
    end
end
