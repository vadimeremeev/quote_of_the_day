class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
    	t.belongs_to :quote_types
    	t.string :title
      t.timestamps null: false
    end
  end
end
