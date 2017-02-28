class Movie < ActiveRecord::Base
  belongs_to :format
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :subtitles
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :persons

  validates :title, presence: {
    message: "Title must be informed."
  }
end
