class AddSuperadmin < ActiveRecord::Migration[7.0]
  def change
    User.create! do |u|
      u.email     = 'demo@yopmail.com'
      u.password  = '123456'
      u.superadmin_role = true
    end
  end
end
