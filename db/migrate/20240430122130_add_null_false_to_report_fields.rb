class AddNullFalseToReportFields < ActiveRecord::Migration[5.0]
  def change
    change_column_null :reports, :title, false
    change_column_null :reports, :description, false
    change_column_null :reports, :template, false
    change_column_null :reports, :sensor_id, false
    change_column_null :reports, :sensor_type, false
    change_column_null :reports, :sensor_name, false
  end
end
