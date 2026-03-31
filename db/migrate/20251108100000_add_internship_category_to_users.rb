class AddInternshipCategoryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :internship_category, :string
  end
end
