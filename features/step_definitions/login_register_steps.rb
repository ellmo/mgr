#encoding: utf-8

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
  page.should have_selector("form#user_new")
end

Wtedy /^będę widział formularz rejestracji$/ do
  page.should have_selector("form#user_new")
end
