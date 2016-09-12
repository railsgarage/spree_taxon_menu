Spree::FrontendHelper.module_eval do

  def menu_goes_here
    content_tag :ul, class: 'menu' do
      Spree::Taxonomy.where(in_menu: true).map do |taxonomy|
        root_taxon = taxonomy.root
        content_tag :li do
          root_children = root_taxon.children.where(in_menu: true)
          dropdown = content_tag :ul do
            root_children.map do |taxon|
              content_tag :li do
                children = taxon.children.where(in_menu: true)
                dropdown = content_tag :ul do
                  children.map do |taxon|
                    content_tag(:li, link_to(taxon.name, seo_url(taxon)))
                  end.join("\n").html_safe
                end
                anchor = link_to seo_url(taxon) do
                  name = taxon.name
                  children.empty? ? name : (name + content_tag(:span, '', class: 'caret')).html_safe
                end
                anchor + dropdown
              end
            end.join("\n").html_safe
          end

          anchor = link_to seo_url(root_taxon) do
            name = root_taxon.name
            root_children.empty? ? name : (name + content_tag(:span, '', class: 'caret')).html_safe
          end
          anchor + dropdown

        end
      end.join("\n").html_safe
    end
  end

end
