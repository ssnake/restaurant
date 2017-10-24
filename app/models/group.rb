class Group < ApplicationRecord
  belongs_to :user

  validates :name, length: { in: 3...30, message: 'Название группы в пределах 3...30 символов' }
end
