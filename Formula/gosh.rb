class Gosh < Formula
  desc "Hybrid shell combining Go's interpreter with traditional command execution with shellapi integration"
  homepage "https://github.com/rsarv3006/gosh"
  url "https://github.com/rsarv3006/gosh/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "554e5d290259029a72d5705b12a8988ee4ffe718ce00c21b1f131fbbae894c41"
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
    ohai "🎉 NEW IN v0.2.2: Working shellapi functions that actually execute commands!"
    puts "  build()        # Real go build with error feedback"
    puts "  test()         # Real go test with full output"
    puts "  run()          # Real go run . execution"
    puts "  gs()           # Real git status with colors"
    puts "  goGosh()       # Actually changes directory and persists!"
    puts "  shellapi.GoBuild()     # Direct access to working functions"
    puts ""
    puts "Functions now execute real commands, not just substitution strings!"
    puts "Directory changes persist across shell sessions. Try 'gosh' to start!"
    puts ""
  end

  test do
    assert_match "gosh>", shell_output("#{bin}/gosh -c 'exit' 2>&1")
  end
end
