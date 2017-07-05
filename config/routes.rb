Rails.application.routes.draw do
  get 'new_action', to: 'custom_tab/hosts#new_action'
end
