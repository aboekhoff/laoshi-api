class CreateMandarinWords < ActiveRecord::Migration
  def change
    create_table :mandarin_words do |t|
      t.string :simplified
      t.string :traditional
      t.string :pinyin
      t.string :pretty_pinyin
      t.text :english
    end
  end
end
