class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  validates :text, :presence => :true

  def rank_answers
    self.answers.all.sort { |a,b| b.votes.length <=> a.votes.length }
  end
end
