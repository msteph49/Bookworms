class RemoveAuthorAndAuthorIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :author, :string
    remove_column :books, :author_id, :string
  end
end
