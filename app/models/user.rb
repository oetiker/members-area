class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :presence => true
  validates :choir_active, :choir_passive, :inclusion => {:in => [true, false]}

  def self.search(query)
    where "first_name LIKE :q OR last_name LIKE :q OR email LIKE :q", {q: '%'+query+'%'}
  end

  def admin?
    role == 'admin'
  end

  def changed_password?
    changed_password == true
  end

end
