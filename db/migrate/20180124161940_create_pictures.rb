class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :uuid
      t.text :comment
      t.string :file

      t.timestamps
    end
  end
end
