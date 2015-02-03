module IsHashValid
  module Validators
    def not_empty(value)
      return false unless value.is_a? String
      value.empty? ? false : true
    end

    def be_string(value)
      value.is_a? String
    end
  end
end