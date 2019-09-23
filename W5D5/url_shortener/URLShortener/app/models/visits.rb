class Visits < ApplicationRecord
  validates :user_id, :shortened_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visits.new(user_id: user.id, shortened_url_id: shortened_url.id)
  end

  belongs_to :user,
    primary_key: :id,
    foreign_key: user_id,
    class_name: Users

  belongs_to :url,
    primary_key: :id,
    foreign_key: shortened_url_id,
    class_name: ShortenedUrls

    
end