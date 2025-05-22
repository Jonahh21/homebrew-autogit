class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/Jonahh21/homebrew-autogit"
  url "https://github.com/Jonahh21/homebrew-autogit/releases/download/v1.7.0/autogit-1.7.0.tar.gz"
  sha256 "d766e45ddf7f3439bb9f3898c61dec051e783e7932c56c9b9530d205b9df2961"
  license "MIT"

  def install
    bin.install "autogit"
  end
end
