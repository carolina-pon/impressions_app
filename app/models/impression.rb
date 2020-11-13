class Impression < ApplicationRecord
  validates :title, presence: true
  validate :validate_title_not_including_comma

  belongs_to :user
  belongs_to :category

  private
  
  def validate_title_not_including_comma
    errors.add(:title, 'にカンマを含めることはできません') if title&.include?(',')
  end
end
