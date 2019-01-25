class CreateTimeTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :time_tracks do |t|
      t.integer :time
      t.references :user, foreign_key: true
      t.string :page

      t.timestamps
    end
  end
end
