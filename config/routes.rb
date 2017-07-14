Rails.application.routes.draw do
  get '(:controller)/help', :action => 'welcome', :as => "help"
    resources :hosts do
      member do
        get 'summary'
      end
    end
  end


