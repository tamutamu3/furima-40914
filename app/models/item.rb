class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prepare_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, format: { with: /\A\d+\z/, message: 'は半角数値のみ入力できます' }, allow_blank: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :prepare
end
