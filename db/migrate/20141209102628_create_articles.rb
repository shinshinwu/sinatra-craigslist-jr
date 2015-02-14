class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :category
      t.string :title
      t.integer :price
      t.string :location
      t.string :content
      t.string :email
      t.string :secret_link
      t.timestamps
    end
  end
end
