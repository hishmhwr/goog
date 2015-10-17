Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '686222648145774', '94f2ed6c07cd84619869e1d99fe50b22' 
end
