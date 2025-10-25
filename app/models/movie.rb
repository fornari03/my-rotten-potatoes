class Movie < ApplicationRecord
  validates :title, presence: true
  validates :release_date, presence: true

  def self.all_ratings
    %w[G PG PG-13 R NC-17]
  end
end
