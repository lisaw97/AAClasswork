# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrls < ApplicationRecord
  validates :long_url, :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrls.exists?(code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create!(user, long_url)
    ShortenedUrls.new(long_url: long_url, short_url: ShortenedUrls.random_code, user_id: user.id)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visitors,
    primary_key: :id,
    foreign_key: shortened_url_id,
    class_name: Visits
  end
