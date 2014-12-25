# Public: Install R to /Applications.
#
# Examples
#
#   include r
#
# Uses http://cran.rstudio.com as source as this should redirect to a local mirror.
class r {

  package { 'R_3_0_2':
    provider => 'pkgdmg',
    source => 'http://cran.r-project.org/bin/macosx/R-3.0.2.pkg',
    ensure => present,
  }

}
