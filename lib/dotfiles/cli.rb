require 'dotfiles'

module Dotfiles
  class CLI
    def initialize
    end

    def run(args)
      command, options = Options.new.parse(args)
      klass = Dotfiles::Commands.const_get(command.capitalize)
      klass.run(options)
    end
  end
end
