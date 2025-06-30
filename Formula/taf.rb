class Taf < Formula
  desc "Testing & Automation Framework in Lua"
  homepage "https://github.com/jayadamsmorgan/taf"
  url "https://github.com/jayadamsmorgan/taf/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "ba13f007750fe16b468a06b0729570b45a57c1ef525b303faa824386e2bd2691"
  license "Apache-2.0"

  depends_on "meson"      => :build
  depends_on "ninja"      => :build
  depends_on "pkgconf"    => :build

  depends_on "curl"
  depends_on "json-c"
  depends_on "libdeflate"
  depends_on "libserialport"
  depends_on "libssh2"
  depends_on "libunistring"
  depends_on "lua"
  depends_on "ncurses"
  depends_on "notcurses"

  def install
    system "meson", "setup", "build", *std_meson_args, "-Dtaf_dir_path=#{pkgshare}"
    system "meson", "install", "-C", "build"
  end

  test do
    output = shell_output("#{bin}/taf --version")
    assert_equal "TAF Testing Suite version #{version}\n", output
  end
end
