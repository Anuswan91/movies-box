class MovieSubtitle < ActiveRecord::Base
  belongs_to :movie
  belongs_to :subtitle
end
