require_relative 'validators'

module IsHashValid
  class Validator
    include IsHashValid::Validators

    def initialize(hash, validators_for_feilds)
      @hash = hash
      @validators_for_feilds = validators_for_feilds
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
      @validators_for_feilds.each do |field, validators|
        validators.each do |validator, message|
          unless self.send(validator.to_sym, @hash[field.to_sym])
            if @errors.has_key? field
              @errors[field].push(message)
            else
              @errors[field] = [message]
            end
          end
        end
      end
    end
  end
end