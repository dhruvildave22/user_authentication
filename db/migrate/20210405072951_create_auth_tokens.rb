class CreateAuthTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :auth_tokens do |t|
      t.references :user, foreign_key: :true
      t.string :token
      t.datetime :expire_at

      t.timestamps

    end
  end
end
