at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'reports/report.json'
    config.report_path = "reports/report-builder_-_#{Time.now.strftime('%Y-%m-%d_-_%H-%M-%S')}"
    config.report_types = [:html]
    config.report_title = 'POC TDC'
    config.voice_commands = true
    config.color = 'blue'
    config.additional_info = {
      DateTime: DateTime.now,
      Environment: ENVIRONMENT,
      Runtime: "ruby - #{RUBY_VERSION}"
    }
  end
  ReportBuilder.build_report

  puts "\nReportBuilder \n#{ReportBuilder.report_path}.#{ReportBuilder.report_types[0].downcase}"
end
