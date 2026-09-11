class Herdr < Formula
  desc "Agent multiplexer that lives in your terminal, with my patches"
  homepage "https://github.com/samirettali/herdr"
  # The fork carries one commit per feature above upstream master, so the
  # branch has no tags of its own and a branch tarball has no stable checksum.
  # A pinned revision is the only honest way to name a build.
  url "https://github.com/samirettali/herdr.git",
      branch:   "patched",
      revision: "6dd67e599fef3142cf80f8a973fc61680274ac60"
  version "0.9.0"
  license "Apache-2.0"
  head "https://github.com/samirettali/herdr.git", branch: "patched"

  depends_on "rust" => :build
  # build.rs builds the vendored libghostty-vt, which requires zig 0.16.
  depends_on "zig" => :build
  depends_on :macos

  def install
    ENV["ZIG"] = Formula["zig"].opt_bin/"zig"
    # Keep the zig package cache inside the build, out of the user's home.
    ENV["ZIG_GLOBAL_CACHE_DIR"] = buildpath/"zig-cache"

    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match(/^herdr \d+\.\d+\.\d+$/, shell_output("#{bin}/herdr --version").strip)
  end
end
