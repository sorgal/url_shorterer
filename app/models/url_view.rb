class UrlView < ApplicationRecord
  belongs_to :url

  validates :remote_ip, presence: true, uniqueness: true
end
