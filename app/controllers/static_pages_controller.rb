class StaticPagesController < ApplicationController
  def index
    @note_books = NoteBook.all
  end
end
