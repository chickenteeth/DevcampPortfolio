class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :delete_all
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  acts_as_list
  
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, -> {
    where(subtitle: 'Ruby on Rails')
  }
end