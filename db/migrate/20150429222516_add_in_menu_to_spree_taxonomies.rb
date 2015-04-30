class AddInMenuToSpreeTaxonomies < ActiveRecord::Migration
  def change
    add_column :spree_taxonomies, :in_menu, :boolean, default: true
  end
end
