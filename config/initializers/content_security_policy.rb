# config/initializers/content_security_policy.rb

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none
  policy.script_src  :self, :https, "https://s3.tradingview.com", "https://www.tradingview.com"
  policy.style_src   :self, :https, :unsafe_inline
  policy.connect_src :self, :https
  policy.frame_src   :self, :https, "https://www.tradingview.com"
  policy.connect_src :self, :https, "https://api.coingecko.com"

end
