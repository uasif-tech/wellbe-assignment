Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks, except: :show do
    resources :task_items
  end
  resources :patients do
    resources :task_assignments
  end
end
