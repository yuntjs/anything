class HomepageController < ApplicationController

  def index
    client = Yelp::Client.new({
      consumer_key: 'wkYn1Vpp85jFwM1jUFCuEg',
      consumer_secret: '9edatASynSP1-bqia3oRA-Fx_Z8',
      token: 'JuRtpF95wsG5sOskvsBPXPd3e-1bIx98',
      token_secret: 'L58HK1jRigqkAS55jKR1aV94EHM'
      })
    p client.search('22312',{ term: 'restaurant', limit: 40 }).businesses
  end
end
