# coding: utf-8

class Test
  def initialize(questions_path)
    until File.exists?(questions_path)
      abort "Файл с вопросами #{questions_path} не найден"
    end

    file = File.new(questions_path)
    @questions = file.readlines
    file.close

    @score = 0
    @current_question = 0
    @trick_questions = [5, 10, 11] # Номера вопросов с подвохом
  end

  def finished?
    return @current_question >= @questions.size
  end

  def next_question
    puts @questions[@current_question]
    puts ""
    user_input = nil

    until user_input == 1 || user_input == 2 || user_input == 3
      puts "Введите ваш ответ: 1 если ДА, 2 если ИНОГДА и 3 если НЕТ"
      user_input = STDIN.gets.to_i
    end

    # условие для обрабоки вопросов с подвохом, для правильного начисления баллов
    if (user_input == 1 && !trick_questions.include?(current_question + 1)) ||
      (user_input == 3 && trick_questions.include?(current_question + 1))
      @score += 2
    elsif user_input == 2
      @score += 1
    end
    # переход к следующему вопросу
    @current_question += 1
  end

  def score
    return @score
  end

  def trick_questions
    return @trick_questions
  end

  def current_question
    return @current_question
  end
end
