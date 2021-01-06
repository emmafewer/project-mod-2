class AddImageAndBirthdateToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :image, :text
    add_column :pets, :birthdate, :datetime
  end
end
