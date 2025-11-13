resource :account, controller: "account", only: [:show, :update, :delete] do
  get :erase, on: :collection
  delete :delete_avatar, on: :collection
  get :internship_template
  post :save_internship
end

resource :subscriptions, only: [:edit, :update]
