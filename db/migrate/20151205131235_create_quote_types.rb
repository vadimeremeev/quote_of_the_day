class CreateQuoteTypes < ActiveRecord::Migration
  def change
    create_table :quote_types do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
