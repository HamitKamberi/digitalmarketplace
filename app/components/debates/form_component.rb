class Debates::FormComponent < ApplicationComponent
  include TranslatableFormHelper
  include GlobalizeHelper
  attr_reader :debate
  use_helpers :suggest_data

  def initialize(debate)
    @debate = debate
  end

  private

    def categories
      Tag.category.order(:name)
    end
end
