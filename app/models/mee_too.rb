class MeeToo
  include Mongoid::Document

  field :joined, :type => DateTime

  referenced_in :vk_user
  referenced_in :oversight

  before_create :update_timestamp

  def update_timestamp
    self.joined = DateTime.now
  end
end
