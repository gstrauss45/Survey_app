class AddPossibleAnswersToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :possible_answers, :text, array: true, default: []
  end
end
