class ProgressController < ApplicationController
  def index
    @mood_trend_data = MoodTrendsController.new.index_data(current_user)
  end
end
