class ReportsController < ApplicationController
    def index
      @reports = Report.all
    end

    def show
      @report = Report.find(params[:id])
    end

    def new
      @report = Report.new
    end

    def create
      @report = Report.new(report_params)

      if @report.save
        redirect_to reports_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def report_params
      params.require(:report).permit(:title, :description, :template, :sensor_name, :sensor_type, :sensor_id)
    end
end
