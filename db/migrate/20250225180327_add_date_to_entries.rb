class AddDateToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :date, :date
  end
end
