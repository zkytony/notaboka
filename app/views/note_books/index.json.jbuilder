json.array!(@note_books) do |note_book|
  json.extract! note_book, :id, :title, :about
  json.url note_book_url(note_book, format: :json)
end
