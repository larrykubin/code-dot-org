class AddSerializedAttributesAndTypeToTasks < ActiveRecord::Migration
  def change
    add_column :plc_tasks, :type, :string, null: false
    add_column :plc_tasks, :properties, :text, null: false
  end
end
