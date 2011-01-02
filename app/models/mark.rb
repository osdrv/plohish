class Mark
  include Mongoid::Document

  referenced_in :vk_user
  referenced_in :oversight

  field :value, :type => Integer
end
