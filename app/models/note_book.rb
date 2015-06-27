class NoteBook
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :about, type: String

  validates :title, presence: true
  validates :about, presence: true

  has_many :notes, dependent: :destroy

end
