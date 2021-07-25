require 'open3'

class Hubble < Formula
  desc "Hubble - Network, Service & Security Observability for Kubernetes using eBPF"
  homepage "https://github.com/cilium/hubble"
  url "https://github.com/cilium/hubble/releases/download/v0.8.1/hubble-darwin-arm64.tar.gz"
  sha256 "b4ef62eebdbb0b692480f3334c14bb01bd5b782c5318bfd089621f96851d5096"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system 'make', 'hubble'
    bin.install 'hubble'
  end

  test do
    _, _, status = Open3.capture3("#{bin}/hubble", "version")

    assert_equal 0, status
  end
end
