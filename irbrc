require 'irb/completion'

begin
  require 'interactive_editor'
rescue LoadError => err
  warn "Couldn't load interactive_editor: #{err}"
end

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irb-history")
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

def clear
  system('clear')
end

def ri(*names)
  system(%{ri #{names.map {|name| name.to_s}.join(" ")}})
end

class Object
  def eigenclass
    class << self; self; end
  end

  def interesting_methods
    case self.class
    when Class
      def metaclass; eigenclass; end
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end
