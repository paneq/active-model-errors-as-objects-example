require 'invalid_length_error'

module ActiveModel

  class Errors
    def normalize_message(attribute, message, options)
      custom_message = options[:message] || message || :invalid
      if custom_meesage.respond_to?(:call)
        custom_message.call(attribute, options)
      elsif custom_message.is_a?(Symbol)
        generate_message(attribute, message, options.except(*CALLBACKS_OPTIONS))
      else
        message
      end
    end
  end

  module Validations
    class BetterLengthValidator < LengthValidator
      MESSAGES  = {}
      RESERVED_OPTIONS = {}

      def initialize(settings)
        super
        error_proc = Proc.new{ InvalidLengthError.new(options[:minimum] || options[:is], options[:maximum] || options[:is], nil) }
        @options = @options.dup
        options[:wrong_length] ||= error_proc
        options[:too_long]     ||= error_proc
        options[:too_short]    ||= error_proc
        @options.freeze
      end
    end

    module HelperMethods
      def better_validates_length_of(*attr_names)
        validates_with BetterLengthValidator, _merge_attributes(attr_names)
      end

      alias_method :better_validates_size_of, :better_validates_length_of
    end
  end


end
