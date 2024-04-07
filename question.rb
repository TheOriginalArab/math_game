class Question
  attr_reader :question, :answer
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @question = "What does #{@num1} plus #{@num2} equal?"
    @answer = @num1 + @num2
  end
  
  def correct?(answer)
    answer == @answer
  end
end