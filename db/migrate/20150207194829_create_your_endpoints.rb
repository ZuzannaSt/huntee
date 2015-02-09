class CreateYourEndpoints < ActiveRecord::Migration
  def change
    create_table :your_endpoints do |t|
      t.string :email
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps null: false
    end
  end
end
