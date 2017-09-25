class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.string :stripe_id
      t.decimal :amount
      t.integer :status

      t.timestamps
    end
  end
end
