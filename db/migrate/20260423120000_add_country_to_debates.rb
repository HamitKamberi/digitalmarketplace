class AddCountryToDebates < ActiveRecord::Migration[7.0]
  def change
    add_column :debates, :country, :string
  end
end
