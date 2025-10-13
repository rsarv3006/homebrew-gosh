class Gosh < Formula
  desc "Hybrid shell combining Go's interpreter with traditional command execution"
  homepage "https://github.com/rsarv3006/gosh"
  url "https://github.com/rsarv3006/gosh/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "d4fa202b3efe1bdb37d75ed249a1098aab408f853c3181538cbc883371e8889c"
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
