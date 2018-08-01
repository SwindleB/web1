class Post < ActiveRecord::Base
    belongs_to :user 
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 140 } # tweets are capped at 140 chars.
    default_scope -> { order(created_at: :desc) } # newest tweets / posts first
    has_attached_file :photo, styles: {large: "450x450>", thumb: "50x50#"}
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

has_attached_file :music
validates_attachment :music,
:content_type => {:content_type => ["audio/mpeg", "audio/mp3"]},
:file_type => {:matches => [/mp3\Z/]}

has_attached_file :movie, :styles =>
{
    :medium => {:geometry => "640x480", :format => 'mp4'},
    :thumb => {:geometry => "100x50#", :format => 'jpg', :time => 10}

}, :processors => [:transcoder]
validates_attachment_content_type :movie, content_type: /\Avideo\/.*\z/

end
