class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validate :text, presence: true
end
