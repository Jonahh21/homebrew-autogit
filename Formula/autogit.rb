class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/Jonahh21/homebrew-autogit"
  url "https://github.com/Jonahh21/homebrew-autogit/releases/download/v1.6.0/autogit-1.6.0.tar.gz"
  sha256 "9bba5d7f49ffce6e88906e56aa8afc1281ce10fa6f1b8e1dcccab2188d2ebcbc"
  license "MIT"

  def install
    bin.install "autogit"
  end
end
