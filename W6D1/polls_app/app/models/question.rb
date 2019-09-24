# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  poll_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :poll_id, :body, presence: true

  belongs_to :poll,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    foreign_key: :question_id,
    class_name: :AnswerChoice
end
