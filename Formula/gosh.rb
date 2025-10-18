class Gosh < Formula
  desc "Hybrid shell combining Go's interpreter with traditional command execution with shellapi integration"
  homepage "https://github.com/rsarv3006/gosh"
  url "https://github.com/rsarv3006/gosh/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "d85f5aeb3cd49c194fff728fc594303af77ffec886d963cc1289a16dbd588af0"
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
    puts "See https://rsarv3006.github.io/gosh/ for documentation"
  end

  test do
    assert_match "gosh>", shell_output("#{bin}/gosh -c 'exit' 2>&1")
  end
end
