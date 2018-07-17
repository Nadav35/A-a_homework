class Toy < ApplicationRecord
  belongs_to :toyable, polymorphic: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: [:toyable]}
end
