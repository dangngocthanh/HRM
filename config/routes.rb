Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'sign_out' => "devise/sessions#destroy"
  end
  devise_scope :user do
    authenticated :user do
      root 'departments#index', as: :authenticated_root
      resources 'departments'
      resources 'projects'
      resources 'users_projects'
      resources 'users'
      post 'update_leader' => 'projects#update_leader'
      get 'change_leader' => 'projects#change_leader'
      get 'users_projects_detail' => 'projects#users_projects_detail'
      get 'done_project' => 'projects#done_project'
      get 'click' => 'departments#click'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
