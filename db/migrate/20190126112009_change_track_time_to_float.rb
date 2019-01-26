class ChangeTrackTimeToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :time_tracks, :time, :float
  end
end
