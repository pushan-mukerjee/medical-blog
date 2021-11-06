class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user
  validates :title, presence: {message: 'cannot be blank'}, length: { minimum: 5, maximum: 100, message: 'must be between 5 and 100 characters'}
  validates :text, presence: true, length: { minimum: 10, maximum: 300, message: 'must be between 10 and 300 characters' }
end
