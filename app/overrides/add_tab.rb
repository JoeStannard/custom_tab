
  Deface::Override.new(
                     :virtual_path => 'hosts/show', 
                     :name => 'add_tab_button', 
                     :insert_bottom => 'ul#myTab',
                     :text => %q(<li><a href="#summary" data-toggle="tab"><%= _('Summary') %></a></li>)
                     )
  Deface:Override.new(
                    :virtual_path => "hosts/show",
                    :name => "add_path_to_tab",
                    :insert_bottom => 'div#myTabContent',
                    :text => "\n  <div id='summary' class='tab-pane' data-ajax-url='<%= summary_host_path(@host)%>' data-on-complete='setPowerState'>
                                    <%= spinner(_('Loading Summary information ...')) %>
                                   </div>"
) 
