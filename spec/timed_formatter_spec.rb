require 'spec_helper'

require 'timed_formatter/formatter'

module TimedFormatter
  describe Formatter do
    def example_notification(example)
      ::RSpec::Core::Notifications::ExampleNotification.for(example)
    end

    def execution_result(values)
      RSpec::Core::Example::ExecutionResult.new.tap do |er|
        values.each { |name, value| er.__send__(:"#{name}=", value) }
      end
    end

    def reporter
      @reporter ||= setup_reporter
    end

    def setup_reporter(*streams)
      config.add_formatter described_class, *streams
      @formatter = config.formatters.first
      @reporter = config.reporter
    end

    def output
      @output ||= StringIO.new
    end

    def config
      @configuration ||=
        begin
          config = RSpec::Core::Configuration.new
          config.output_stream = output
          config
        end
    end

    %w(passed failed pending).each do |spec_type|
      it "includes the execution time in #{spec_type} spec output" do
        reporter.notify :start, ::RSpec::Core::Notifications::StartNotification.new(2)
        reporter.notify :"example_#{spec_type}", example_notification(
          double('example 1',
            description: 'first example',
            execution_result: execution_result(status: spec_type, run_time: '0.0001')
          )
        )

        expect(output.string).to match(/first example \(0.0001\)/)
      end
    end
  end
end
