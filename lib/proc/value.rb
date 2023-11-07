# frozen_string_literal: true

class Proc
  module ValueClassPatch
    # Evaluate block if block is given or return
    # unmodified object if no block is given. Additional
    # arguments are given to `Proc#call`.
    #
    # Can be used to allow transparent usage of blocks.
    #
    # @example
    #   config_option = Proc.val(config_option).to_s
    #
    # @see Object#value
    # @see Proc#value
    #
    def val(proc_or_object, *args)
      proc_or_object.respond_to?(:call) ? proc_or_object.call(*args) : proc_or_object
    end
  end

  module ValueInstancePatch
    # Evaluate block. Arguments are given to `Proc#call`.
    #
    # @example
    #   config_option = proc { "#{lazy_var}/path/to/file.rb" }
    #   config_option.value.to_s\
    #
    def value(*args)
      send :call, *args
    end
  end

  module ValueObjectPatch
    # Return self. Allows object to be transparently switched
    # with blocks.
    #
    # @example
    #   config_option = "path/to/file.rb"
    #   config_option.value.to_s
    #
    #   config_option = proc { "#{lazy_var}/path/to/file.rb" }
    #   config_option.value.to_s
    #
    def value(*_args)
      self
    end
  end

  include ValueInstancePatch
  extend ValueClassPatch
end

Object.include Proc::ValueObjectPatch
