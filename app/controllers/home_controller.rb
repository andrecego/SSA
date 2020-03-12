# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @banner = Banner.where('initial_date < ? AND end_date > ?',
                           Time.zone.now, Time.zone.now)
                    .order(end_date: :asc).last
  end

  def eighth_sense; end

  def summon
    @constellations = Constellation.joins(:picture_attachment)
  end
end
