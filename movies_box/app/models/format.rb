class Format < ActiveRecord::Base
  has_many :movies

  validates :name, presence: {
    message: "Name must be informed."
  }

  validates :name, uniqueness: {
    message: "Name must be unique."
  }
end
