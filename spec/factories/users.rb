Factory.define :user do |usr|
  usr.sequence(:login) { |n| "user_#{n}" }
  usr.sequence(:email) {|n| "user_#{n}@example.com"}
  usr.password "jfhsdk2332"
  usr.password_confirmation {|u| u.password}
end