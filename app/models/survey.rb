class Survey < ApplicationRecord
    has_many :questions
    validates :title, presence: true
    before_save :captitalize_survey

    private
			def captitalize_survey
				self.title = self.title.capitalize
			end
end
