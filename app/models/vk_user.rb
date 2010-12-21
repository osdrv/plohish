class VkUser
  include Mongoid::Document
  references_one :oversight
end
