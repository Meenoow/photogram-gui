Rails.application.routes.draw do
 get("/users", { :controller => "users", :action => "index" })

 get("/users/:path_user_name", { :controller => "users", :action => "show" })

end
