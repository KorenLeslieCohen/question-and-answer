class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :destroy # destroys associated answers when question destroyed
  has_many :question_tags
  has_many :tags, through: :question_tags
  accepts_nested_attributes_for :tags
  validates_presence_of :title, :content

  def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    Question.where("title ILIKE ?", "%#{search.capitalize}%")
    # Question.where("content LIKE ?", "%#{search}%") 
  end

  def previous
    Question.where(["id > ?", id]).first
  end

  def next
    Question.where(["id < ?", id]).last
  end
  

end


 
