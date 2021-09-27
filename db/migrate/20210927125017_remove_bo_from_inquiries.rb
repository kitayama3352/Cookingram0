class RemoveBoFromInquiries < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiries, :bo, :text
  end
end
