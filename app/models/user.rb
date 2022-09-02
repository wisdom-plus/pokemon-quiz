# == Schema Information
# Table name: users
#
#
#  id         :bigint           not null, primary key
#  name       :string
#  token      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :answers

  before_save :new_token
  validates :name, presence: true, length: { maximum: 30 }

  private
    def new_token
      self.token = SecureRandom.urlsafe_base64
    end
end
