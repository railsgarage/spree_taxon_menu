Spree::Admin::TaxonsController.class_eval do

  Spree::PermittedAttributes.taxon_attributes << :in_menu

end
