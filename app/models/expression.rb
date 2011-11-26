class Expression < ActiveRecord::Base
  before_validation :generate_permalink

  attr_accessible :permalink, :expression, :modifiers, :testdata

  validates_presence_of :permalink, :expression

  def to_param
    id
  end

  def id
    permalink
  end

  protected

    def generate_permalink
      self.permalink = (1..6).map { (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a)[rand(62)] }.join
    end
end
