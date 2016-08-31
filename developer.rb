class Developer
  attr_accessor :skill_level
  def initialize
    #default values
    @crazy = true
    @skill_level = :high
    @in = :london
    @love = :ruby
    @want = ['fun', 'money']
    @work = :well
    define_reader_methods
  end

  def crazy
    return self if @crazy
  end

  #overriding love method to allow syntax like this 'love :ruby, rails'
  #or not.love :ruby, :rails
  def love(*args)
    love = @love.to_sym
    return self if args.flatten!.include?(love) || args.empty?
  end

  # alias for self
  # syntactic sugar
  def are
    self
  end

  # allows call like 'skill_level.is :high'
  def is(*args)
    self if equal_to_previous_call(*args)
  end

  # allows call like 'skill_level.not :low'
  def not(*args)
    self unless equal_to_previous_call(*args)
  end

  #syntactic shugar makes call like 'work well' to run
  def well
    :well
  end

  #syntactic shugar makes call like 'work bad' to run
  def bad
    :bad
  end

  private

  # Method adds modified attr_reader for each instance variable.
  # rescue NoMethodError allows to chain methods
  # all methods are accepting multiple arguments and simply vrifying if argments
  # are equal to instance_variable value
  def define_reader_methods
    method_names = instance_variables.map { |iv| iv.to_s[1..-1] }
    method_names.each do |method_name|
      self.class.send(:define_method, method_name) do |*args|
        reader_method_body(args, method_name)
      end
    end
  end

  #reset @positive after .not method call
  def reader_method_body(args, method_name)
    args.flatten!
    args = args[0] if args.size == 1
    instance_exec do
      value = instance_variable_get("@#{method_name}")
      @prev_result = value if value == args || args.empty?
      self
    end
  end

  def equal_to_previous_call(*args)
    args.flatten
    args = args.first if args.size == 1
    @prev_result == args
  end
end
