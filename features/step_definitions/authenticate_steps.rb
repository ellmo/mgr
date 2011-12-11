#encoding: utf-8

Zakładając /^że mamy danych użytkowników$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    Factory(:user, hash)
  end
end

Zakładając /^że jestem na stronie "(.+)"$/ do |arg1|
  steps "Given I am on #{arg1}"
end

Zakładając /^że nie jestem zalogowany$/ do
  current_user = nil
end

Jeżeli /^niezalogowany użytkownik loguje się z widoku za pomocą kredencjałów "(.+)" oraz "(.+)"$/ do |arg1, arg2|
  visit new_user_session_path
  fill_in "user_email", :with => login
  fill_in "user_password", :with => pass
  click_button "user_submit"
  current_user = User.find_by_login(login)
end

Wtedy /^trafię na stronę "(.+)"$/ do |arg1|
  assert_equal path_to(page_name), current_path
end

Wtedy /^będzie stworzona sesja dla użytkownika "(.+)"$/ do |arg1|
  current_user.should == User.find_by_login(login)
end

Wtedy /^będę widział informację "(.+)"$/ do |arg1|
  page.should have_content(msg1)
end