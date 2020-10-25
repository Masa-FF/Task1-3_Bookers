class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :name
      t.text :opinion

      t.timestamps
    end
  end
end
