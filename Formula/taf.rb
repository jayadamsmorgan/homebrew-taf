class Taf < Formula
  desc "Testing & Automation Framework in Lua"
  homepage "https://github.com/jayadamsmorgan/taf"
  url "https://github.com/jayadamsmorgan/taf/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "c0dd64b1ae7cfb962a4cf8563effed1d5babe294ca597a5ad9148a5dbb2e7c76"
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
