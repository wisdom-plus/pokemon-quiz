class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.bigint :poke_id
      t.timestamps
    end
  end
end
