class AddInMenuToSpreeTaxons < ActiveRecord::Migration
  def change
    add_column :spree_taxons, :in_menu, :boolean, default: true
  end
end
