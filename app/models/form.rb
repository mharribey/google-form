class Form < ApplicationRecord
  has_many :questions, inverse_of: :form
  has_many :answers, through: :questions
  validates :title, presence: true

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  def self.answered(form, user)
    user.answers.each do |answer|
      if form.id == answer.question.form_id
        return true
      end
    end
  end
end
