class DynamicContent < ActiveRecord::Base
  attr_accessible :key, :title, :value

  #validations
  validates_presence_of :key, :title, :value

  def self.get_value_in_displayable_format key
    value = get_value key
    value.lines.collect{|line| "<p>#{line}</p>"}.join("")
  end

  def self.get_value key
    dynamic_content = DynamicContent.where(key: key).first
    return dynamic_content.value if !dynamic_content.nil?
    return "Value missing for key #{key}"
  end

  def self.get_raw_value key
    DynamicContent.where(:key => key).first.try(:value)
  end
end
