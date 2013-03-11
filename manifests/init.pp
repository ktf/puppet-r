# Public: Install R to /Applications.
#
# Examples
#
#   include r
class r {

  package { 'R_2_15_3':
    provider => 'pkgdmg',
    source   => 'http://cran.rstudio.com/bin/macosx/R-2.15.3.pkg',
  }

}
