require 'rest-client'
require 'json'
class Wompi::WompiCreateTransaction < ApplicationService
  def initialize
    logger.debug ENV['WOMPI_URL']
    @url = ENV['WOMPI_URL'] + '/merchants/' + ENV['WOMPI_PUB']
    @headers = {
      'content-type': "application/json",
      'x-apikey': "-------",
      'cache-control': "no-cache"
    }
  end

  def call
    res = RestClient.get(@url, @headers)
    body = JSON.parse(res, { symbolize_names: true })
    body
  end
end