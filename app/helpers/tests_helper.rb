module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }
  def test_level(test)
    "#{test.level}-#{TEST_LEVELS[test.level] || :hero}"
  end
end
