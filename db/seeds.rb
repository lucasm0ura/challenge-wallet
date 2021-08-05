# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.find_or_create_by(:name => 'Administrator')
Role.find_or_create_by(:name => 'User')
uid = Rails.env.production? ? ENV['ADMIN_EMAIL'] : "teste@teste.com"
email = Rails.env.production? ? ENV['ADMIN_EMAIL'] : "teste@teste.com"
password = Rails.env.production? ? ENV['ADMIN_PASSWORD'] : "12345678"

@user = User.find_by(email: email)
if @user.nil?
   user = User.create(:name => 'Super User', :uid => uid, :email => email, :password => password, :password_confirmation => password, :role_id => 1, :confirmed_at => Time.now)
   wallet = Wallet.create(:user_id => user.id, :current_balance => 0.0)
   user.wallet_id = wallet.id
   user.save
end