class Restaurant < ActiveRecord::Base

	has_many :reviews, dependent: :destroy

	validates :name, length: { minimum: 3 }, format:{ with: /\A[A-Z]/, message: 'must begin with a capital, you numpty!' }, uniqueness: true

	def average_rating
		return 'N/A' if reviews.none?
    reviews.average(:rating)
	end	
end
