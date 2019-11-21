# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # private method that loads stuff

  private

  def navigation_pages
    @navigation_pages = Page.where(show_in_navbar: true)
  end
  helper_method :navigation_pages
end
