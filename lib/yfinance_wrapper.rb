# frozen_string_literal: true

require_relative "yfinance_wrapper/ticker"
# rubocop:disable Style/MixinUsage
include PyCall::Import
# rubocop:enable Style/MixinUsage

module YfinanceWrapper
  pyimport :yfinance, as: :yf
  # rubocop:disable Style/ClassVars
  @@yf = yf

  # Patch: Add method to support new yfinance global config (e.g., for proxies)
  def self.set_config(proxy: nil)
    # yfinance.set_config(proxy="...") is the new API
    @@yf.set_config(proxy: proxy)
  end
  # rubocop:enable Style/ClassVars
end
