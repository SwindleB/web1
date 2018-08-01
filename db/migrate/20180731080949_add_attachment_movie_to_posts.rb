class AddAttachmentMovieToPosts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :posts do |t|
      t.attachment :movie
    end
  end

  def self.down
    remove_attachment :posts, :movie
  end
end
