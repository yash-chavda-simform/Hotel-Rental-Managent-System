class ChangeFacilitiesColumnTypeInProperties < ActiveRecord::Migration[7.0]
  def up
    add_column :properties, :facility, :string, array: true, default: []
  end
end
