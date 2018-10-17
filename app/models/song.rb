class Song < ActiveRecord::Base

  validates :title, presence: true
  validates_uniqueness_of :title, scope: %i[artist_name release_year]
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validates_numericality_of :release_year, :less_than_or_equal_to => Date.today.year

  def released?
    released
  end

end
