module Alchemy
  module Solidus
    class Engine < ::Rails::Engine
      engine_name 'alchemy_solidus'

      config.to_prepare do
        Alchemy.register_ability ::Spree::Ability
        require 'alchemy/solidus/spree_user_decorator' if Alchemy.user_class_name == 'Spree::User'
        require 'alchemy/solidus/alchemy_user_decorator' if Alchemy.user_class_name == 'Alchemy::User'
      end
    end
  end
end
