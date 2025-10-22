class CreateUsersProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :users_profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthdate, null: false
      t.string :lang

      t.references :user, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
