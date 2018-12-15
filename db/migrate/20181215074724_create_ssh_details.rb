class CreateSshDetails < ActiveRecord::Migration
  def change
    create_table :ssh_details do |t|
      t.string :ssh_username, null: false, unique: true
      t.string :ssh_password, null: false
      t.string :ip_address, null: false, unique: true
      t.string :port, null: false, unique: true
      t.timestamps
    end
  end
end
