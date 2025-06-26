class Taf < Formula
  desc "Testing & Automation Framework in Lua"
  homepage "https://github.com/jayadamsmorgan/taf"
  url "https://github.com/jayadamsmorgan/taf/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ed71b0013b001873c6b6e1bda04d564de462208e95f21e4cb9a2aae0bcb91c77"
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
    system "meson", "setup", "build", *std_meson_args
    system "meson", "install", "-C", "build"
  end

  def caveats
    <<~EOS
      TAF installs its Lua helper modules under ~/.taf/<version>/lib at build
      time. That directory is *not* under Homebrew’s prefix, so upgrades and
      uninstalls will leave the data intact. You can override the install
      location by exporting HOME before building, or by patching the
      Meson script.
    EOS
  end

  test do
    output = shell_output("#{bin}/taf --version")
    assert_equal "TAF Testing Suite version #{version}\n", output
  end
end
