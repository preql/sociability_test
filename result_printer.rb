class ResultPrinter
  def initialize(results_path)
    until File.exists?(results_path)
      abort "Файл с вопросами #{results_path} не найден"
    end

    file = File.new(results_path, "r:UTF-8")
    @results = file.readlines
    file.close
  end

  def result_print(test)
    puts
    puts
    puts "Результат теста (всего баллов - #{test.score}):"

    # Вывод результата по итоговому количеству набранных баллов
    case test.score
    when (32..30) then puts @results[0]
    when (25..29) then puts @results[1]
    when (19..24) then puts @results[2]
    when (14..18) then puts @results[3]
    when (9..13)  then puts @results[4]
    when (4..9)   then puts @results[5]
    else
      puts @results[6]
    end
  end
end
