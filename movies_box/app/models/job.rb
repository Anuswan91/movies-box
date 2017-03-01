class Job < ActiveRecord::Base
  has_many :movie_person

  validates :name, presence: {
    message: "Name must be informed."
  }
end
