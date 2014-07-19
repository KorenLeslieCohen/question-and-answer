class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :destroy # what does this do?
  has_many :question_tags
  has_many :tags, through: :question_tags
  accepts_nested_attributes_for :tags
  validates_presence_of :title, :content

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end

end
