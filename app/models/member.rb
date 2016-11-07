class Member < ActiveRecord::Base
  validates :first_name, :last_name, :email, :presence => true 
  validates :choir_active, :inclusion => {:in => [true, false]}
  # has_many :voice

  def self.search(query)
    where "first_name LIKE :q OR last_name LIKE :q OR email LIKE :q OR voice LIKE :q", {q: '%'+query+'%'}
  end

end

# class Voice < ActiveRecord::Base
#   belongs_to :member
# end

