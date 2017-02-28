class Subtitle < ActiveRecord::Base
  has_and_belongs_to_many :movies

  validates :name, presence: {
    message: "Name must be informed."
  }

  validates :name, uniqueness: {
    message: "Name must be unique."
  }
end
