module Gloomhaven
	class MonstersController < ApplicationController

	  def index
	  	@scenario = Scenario.first
	  end

	end
end