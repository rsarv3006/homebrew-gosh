class Gosh < Formula
  desc "Hybrid shell combining Go's interpreter with traditional command execution with shellapi integration"
  homepage "https://github.com/rsarv3006/gosh"
  url "https://github.com/rsarv3006/gosh/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "23d38984da4697052afe7bca6ebc99d073e16daaca06794ac9970aa97d2d8872"
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
    ohai "✨ NEW IN v0.2.1: Try 'init' to create config, then use functions like:"
    puts "  gs()           # Git status with colors"
    puts "  ok('Done!')    # Green success message" 
    puts "  build()        # Build project"
    puts "  shellapi.GitStatus()  # Direct shellapi access"
    puts ""
    puts "Then run 'gosh' to start your new shell!"
    puts ""
  end

  test do
    assert_match "gosh>", shell_output("#{bin}/gosh -c 'exit' 2>&1")
  end
end
