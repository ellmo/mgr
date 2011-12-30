#encoding: utf-8

Wtedy /^będę widział listę postów$/ do
  page.should have_selector("#posts_list")
end

Wtedy /^będę widział formularz dodawania posta$/ do
  page.should have_selector("form#new_post")
end

Wtedy /^będę widział post "(.+)" na liście postów$/ do |post|
  page.should have_content(post)
end
