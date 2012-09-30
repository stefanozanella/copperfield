class SemVer 
  # RegExp inspired by https://github.com/mojombo/semver/issues/32
  SEMVER = /((\d+)\.(\d+)\.(\d+))(?:-([\dA-z\-]+(?:\.[\dA-z\-]+)*))?(?:\+([\dA-z\-]+(?:\.[\dA-z\-]+)*))?/

  SEMVER_ONLY = /^#{SEMVER}$/ 
  SEMVER_INTO_STRING = /^(.*)#{SEMVER}(.*)$/ 

  def self.valid?(version) 
    SEMVER_ONLY =~ version
  end

  def self.contains_valid?(string)
    SEMVER_INTO_STRING =~ string
  end

end
