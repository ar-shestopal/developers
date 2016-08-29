class Developer
  def initialize
    @crazy = true
    @skill_level = :high
    @in = :london
    @love = :ruby
    @want = ['fun', 'money']
    @positive = true
  end

  def crazy
    return self if @crazy == @positive
  end

  # alias for self
  # kind of syntactic sugar
  def are
    self
  end

  # passes args further
  # kind of syntactic sugar
  def is(*args)
    args.flatten!
  end

  private

  # Method adds modified attr_reader for each instance variable.
  # rescue NoMethodError allows to chain methods
  # all methods are accepting multiple arguments and simply vrifying if argments
  # are equal to instance_variable value
  def define_reader_methods
    method_names = instance_variables.map { |iv| iv.to_s[1..-1] }
    method_names.each do |method_name|
      singletone_class.send(:define_method, method_name) do |*args|
        args.flatten!
        return self if args.empty?
        reader_method_body(arsg, method_name)
      end
    end
  end

  def reader_method_body(args, method_name)
    args = args[0] if args.size == 1
    if attr_equal(args) || attr_not_equal(args)
      self
    else
      nil
    end
  rescue => NoMethodError
    nil
  end

  def attr_equal(args)
    self.send("@#{method_name}") == args && @positive
  end

  def attr_not_equal(args)
    self.send("@#{method_name}") != args && !@positive
  end
end
