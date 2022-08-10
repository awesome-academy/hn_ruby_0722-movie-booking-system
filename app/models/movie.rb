class Movie < ApplicationRecord
  enum status: {inactive: 0, active: 1}
  belongs_to :genre
  has_many :ratings, dependent: :destroy
  has_many :shows, dependent: :destroy
  has_one_attached :image

  scope :showing_movie, ->{where status: 1}
  scope :incoming_movie, ->{where status: 0}
  scope :release, ->{where "release_date > ?", Time.zone.now}
  scope :limitation, ->{limit 6}
end
