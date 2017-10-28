class GroupCart < ApplicationRecord
  belongs_to :group
  has_many :group_line_items, dependent: :destroy
end
