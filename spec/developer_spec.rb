require 'spec_helper'

describe Developer do
  it { should respond_to(:are) }
  it { should respond_to(:crazy) }
  it { should respond_to(:crazy=) }

  describe 'select' do
    before(:each) do
      @developer = Developer.new
      @developers = [@developer]
    end

    it 'should select crazy developer by default' do
      selected = @developers.select { |you| you.are.crazy }
      expect(selected).to eq([@developer])
    end
  end
end
