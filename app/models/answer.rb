class Answer < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :question, inverse_of: :answers
  validates :content, presence: true

end
