module CustomTab
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'custom_tab/layouts/new_layout'
    
    def summary
      render :partial => 'summary', :locals => { :host => @host }
      rescue ActionView::Template::Error => exception
      process_ajax_error exception, 'fetch interfaces information'
    end
    
  end
end
