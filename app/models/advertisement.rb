class Advertisement < ApplicationRecord
  mount_uploaders :imagens, AdvertisementImageUploader
  validates_presence_of :titulo, :descricao, :preco, :imagens
  belongs_to :category
  belongs_to :user
end
