json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :event_id, :user_id, :name, :email, :date, :state, :verification, :SubmissionId, :gateway, :ip, :URL, :params, :discount, :early_fee, :late_fee, :tax, :log, :lang, :coupon, :ideal
  json.url subscription_url(subscription, format: :json)
end
