class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/Jonahh21/homebrew-autogit"
  url "https://github.com/Jonahh21/homebrew-autogit/releases/download/v1.5.0/autogit-1.5.0.tar.gz"
  sha256 "c51b88a4d06db336663830037952af3f90b543c3ce014cc2bfc7aa6a7340b70c"
  license "MIT"

  def install
    bin.install "autogit"
  end
end
