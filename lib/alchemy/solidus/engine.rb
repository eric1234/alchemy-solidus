require 'alchemy/solidus/spree_user_extension'
require 'alchemy/solidus/alchemy_user_extension'

module Alchemy
  module Solidus
    class Engine < ::Rails::Engine
      engine_name 'alchemy_solidus'

      config.to_prepare do
        Alchemy.register_ability ::Spree::Ability
        Spree::User.include SpreeUserExtension if Alchemy.user_class_name == 'Spree::User'
        Alchemy::User.include AlchemyUserExtension if Alchemy.user_class_name == 'Alchemy::User'
      end
    end
  end
end
