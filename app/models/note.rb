class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :importance, type: Integer

  validates :content, presence: true
  validates :importance, presence: true, :inclusion => {:in => [1, 2, 3, 4, 5]}

  belongs_to :note_book

end
