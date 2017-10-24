class Group < ApplicationRecord
  belongs_to :user
  has_many :joiners, dependent: :destroy
  has_many :members, dependent: :destroy

  validates :name, length: { in: 3...30, message: 'Название группы в пределах 3...30 символов' }
end
