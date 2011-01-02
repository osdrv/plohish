class Oversight
  include Mongoid::Document

  referenced_in :vk_user
  references_many :marks
  references_many :mee_toos

  field :text
  field :rating, :type => Integer
  field :created, :type => DateTime

  validates_presence_of :text

  before_create :update_timesamps, :empty_marks, :empty_mee_too

  @_mee_too_users = nil

  def user
    ''
  end

  def update_timesamps
    self.created = DateTime.now
  end

  def empty_marks
    self.marks = []
  end

  def empty_mee_too
    self.mee_toos = []
  end

  def is_marked_by?(user)
    Mark.all(:conditions => {:vk_user_id => user._id, :oversight_id => self._id}).count > 0
  end

  def duplicated_by_user?(user)
    MeeToo.all(:conditions => {:vk_user_id => user._id, :oversight_id => self._id}).count > 0
  end

  def place_mark(user, mark)
    mark = Mark.create(:mark => mark)
    user.marks << mark
    self.marks << mark
  end

  def mark
    mark = 0
    self.marks.each { |m| mark += m.mark }
    mark
  end

  def mee_too_users
    if @_mee_too_users.nil?
      @_mee_too_users = []
      self.mee_toos.each do |mee_too|
        @_mee_too_users.push(mee_too.vk_user) if !mee_too.vk_user.nil?
      end
    end
    @_mee_too_users
  end

  class << self
    def top(limit = 10)
      Oversight.order_by(:rating).limit(limit).all
    end

    def last(limit = 10)
      Oversight.order_by(:created.desc).limit(limit).all
    end
  end
end
