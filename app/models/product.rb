class Product < ApplicationRecord
  before_create :generate_id

  has_many :lean_canvases

  protected
    def generate_id
      self.id = SecureRandom.alphanumeric(8)
    end
end
