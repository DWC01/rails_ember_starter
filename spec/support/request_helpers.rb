module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end
end

module ActionDispatch::Integration::RequestHelpers
  def options(path, parameters = nil, headers_or_env = nil)
    process :options, path, parameters, headers_or_env
  end
end