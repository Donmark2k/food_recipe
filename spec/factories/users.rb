FactoryBot.define do
  factory :user do
    email { 'moz1@mo.com' }
    password { '123456' }
		name { 'moz' }
  end
end
