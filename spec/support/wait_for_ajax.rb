# frozen_string_literal: true

module WaitForAjax
  # espera o turbolinks carregar para prosseguir
  def wait_turbolinks
    has_css?('.turbolinks-progress-bar', visible: true)
    has_no_css?('.turbolinks-progress-bar')
  end
end

RSpec.configure do |config|
  # Inclui esse modulo em spec com tags de 'js'
  config.include WaitForAjax, js: true
end
