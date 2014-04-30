class Event < ActiveRecord::Base
  attr_accessible :address, :city, :description, :state, :time, :title, :url, :venue, :zip

  #just_define_datetime_picker :time, :add_to_attr_accessible => true
  validates :time, :presence => true


  scope :upcoming, where("time >= ?", Time.now).order("time")
  #scope :next_three, where("time >= ?", Time.now).order("time").limit(3)
end
