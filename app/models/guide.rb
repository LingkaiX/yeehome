class Guide < ApplicationRecord
    belongs_to :user
    has_one_attached :cover_image
    validates :cover_image, presence: true
    enum status: [:pending, :published, :removed]
    after_initialize :init
    def init
      self.status ||= 0
    end
end
