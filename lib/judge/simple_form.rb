require 'judge' unless defined?(::Judge::VERSION)
require 'simple_form' unless defined?(::SimpleForm)

module Judge
  module SimpleForm
    module Inputs

      include Judge::Html

      def self.included(base)
        base.send(:alias_method, :old_input_html_options, :input_html_options)
        base.send(:alias_method, :input_html_options, :new_input_html_options)
      end

      def new_input_html_options
        attrs = options[:validate].present? ? attrs_for(object, attribute_name) : {}
        attrs.merge(old_input_html_options)
      end

    end
  end
end

::SimpleForm::Inputs::Base.send(:include, ::Judge::SimpleForm::Inputs)