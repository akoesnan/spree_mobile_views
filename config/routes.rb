Spree::Core::Engine.routes.draw do
  scope :module => :spree do
    match "/search" => "products#search", :as => :search
  end
end
