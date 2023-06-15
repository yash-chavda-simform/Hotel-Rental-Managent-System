class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_no, :string
    add_column :users, :work, :string
    add_column :users, :gender, :integer
    add_column :users, :pets, :string
    add_column :users, :driving_license_no, :string
    add_column :users, :date_of_birth, :date 
    add_column :users, :verified, :boolean
  end
end
