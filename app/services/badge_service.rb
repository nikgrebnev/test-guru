class BadgeService


  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @category = test_passage.test.category_id
    @test_passage = test_passage

  end

  def call
    Badge.all.each do |badge|
      @user.badges.push(badge) if send("#{badge.rule}", badge.badge_type)
    end
  end

  private

  def check_first_attempt(skip)
    # Выдать бэйдж после успешного прохождения теста с первой попытки
    @user.tests.where(id: @test.id).count == 1
  end

  def check_all_tests_by_level(level)
    #Выдать бэйдж после успешного прохождения всех тестов определённого уровня
    return false if level != @test.level

    all_tests = Test.where(level: level).to_a.map(&:id).sort
    user_tests = @user.test_passages.where(success: true, test_id: all_tests).to_a.map(&:id).sort
    all_tests == user_tests
  end

  def check_all_tests_in_category(category)
    #Выдать бэйдж после успешного прохождения всех тестов из категории
    return false if category != @category

    all_tests = Test.where(category: category).to_a.map(&:id).sort
    user_tests = @user.test_passages.where(success: true, test_id: all_tests).to_a.map(&:id).sort
    all_tests == user_tests
  end

end