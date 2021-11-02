class AddCustomresponsesToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :custom_responses, :bool, default: false
  end
end
