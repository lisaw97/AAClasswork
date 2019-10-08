class Sub < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User
  
  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs, source: :post

end
