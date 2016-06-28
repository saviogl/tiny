class Link < ActiveRecord::Base
  validates :original, presence: true, format: { with: URI.regexp, message: "Invalid URI" }

  after_create :tinify

  def getTinyUrl
    "#{Rails.application.config.appHost}/#{self.tinyfied}"
  end

  private

    def tinify
      self.tinyfied = HashidsI.encode(self.id)
      self.save
    end
end
