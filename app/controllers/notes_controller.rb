class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes/new
  def new
    @note = Note.new
    @note_book = NoteBook.find(params[:note_book_id])
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
    @note_book = NoteBook.find(params[:note_book_id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note_book = NoteBook.find(params[:note_book_id])
    @note = @note_book.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to note_book_url(@note_book), notenotice: 'Note was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @note_book = NoteBook.find(params[:note_book_id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_book_url(@note_book), notice: 'Note was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note_book = NoteBook.find(params[:note_book_id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to note_book_url(@note_book), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content, :importance)
    end
end
