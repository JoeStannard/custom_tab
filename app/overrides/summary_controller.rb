if SETTINGS[:hosts_controller]
  SETTINGS[:hosts_controller].reject { |k,v| v[:controller] && v[:controller] != :hosts_controller }.keys.sort.map do |k|
    Deface::Override.new(
      :virtual_path => "controllers/hosts",
      :name => "summary_controller",
      :insert_after => "def nics
                          render :partial => 'nics'
                          puts "NICs run"
                          rescue ActionView::Template::Error => exception
                          process_ajax_error exception, 'fetch interfaces information'
                        end",
      :text => "def summary
                  render :partial => 'summary', :locals => { :host => @host }
                  rescue ActionView::Template::Error => exception
                  process_ajax_error exception, 'fetch interfaces information'
                end"
    )
  end
end
