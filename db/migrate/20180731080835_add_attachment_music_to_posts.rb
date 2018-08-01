class AddAttachmentMusicToPosts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :posts do |t|
      t.attachment :music
    end
  end

  def self.down
    remove_attachment :posts, :music
  end
end
