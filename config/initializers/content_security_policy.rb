# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none
  policy.script_src  :self, :https, :unsafe_inline, "https://s3.tradingview.com", "https://www.tradingview.com"
  policy.style_src   :self, :https, :unsafe_inline
  policy.connect_src :self, :https, "https://api.coingecko.com"
  policy.frame_src   :self, :https, "https://www.tradingview.com"
end

# Generate a unique nonce for inline scripts each request
Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Uncomment this to report CSP violations to a specified URI
# Rails.application.config.content_security_policy_report_only = true
