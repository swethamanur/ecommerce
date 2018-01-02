class Tax < ActiveRecord::Base
	validates_presence_of :name, :percent
	validates_numericality_of :percent

	belongs_to :item
end
