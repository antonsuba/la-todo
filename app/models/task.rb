class Task < ApplicationRecord
  before_create :set_default_position

  belongs_to :todo

  def self.calculate_position(num_l:, den_l:, num_h:, den_h:)
    if (num_l * den_h) + 1 == (num_h * den_l)
      return num_l + num_h, den_l + den_h
    end

    temp_num_l = 0
    temp_den_l = 1
    temp_num_h = 1
    temp_num_h = 0

    while
      new_num = temp_num_l + temp_num_h
      new_den = temp_den_l + temp_den_h

      if new_num * den_l <= new_den * num_l
        temp_num_l = new_num
        temp_den_l = new_den
      elsif new_den * num_h <= new_num * den_h
        temp_num_h = new_num
        temp_den_h = new_den
      else
        return new_num, new_den
      end
    end
  end

  private
  
  def set_default_position
    last_task = self.todo.tasks.last
    self.pos_num = ((last_task&.pos_num&.to_f || 0) / (last_task&.pos_den || 1)) + 1
    self.pos_den = 1
  end
end
