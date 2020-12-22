class CreateGenders < ActiveRecord::Migration[5.0]
  def change
    create_table :genders do |t|
      t.string :description

      t.timestamps
    end
  end
end
