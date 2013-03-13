json.array!(@students) do |student|
  json.extract! student, :name, :email
  json.url student_url(student, format: :json)
end