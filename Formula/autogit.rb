class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/Jonahh21/homebrew-autogit"
  url "https://github.com/Jonahh21/homebrew-autogit/releases/download/v1.6.0/autogit-1.6.0.tar.gz"
  sha256 "316efe86ae73c3d582efddb9fc44f04dd17a3b15f12fdc5d1a885cbdcd8430e0"
  license "MIT"

  def install
    bin.install "autogit"
  end
end
