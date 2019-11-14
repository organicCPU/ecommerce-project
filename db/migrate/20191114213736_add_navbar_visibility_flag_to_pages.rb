# frozen_string_literal: true

class AddNavbarVisibilityFlagToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :show_in_navbar, :boolean
  end
end
