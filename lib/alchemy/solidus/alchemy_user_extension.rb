module AlchemyUserExtension
  def spree_roles
    if admin?
      ::Spree::Role.where(name: 'admin')
    else
      ::Spree::Role.none
    end
  end
end
