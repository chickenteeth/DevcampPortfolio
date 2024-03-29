class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  has_many :comments, dependent: :destroy

  belongs_to :topic, optional: true

  def self.recent
		order("created_at DESC")
	end  
end
