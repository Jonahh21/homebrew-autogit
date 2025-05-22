class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/Jonahh21/homebrew-autogit"
  url "https://github.com/Jonahh21/autogit/releases/download/v0.2.0/autogit-1.0.0.tar.gz"
  sha256 "27fd802a9e64806acfacc7dfd9d79afb50216a67922a588bd5b332c401d1a5d5"
  license "MIT"

  def install
    bin.install "autogit"
  end
end