class Product < ApplicationRecord
  before_create :generate_id

  protected
    def generate_id
      self.id = SecureRandom.alphanumeric(8)
    end
end
