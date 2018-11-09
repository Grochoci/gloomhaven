class ScenarioMonster < ActiveRecord::Base
	belongs_to :scenario
	belongs_to :monster
end
