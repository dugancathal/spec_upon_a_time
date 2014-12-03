require 'rspec/core/formatters/documentation_formatter'

module TimedFormatter
  class Formatter < RSpec::Core::Formatters::DocumentationFormatter
    RSpec::Core::Formatters.register self, :example_group_started, :example_group_finished,
                                  :example_passed, :example_pending, :example_failed
    private

    def passed_output(example)
      codes.wrap("#{current_indentation}#{example.description.strip} " \
                 "(#{run_time_for(example)})", :success)
    end

    def pending_output(example, message)
      codes.wrap("#{current_indentation}#{example.description.strip} " \
                 "(#{run_time_for(example)}) " \
                 "(PENDING: #{message})",
                 :pending)
    end

    def failure_output(example, _exception)
      codes.wrap("#{current_indentation}#{example.description.strip} " \
                 "(#{run_time_for(example)}) " \
                 "(FAILED - #{next_failure_index})",
                 :failure)
    end

    def run_time_for(example)
      example.execution_result.run_time
    end

    def codes
      RSpec::Core::Formatters::ConsoleCodes
    end
  end
end
