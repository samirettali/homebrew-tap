class Herdr < Formula
  desc "Agent multiplexer that lives in your terminal, with my patches"
  homepage "https://github.com/samirettali/herdr"
  # The fork carries one commit per feature above the released tag, so the
  # branch has no tags of its own and a branch tarball has no stable checksum.
  # A pinned revision is the only honest way to name a build.
  url "https://github.com/samirettali/herdr.git",
      branch:   "patched",
      revision: "d5b95699a217f3e1f0c897fd35c2342e9d066deb"
  version "0.8.0"
  license "Apache-2.0"
  head "https://github.com/samirettali/herdr.git", branch: "patched"

  depends_on "rust" => :build
  # build.rs builds the vendored libghostty-vt, which asks for zig 0.15.2 and
  # does not survive the 0.16 breaking changes.
  depends_on "zig@0.15" => :build
  depends_on :macos

  def install
    # zig@0.15 is keg-only, so build.rs would otherwise pick the newer zig.
    ENV["ZIG"] = formula_opt_bin("zig@0.15")/"zig"
    # Keep the zig package cache inside the build, out of the user's home.
    ENV["ZIG_GLOBAL_CACHE_DIR"] = buildpath/"zig-cache"

    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdr --version")
  end
end
