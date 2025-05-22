class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/Jonahh21/homebrew-autogit"
  url "https://github.com/Jonahh21/homebrew-autogit/releases/download/v1.3.0/autogit-1.3.0.tar.gz"
  sha256 "c0133116d04b2c24c2de231aaefa3af13efbc9644e64c5197af0539e6435fb03"
  license "MIT"

  def install
    bin.install "autogit"
  end
end
