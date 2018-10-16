class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [ true, false ] }
  # with_options if: :is_released? do |year|
  #   year.validates :release_year, presence: true
  #   year.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }
  # end
  validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, if: :is_released?
  validates :artist_name, presence: true

  def is_released?
    self.released == true
  end
end
