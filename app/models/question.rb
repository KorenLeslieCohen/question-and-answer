class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :destroy # what does this do?
  has_many :question_tags
  has_many :tags, through: :question_tags
  accepts_nested_attributes_for :tags
  validates_presence_of :title, :content

#   def self.search(search)
#     # if search
#       # find(@questions, :conditions => ['content LIKE ?', "%#{search}%"])
#     # else
#       # find(:all)
#       # notice: "Sorry"
#       # format.html { redirect_to @question, notice: 'Question was successfully created.' }

#   if search
#     find(:all, :conditions => ["title LIKE ?", "%#{search}%"]) 
#     # if @question.size.zero? 
#     #   @question = Question.find("all") 
#     # end 
#   else 
#     find(:all) 
#   end

# end

  def self.search(search)
# where(:title, query) -> This would return an exact match of the query
where("title like ?", "%#{search}%") 
where("content like ?", "%#{search}%")
end
  

end


 
