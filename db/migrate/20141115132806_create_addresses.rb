class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address1, null: false
      t.text :address2
      t.string :city, null: false, default: ""
      t.string :state, null: false, default: ""
      t.string :country, null: false, default: ""
      t.string :zipcode, null: false, default: ""
      t.belongs_to :user
      t.timestamps
    end
  end
end
