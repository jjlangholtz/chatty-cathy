class User < ActiveRecord::Base
  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
