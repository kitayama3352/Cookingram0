class RemoveCommentIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :Comment_id, :text
  end
end
