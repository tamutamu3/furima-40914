class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :prepare_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
