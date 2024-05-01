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
        redirect_to reports_path, notice: 'Informe creado!'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @report = Report.find(params[:id])
    end

    def update
      @report = Report.find(params[:id])

      if @report.update(report_params)
        redirect_to reports_path, notice: 'Informe actualizado!'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @report = Report.find(params[:id])
      @report.destroy

      redirect_to reports_path, notice: 'Informe eliminado!', status: :see_other
    end
    
    private

    def report_params
      params.require(:report).permit(:title, :description, :template, :sensor_name, :sensor_type, :sensor_id)
    end
end
