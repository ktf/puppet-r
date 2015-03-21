# Public: Install R to /Applications.
#
# Examples
#
#   include r
#
# Uses http://cran.rstudio.com as source as this should redirect to a local mirror.
class r {
  $version = '3.1.3'

  if (versioncmp($::macosx_productversion_major, '10.9') >= 0) {
    $macv = 'mavericks'
  } else {
    $macv = 'snowleopard'
  }

  package { 'R':
    provider => 'pkgdmg',
    source => "http://cran.r-project.org/bin/macosx/R-${version}-${macv}.pkg",
    ensure => present,
  }

}
