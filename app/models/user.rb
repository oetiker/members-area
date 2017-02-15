class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :presence => true

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
