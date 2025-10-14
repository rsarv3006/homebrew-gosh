class Gosh < Formula
  desc "Hybrid shell combining Go's interpreter with traditional command execution"
  homepage "https://github.com/rsarv3006/gosh"
  url "https://github.com/rsarv3006/gosh/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "b3e8ef706c3183377804ef6a7a3b81f3b82f9643f68a4a227882c0f9fbdd9ff5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"gosh"
  end

  test do
    assert_match "gosh>", shell_output("#{bin}/gosh -c 'exit' 2>&1")
  end

  def post_install
    puts ""
    ohai "🐚 GOSH SETUP: To use gosh as your login shell:"
    puts "  echo '#{bin}/gosh' | sudo tee -a /etc/shells"
    puts "  chsh -s #{bin}/gosh"
    puts ""
    ohai "Then run 'gosh' to start your new shell!"
    puts ""
  end
end
