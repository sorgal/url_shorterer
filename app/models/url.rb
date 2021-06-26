class Url < ApplicationRecord
  has_many :url_views, dependent: :destroy

  validates :url, :slug, presence: true
  validates :slug, uniqueness: true

  before_validation :generate_slug

  def update_stat(ip)
    increment!(:views_count)
    url_views.create(remote_ip: ip)
  end

  private

  def generate_slug
    self.slug = SecureRandom.uuid[0..5] if slug.blank?
  end
end
