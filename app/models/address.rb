class Address < ActiveRecord::Base

	validates_presence_of :details, :landmark, :city, :state, :pincode
	validates_length_of :details, within: 5..250
	validates_numericality_of :pincode

	belongs_to :user
end
