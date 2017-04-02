require "lier/version"

module Lier
  klasses = ObjectSpace.each_object(Module).reject do |k|
    k.singleton_class? || k.to_s.start_with?('#')
  end.sort_by(&:to_s)

  klasses.each do |k|
    methods = k.instance_methods(false).select { |m| m.to_s.end_with?('?') } - [:respond_to?]
    next if methods.empty?

    code = "refine #{k} do\n"

    code += methods.map do |name|
      <<-EOF
        alias_method :_#{name}, :#{name}

        def #{name}(*args, &block)
          !_#{name}(*args, &block)
        end
      EOF
    end.join("\n")

    code += "\nend"
    eval(code)
  end
end
