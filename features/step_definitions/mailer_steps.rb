#encoding: utf-8

Zakładając /^że mailer jest przygotowany$/ do
  ActionMailer::Base.delivery_method = :test
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.deliveries.clear
end

Wtedy /^będę widział formularz odzyskiwania konta$/ do
  page.should have_selector("form#user_new")
end

Wtedy /^zostanie wysłany email$/ do
  ActionMailer::Base.deliveries.should_not be_empty
end

Wtedy /^nie zostanie wysłany email$/ do
  ActionMailer::Base.deliveries.should be_empty
end