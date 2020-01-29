# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @banner = Banner.where('initial_date < ? AND end_date > ?',
                           Time.now, Time.now).order(end_date: :asc).last
  end
end
