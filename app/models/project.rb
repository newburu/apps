class Project < ApplicationRecord
  belongs_to :user
  acts_as_list scope: :user
  default_scope { order(position: :asc) }
  scope :visible, -> { where(visible: true) }

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :url, presence: true, length: { maximum: 2048 }, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true }
  validates :image_data, length: { maximum: 2048 }, allow_blank: true, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true }
end
