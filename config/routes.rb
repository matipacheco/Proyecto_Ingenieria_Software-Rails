Rails.application.routes.draw do
  root 'welcome#index'

  get  'users/register' => 'users#register'
  post 'users/new'      => 'users#new'
  get  'me'             => 'users#me'
  post 'me/update'      => 'users#update'
  post 'me/new_editor'  => 'users#create_editor'
  post 'me/grant'       => 'users#grant_permission'
  post 'me/deny'        => 'users#deny_permission'

  put  'login'          => 'sessions#new'
  post 'login'          => 'sessions#create'
  post 'logout'         => 'sessions#destroy'

  post 'contents/upload'  => 'contents#upload'
  post 'contents/destroy' => 'contents#destroy'

  post 'comments/new'     => 'comments#new'
  put  'comments/respond' => 'comments#respond'
  post 'comments/create_response' => 'comments#create_response'

  get 'search' => 'search#search'

  post 'permission/create'  => 'permissions#create'

  get 'news' => 'news#noticia'

  get 'foro' => 'foro#foro'

  get 'add_contribution' => 'contributions#add_contribution'

  post 'update'     => 'notifications#update'
  post 'musico'     => 'notifications#musico'
  post 'musicologo' => 'notifications#musicologo'
  post 'melomano'   => 'notifications#melomano'
  get 'lists'       => 'notifications#watch_lists'
  get 'send_mails'  => 'notifications#send_mail'
  post 'remove'     => 'notifications#remove_form_list'

  post 'mail_to_musicos'      => 'mailing#mail_to_musicos'
  post 'mail_to_musicologos'  => 'mailing#mail_to_musicologos'
  post 'mail_to_melomanos'    => 'mailing#mail_to_melomanos'
end
