# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  name       :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  age        :integer
#

class Message < ActiveRecord::Base
  validates :name, length: {maximum: 20}, presence: true
  validates :body, length: {minimum: 2, miximum: 50}, presence: true
  validates :age,  numericality: { only_integer: true, greater_than_or_equal_to: 0}, presence: true
end
