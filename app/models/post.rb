class Post < ApplicationRecord
	has_one :picture, as: :imageable, dependent: :destroy
	accepts_nested_attributes_for :picture
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
end
