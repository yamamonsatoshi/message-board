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
end
