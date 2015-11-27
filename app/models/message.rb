# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  name       :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  validates :name, length: {maximum: 20}, presence: true
  validates :body, length: {minimum: 2, miximum: 50}, presence: true
end
