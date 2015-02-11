class RenameYourEndpointsToHunts < ActiveRecord::Migration
  def change
  	rename_table :your_endpoints, :hunts
  end
end
