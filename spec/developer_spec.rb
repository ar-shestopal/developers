require 'spec_helper'

describe Developer do
  it { should respond_to(:are) }
  it { should respond_to(:crazy) }
  it { should respond_to(:in) }
  it { should respond_to(:love) }
  it { should respond_to(:skill_level) }
  it { should respond_to(:want) }

  # it { should respond_to(:is) }
  # it { should respond_to(:not) }

  describe 'methods' do
    before(:each) do
      @developer = Developer.new
      @developers = [@developer]
    end

    context 'reader_methods' do
      it 'should select crazy developer by default' do
        selected = @developers.select { |you| you.are.crazy }
        expect(selected).to eq([@developer])
      end

      it 'shold select high level developer by default' do
        selected = @developers.select { |you| you.skill_level :high }
        expect(selected).to eq([@developer])
      end
    end

    context 'not' do
      it 'shuld return falsy result with not' do
        expect(@developer.skill_level.not :high).to be_falsy
      end
    end

    context 'is' do
      it 'should return args' do
        expect(@developer.skill_level.is :high).to be_truthy
      end
    end

    context 'chaining methods for select' do
      it 'allows chaing methods' do
        expect(@developer.love.skill_level).to be_truthy
      end

      it 'allows chaining methods in any order' do
        expect(@developer.skill_level.love).to be_truthy
      end
    end
  end
end
