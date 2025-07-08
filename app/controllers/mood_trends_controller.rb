# app/controllers/mood_trends_controller.rb
class MoodTrendsController < ApplicationController
  def index_data(user)
    user.moments
        .joins(:moods)
        .select("DATE(moments.created_at) as date, COUNT(moods.id) as score")
        .group("DATE(moments.created_at)")
        .order("date")
        .map { |record| { date: record.date, score: record.score.to_f.round(2) } }
  end
end
