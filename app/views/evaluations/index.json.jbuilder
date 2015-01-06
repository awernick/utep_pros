json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :title, :description, :eventdate, :referral, :question2_1, :question2_2, :question2_3, :question2_4, :question2_5, :question2_6, :question2_6, :question2_7, :question3_1, :question3_2, :question3_3, :question4, :question5, :question6
  json.url evaluation_url(evaluation, format: :json)
end
