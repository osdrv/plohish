class Oversight
  include Mongoid::Document
  referenced_in :vk_user
end
