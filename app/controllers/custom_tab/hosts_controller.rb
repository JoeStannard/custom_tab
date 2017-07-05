module CustomTab
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'custom_tab/layouts/new_layout'

    def new_action
      # automatically renders view/custom_tab/hosts/new_action
    end
  end
end
