class VkUser
  include Mongoid::Document

  references_many :oversights
  references_many :marks
  references_many :mee_toos

  field :uid
  field :first_name
  field :last_name
  field :sex, :type => Integer
  field :city, :type => Integer
  field :country, :type => Integer
  field :photo 
  field :registered, :type => DateTime

  index :uid, :unique => true

  before_create :update_timestamps, :empty_marks, :empty_mee_too

  def update_timestamps
    self.registered = DateTime.now
  end

  def empty_marks
    self.marks = []
  end

  def empty_mee_too
    self.mee_toos = []
  end

  def name
    name = []
    [self.first_name, self.last_name].each do |n|
      name << n if !n.nil?
    end
    name.join(' ')
  end
end
