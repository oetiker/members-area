class Song < ActiveRecord::Base
  validates :title, :composer, :number, :presence => true 
  validates :sopran, :alt, :tenor, :bass, :inclusion => {:in => [true, false]}

  def self.search(query)
    where "title LIKE :q OR composer LIKE :q OR number LIKE :q", {q: '%'+query+'%'}
  end
end
