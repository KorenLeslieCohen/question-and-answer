class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  # validate_presense_of :content
end
