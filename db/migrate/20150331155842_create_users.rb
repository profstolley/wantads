class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :location
      t.string :image
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
