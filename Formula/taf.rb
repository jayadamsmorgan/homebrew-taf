class Taf < Formula
  desc "Testing & Automation Framework in Lua"
  homepage "https://github.com/jayadamsmorgan/taf"
  url "https://github.com/jayadamsmorgan/taf/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "065e682c56f0370262dd945b2d4d1671be2643593a526e3e3d9a5436bf31a380"
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
    system "meson", "setup", "build", *std_meson_args, "-Dlua_install_dir=#{pkgshare}/lua"
    system "meson", "install", "-C", "build"
  end

  test do
    output = shell_output("#{bin}/taf --version")
    assert_equal "TAF Testing Suite version #{version}\n", output
  end
end
