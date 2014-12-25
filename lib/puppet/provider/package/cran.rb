require "pathname"
require "puppet/provider/package"
require "puppet/util/execution"

Puppet::Type.type(:package).provide :cran, :parent => Puppet::Provider::Package do
  include Puppet::Util::Execution

  has_feature :unversionable

  def self.home
    if boxen_home = Facter.value(:boxen_home)
      "#{boxen_home}/homebrew"
    else
      "/opt/cms"
    end
  end

  def install
    Kernel.system "echo \"install.packages('#{@resource[:name]}', repos='http://cran.ch.r-project.org')\" | R CMD BATCH /dev/stdin /dev/stdout"
  end 

  def self.instances
    return []
  end
#

  def query
     existence = Kernel.system "echo \"'#{@resource[:name]}' %in% rownames(installed.packages())\" | Rscript --quiet /dev/stdin | grep -q TRUE"
     if existence
        return { :ensure => "1.0", :name => @resource[:name] }
     else
        return nil
     end
  end

  def execute(*args)
    if Puppet.features.bundled_environment?
      Bundler.with_clean_env do
        super
      end
    else
      super
    end
  end
  
  # Override default `execute` to run super method in a clean
  # environment without Bundler, if Bundler is present
  def self.execute(*args)
    if Puppet.features.bundled_environment?
      Bundler.with_clean_env do
        super
      end
    else
      super
    end
  end
end
