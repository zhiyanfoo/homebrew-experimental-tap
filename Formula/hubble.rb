require 'open3'

class Hubble < Formula
  desc "Hubble - Network, Service & Security Observability for Kubernetes using eBPF"
  homepage "https://github.com/cilium/hubble"
  url "https://github.com/cilium/hubble.git",
      tag:      "v0.8.0"
  license "Apache-2.0"
  head "https://github.com/cilium/hubble.git"

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
