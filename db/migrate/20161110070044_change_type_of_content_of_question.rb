# frozen_string_literal: true

# Change column type to text.
class ChangeTypeOfContentOfQuestion < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :content, :text
  end
end
