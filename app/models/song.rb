class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: {scope: %i[release_year artist_name], message: 'cannot be repeated by the same artist in the same year'}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, if: :is_released?

  def is_released?
    self.released == true
  end

end
