require File.expand_path("../../josegonzalez/homebrew-php/Abstract/abstract-php-extension.rb")

class Php55Http176 < AbstractPhp56Extension
  init
  homepage 'http://pecl.php.net/package/pecl_http'
  url 'http://pecl.php.net/get/pecl_http-1.7.6.tgz'
  sha1 'e6c8e75d770019ed5e774829750e609c7df7f6c4'
  head 'https://git.php.net/repository/pecl/http/pecl_http.git'


  def install
      Dir.chdir "pecl_http-#{version}" unless build.head?

      ENV.universal_binary if build.universal?

      safe_phpize
      system "./configure", "--prefix=#{prefix}",
                            phpconfig
      system "make"
      prefix.install "modules/http.so"
      write_config_file unless build.include? "without-config-file"
    end
end
