require_relative 'validators'

module IsHashValid
  class Validator
    include IsHashValid::Validators

    def initialize(hash, validators)
      @hash = hash
      @validators = validators
      @errors = { }
      validate
    end

    def valid?
      @errors.empty? ? true : false
    end

    def errors
      { errors: @errors }
    end

    def validate
      @validators.each do |field, validators|
        validators.each do |validator, message|
          if !self.send(validator.to_sym, @hash[field.to_sym])
            @errors[field] = [] unless @errors.has_key? field
            @errors[field].push(message)
          end
        end
      end
    end
  end
end