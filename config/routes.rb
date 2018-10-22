Rails.application.routes.draw do

  resources :shops do
    resources :products do
    end
    resources :orders do
      resources :line_items do
      end
    end
  end

  # return error on unmatched paths
  match '*path' => 'errors#not_found', via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
