class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes
  validate :text, presence: true

end
