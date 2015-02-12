class HuntsTest < ActionDispatch::IntegrationTest

  test "user opens index" do
    visit '#'
    assert has_content? 'Hunting for treasures.'
  end
end
