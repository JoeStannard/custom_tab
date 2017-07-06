module ForemanCustomTab
  module HostsHelper
    def summary_fields(host)
      require 'yaml'
      rows = YAML.load_file('config/tab.yaml')

      fields = []
      rows.each do |a, b|
        fields += [[_(a), host.send(b)]] if host.send(b).present?
      end
      fields
    end
  end
end
