class Category < ApplicationRecord
  has_many :advertisements
  validates_presence_of :descricao
end
