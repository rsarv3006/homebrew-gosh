class Gosh < Formula
  desc "A hybrid shell that combines Go's interpreter with traditional command execution"
  homepage "https://github.com/rsarv3006/gosh"
  url "https://github.com/rsarv3006/gosh/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "be1071656be7b626630112fcb56b6bdae051ba1f59100fc4502e034cc2cd8f28"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"gosh"
  end

  test do
    assert_match "gosh>", shell_output("#{bin}/gosh -c 'exit' 2>&1", 0)
  end
end
