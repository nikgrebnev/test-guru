class AddAnswerCorrectColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :correct, from: nil, to: false)
  end
end
