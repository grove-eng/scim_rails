module ScimRails
  class ScimCount
    include ActiveModel::Model

    attr_accessor \
      :limit,
      :offset,
      :start_index,
      :total

    def limit
      return 100 if @limit.blank?
      validate_numericality(@limit)
      input = @limit.to_i
      raise if input < 1
      input
    end

    def start_index
      return 1 if @start_index.blank?
      validate_numericality(@start_index)
      input = @start_index.to_i
      return 1 if input < 1
      input
    end

    def offset
      start_index - 1
    end

    private

    def validate_numericality(input)
      test = input =~ /\A\d+\z/
      raise unless test != nil
    end

  end
end
