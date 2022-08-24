class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :content, default: '解答なし'
      t.bigint :poke_id
      t.boolean :correct, default: false
      t.timestamps
    end
  end
end
