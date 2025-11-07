class AddInternshipFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :motivation_statement, :text
    add_column :users, :current_degree_program, :string
    add_column :users, :expected_graduation_year, :integer
    add_column :users, :key_courses_and_projects, :text
    add_column :users, :academic_achievements, :text
    add_column :users, :preferred_duration, :string
    add_column :users, :on_site_or_remote, :string
    add_column :users, :planned_working_hours_per_week, :integer
    add_column :users, :type_of_internship, :string
    add_column :users, :language_competences, :text
  end
end
