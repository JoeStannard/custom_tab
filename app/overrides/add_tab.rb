if SETTINGS[:show_view]
  SETTINGS[:show_view].reject { |k,v| v[:view] && v[:view] != :hosts_show }.keys.sort.map do |k|
    after = SETTINGSS[:show_view][k.to_sym][:after]
    Deface::Override.new(
      :virtual_path => "hosts/show",
      :name => "makes_summary_tab",
      :insert_after => "<li><a href="nics" data-toggle="tab"><%= _('NICs') %></a></li>",
      :text => "<li><a href="sumary" data-toggle="tab"><%= _('Summary') %></a></li>"
    )
    Deface:Override.new(
      :virtual_path => "hosts/show",
      :name => "add_path_to_tab",
      :insert_after => "<% if @host.bmc_available? %>
                          <div id="bmc" class="tab-pane" data-ajax-url='<%= bmc_host_path(@host)%>' data-on-complete='setPowerState'>
                            <%= spinner(_('Loading BMC information ...')) %>
                          </div>
                        <% end %>",
      :text => "<div id="summary" class="tab-pane" data-ajax-url='<%= summary_host_path(@host)%>' data-on-complete='setPowerState'>
                  <%= spinner(_('Loading Summary information ...')) %>
                </div>"
    )
  end
end
