require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of reports' do
    get reports_path

    assert_response :success
    assert_select '.report', 2
  end

  test 'render a detailed report page' do
    get report_path(reports(:traffic))

    assert_response :success
    assert_select '.title', 'Informe de Tráfico'
    assert_select '.description', 'Muestra los outliers para detectar las anomalías de tráfico'
    assert_select '.template', 'MyText'
  end

  test 'render a new report form' do
    get new_report_path

    assert_response :success
    assert_select 'form'
  end

  test 'aloows to create a new report' do
    post reports_path, params: {
      report: {
        title: 'Informe Avanzado',
        description: 'Nuevas caracteristicas',
        template: '<h1>Title</h1><img src="/exportedImages/graph.png"><p><small>Gráfica 1: </small></p>',
        sensor_id: 99,
        sensor_type:'ISR',
        sensor_name:'MisensorISR'
      }
    }

    assert_redirected_to reports_path
  end

  test 'does not allow to create a new report with empty fields' do
    post reports_path, params: {
      report: {
        title: '',
        description: 'Informe loco',
        template: ''
      }
    }

    assert_response :unprocessable_entity
  end
end

