class Link < ActiveRecord::Base
  validates :original, presence: true, format: { with: /\A^((http|https):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$\z/i, message: "Invalid URL" }

  after_create :tinify

  def getTinyUrl
    "#{Rails.application.config.appHost}/#{self.tinyfied}"
  end

  def getTinyUrlInfo
    "#{Rails.application.config.appHost}/#{self.tinyfied}/info"
  end

  private

    def tinify
      self.tinyfied = HashidsI.encode(self.id)
      self.save
    end
end
