class CreateMiniTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :mini_types do |t|
      t.string :name
      t.string :acromyn

      t.timestamps
    end
  end
end
