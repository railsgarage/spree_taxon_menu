Spree::FrontendHelper.module_eval do

  def menu_goes_here
    content_tag :ul, class: 'menu' do
      Spree::Taxonomy.where(in_menu: true).map do |taxonomy|
        root_taxon = taxonomy.root
        content_tag :li do
          anchor = link_to(root_taxon.name, seo_url(root_taxon))
          dropdown = content_tag :ul do
            root_taxon.children.where(in_menu: true).map do |taxon|
              content_tag :li do 
                anchor = link_to(taxon.name, seo_url(taxon))
                dropdown = content_tag :ul do
                  taxon.children.where(in_menu: true).map do |taxon|
                    content_tag(:li, link_to(taxon.name, seo_url(taxon)))
                  end.join("\n").html_safe
                end
                taxon.children.where(in_menu: true).empty? ? anchor : anchor + dropdown
              end
            end.join("\n").html_safe
          end
          anchor + dropdown
        end
      end.join("\n").html_safe
    end
  end

end
