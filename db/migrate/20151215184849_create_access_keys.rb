class CreateAccessKeys < ActiveRecord::Migration
  def change
    create_table :access_keys do |t|
      t.string :secret
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
