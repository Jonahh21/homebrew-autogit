class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/juanfran-dev/autogit"
  url "https://github.com/juanfran-dev/autogit/releases/download/v1.0.0/autogit-1.0.0.tar.gz"
  sha256 "ACA_VA_EL_HASH_DEL_TAR_GZ"
  license "MIT"

  def install
    bin.install "autogit"
  end
end