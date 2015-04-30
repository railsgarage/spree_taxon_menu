Spree::FrontendHelper.module_eval do

  def menu_goes_here
    content_tag :ul, class: 'menu nav navbar-nav' do
      Spree::Taxonomy.where(in_menu: true).map do |taxonomy|
        root_taxon = taxonomy.root
        content_tag :li, class: 'dropdown' do
          anchor = link_to(root_taxon.name, seo_url(root_taxon), class: 'dropdown-toggle', data: { toggle: 'dropdown' })
          dropdown = content_tag :ul, class: 'dropdown-menu' do
            root_taxon.children.where(in_menu: true).map do |taxon|
              content_tag(:li, link_to(taxon.name, seo_url(taxon)))
            end.join("\n").html_safe
          end
          anchor + dropdown
        end
      end.join("\n").html_safe
    end
  end

end
