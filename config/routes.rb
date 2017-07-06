Rails.application.routes.draw do
  get '(:controller)/help', :action => 'welcome', :as => "help"
  constraints(:id => /[^\/]+/) do
    resources :hosts do
      member do
        get 'summary'
      end
    end
  end
  
end
