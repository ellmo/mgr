#encoding: utf-8

Zakładając /^że nie jestem zalogowany$/ do
  visit '/logout'
end

Zakładając /^że jestem zalogowany jako użytkownik "(.+)"$/ do |login|
  email = 'jkb.zuchowski@gmail.com'
  password = 'haslo123'
  User.new(:login => login, :email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_login", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Zakładając /^że mamy danych użytkowników$/ do |table|
  table.hashes.each do |hash|
    Factory(:user, hash)
  end
end

Zakładając /^że liczba użytkowników wynosi "(.+)"$/ do |number|
  @user_count = User.count
  @user_count.should == number.to_i
end

Zakładając /^że jestem na stronie "(.+)"$/ do |arg1|
  steps "Given I am on #{arg1}"
end

Zakładając /^że widzę odnośnik "(.+)"$/ do |link|
  page.should have_link(link)
end

Jeżeli /^kliknę odnośnik "(.+)"$/ do |link|
  click_link(link)
end

Jeżeli /^kliknę przycisk "(.+)"$/ do |button|
  click_button(button)
end

Jeżeli /^wypełnię pole "(.+)" tekstem "(.+)"$/ do |field, value|
  fill_in(field, :with => value)
end

Wtedy /^trafię na stronę "(.+)"$/ do |page_name|
  assert_equal path_to(page_name), current_path
end

Wtedy /^w bazie danych znajdzie się użytkownik "(.+)"$/ do |login|
  User.find_by_login(login).should_not be_nil
end

Wtedy /^w bazie danych nie znajdzie się nowy użytkownik$/ do
  @user_count.should == User.count
end

Wtedy /^będę widział informację "(.+)"$/ do |msg|
  page.should have_content(msg)
end

Wtedy /^nie będę widział odnośnika "(.+)"$/ do |link|
  page.should_not have_link(link)
end

Wtedy /^będę widział informację o błędach$/ do
  page.should have_selector(".alert")
end