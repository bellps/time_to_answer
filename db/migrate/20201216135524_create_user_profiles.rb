class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :address
      t.references :gender, foreign_key: true
      t.date :birthdate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
