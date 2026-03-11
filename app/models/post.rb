class Post < ApplicationRecord
  belongs_to :author
  has_many   :comments, dependent: :destroy

  validates :title,   presence: true
  validates :slug,    presence: true, uniqueness: true
  validates :excerpt, presence: true
  validates :content, presence: true

  before_validation :generate_slug, on: :create

  scope :published, -> { where(published: true).order(published_at: :desc) }

  private

  def generate_slug
    self.slug ||= title&.parameterize
  end
end
