require 'open3'

class Hubble < Formula
  desc "Hubble - Network, Service & Security Observability for Kubernetes using eBPF"
  homepage ""
  url "https://github.com/zhiyanfoo/hubble/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "a1d54fed748d96c166051ad66522c8c43e1982f45208dbcf998e15593ac6dcec"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system 'make', 'hubble-without-git-info'
    bin.install 'hubble'
  end

  test do
    _, _, status = Open3.capture3("#{bin}/hubble", "version")

    assert_equal 0, status
  end
end
