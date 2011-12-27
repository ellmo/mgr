#encoding: utf-8

Zakładając /^że mamy danych użytkowników$/ do |table|
  table.hashes.each do |hash|
    Factory(:user, hash)
  end
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

Jeżeli /^wypełnię formularz logowania danymi$/ do |table|
  table.hashes.each_with_index do |hash, index|
    fill_in("user_login", :with => hash[:user_login] )
    fill_in("user_password", :with => hash[:user_password])
  end
end

Jeżeli /^wypełnię formularz rejestracji danymi$/ do |table|
  table.hashes.each_with_index do |hash, index|
    fill_in("user_email", :with => hash[:email])
    fill_in("user_login", :with => hash[:login])
    fill_in("user_password", :with => hash[:password])
    fill_in("user_password_confirmation", :with => hash[:password])
  end
end

Wtedy /^będę widział formularz logowania$/ do
  page.should have_selector("form", :id => "user_new")
end

Wtedy /^będę widział formularz rejestracji$/ do
  page.should have_selector("form", :id => "user_new")
end

Wtedy /^trafię na stronę "(.+)"$/ do |page_name|
  assert_equal path_to(page_name), current_path
end

Wtedy /^w bazie danych znajdzie się użytkownik "(.+)"$/ do |login|
  User.find_by_login(login).should_not be_nil
end


Wtedy /^będę widział informację "(.+)"$/ do |msg|
  page.should have_content(msg)
end
