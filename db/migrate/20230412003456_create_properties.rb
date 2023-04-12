class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.text :name
      t.text :rent
      t.text :adress
      t.text :age
      t.text :remark

      t.timestamps
    end
  end
end
