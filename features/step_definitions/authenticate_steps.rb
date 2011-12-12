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

Jeżeli /^niezalogowany użytkownik loguje się z widoku za pomocą kredencjałów "(.+)" oraz "(.+)"$/ do |login, pass|
  visit new_user_session_path
  fill_in "user_login", :with => login
  fill_in "user_password", :with => pass
  click_button "Sign in"
end

Wtedy /^trafię na stronę "(.+)"$/ do |page_name|
  assert_equal path_to(page_name), current_path
end

Wtedy /^będzie widoczne powitanie dla użytkownika "(.+)"$/ do |login|
  current_user.should == User.find_by_login(login)
end

Wtedy /^będę widział informację "(.+)"$/ do |msg|
  page.should have_content(msg)
end