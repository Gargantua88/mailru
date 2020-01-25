FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "Course number #{n}" }
  end

  factory :group do
    sequence(:start_time) { |n| Time.now + n }

    association :course, factory: :course
  end
end
