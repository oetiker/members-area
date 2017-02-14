class User < ActiveRecord::Base
  has_secure_password

  def admin?
    role == 'admin'
  end

  def changed_password?
    changed_password == true
  end

end
