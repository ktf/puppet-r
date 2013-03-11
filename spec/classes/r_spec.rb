require 'spec_helper'

describe 'r' do
  it do
    should contain_package('R_2_15_3').with({
      :provider => 'pkg',
      :source   => 'http://cran.rstudio.com/bin/macosx/R-2.15.3.pkg',
    })
  end
end
