require 'spree_core'
require 'spree_mobile_views_hooks'

module SpreeMobileViews
  class Engine < Rails::Engine
    engine_name 'spree_mobile_views'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end