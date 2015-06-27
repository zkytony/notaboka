require 'test_helper'

class NoteBooksControllerTest < ActionController::TestCase
  setup do
    @note_book = note_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:note_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create note_book" do
    assert_difference('NoteBook.count') do
      post :create, note_book: { about: @note_book.about, title: @note_book.title }
    end

    assert_redirected_to note_book_path(assigns(:note_book))
  end

  test "should show note_book" do
    get :show, id: @note_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @note_book
    assert_response :success
  end

  test "should update note_book" do
    patch :update, id: @note_book, note_book: { about: @note_book.about, title: @note_book.title }
    assert_redirected_to note_book_path(assigns(:note_book))
  end

  test "should destroy note_book" do
    assert_difference('NoteBook.count', -1) do
      delete :destroy, id: @note_book
    end

    assert_redirected_to note_books_path
  end
end
