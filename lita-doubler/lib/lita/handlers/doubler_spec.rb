reuire 'spec_helper'

describe Lita::Handlers::Double,lita_handler: true do
  let(:robot) {Lita::Robot.new(registry)}

  subject{describe_class.new(robot)}

  describe 'routing' do
    # allow extra whitespace
    it {is_expected.to route('Lita double 2')}
    it {is_expected.to route('Lita double   22')}
    #allow mixed casing
    it {is_expected.to route('Lita double 4')}

    #ignore numbers that don't look like integers
    it {is_expected.to route('Lita double two')}
    it {is_expected.to route('Lita double le4')}
  end

  describe 'functionality' do
    describe ':double_number' do
      let(:n) {rand(1...100)}

      it 'returns double the input' do
        actual=subject.double_number n
        expected=n*2

        expected(actual).to eq(expected)
      end
    end

    it 'double numbers when asked to' do
      send_message 'Lita double 2'
      expected(replies.last).to eq('2+2=4')
    end
  end
end