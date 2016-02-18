# Allow Alchemy content within Solidus views

# Keep in `Alchemy` namespace rather than just assigning it to a local
# variable so that within the module things like `Site` doen't now require
# `Alchemy::Site`.
Alchemy::ControllerActionsForSolidus = Alchemy::ControllerActions.dup

Alchemy::ControllerActionsForSolidus.class_eval do
  # Allow access to alchemy ability still via aliased method
  alias_method :current_alchemy_ability, :current_ability

  # Remove original method name so that it doesn't overwrite Solidus's
  remove_method :current_ability
end

Spree::BaseController.send :include, Alchemy::ControllerActionsForSolidus
Spree::UserSessionsController.send :include, Alchemy::ControllerActionsForSolidus if defined? Spree::UserSessionsController
