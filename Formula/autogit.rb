class Autogit < Formula
  desc "Gestión automática de versiones semánticas en commits de Git"
  homepage "https://github.com/Jonahh21/homebrew-autogit"
  url "https://github.com/Jonahh21/homebrew-autogit/releases/download/v1.2.0/autogit-1.2.0.tar.gz"
  sha256 "64d94e689b7e7e94982f6421db159d58db16b83c35d54734a2a9f0d003ae8130"
  license "MIT"

  def install
    bin.install "autogit"
  end
end
