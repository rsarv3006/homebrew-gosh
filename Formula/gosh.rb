class Gosh < Formula
  desc "Hybrid shell combining Go's interpreter with traditional command execution with shellapi integration"
  homepage "https://github.com/rsarv3006/gosh"
  url "https://github.com/rsarv3006/gosh/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "85ca068e0bb5b2816aae204f67358f0c29685ef1db7c874efa5d5b912eb9e267"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"gosh"
  end

  def post_install
    puts ""
    ohai "🐚 GOSH SETUP: To use gosh as your login shell:"
    puts "  echo '#{bin}/gosh' | sudo tee -a /etc/shells"
    puts "  chsh -s #{bin}/gosh"
    puts ""
    ohai "🎉 v0.2.4: Sequential directory operations in functions now work!"
    ohai "See https://rsarv3006.github.io/gosh/ for documentation"
    puts ""
  end

  test do
    assert_match "gosh>", shell_output("#{bin}/gosh -c 'exit' 2>&1")
  end
end
