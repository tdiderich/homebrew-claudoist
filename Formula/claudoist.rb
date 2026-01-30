class Claudoist < Formula
  desc "AI-native customer success workbench CLI"
  homepage "https://github.com/tdiderich/claudoist"
  url "https://github.com/tdiderich/claudoist/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "d04841b651b97ee8c1c5f9ae35795fc19f2ef500ee5aec2fd8604ee635c0e239"
  head "https://github.com/tdiderich/claudoist.git", branch: "main"

  depends_on "node"

  def install
    libexec.install "claudoist"
    libexec.install "package.json"
    libexec.install "package-lock.json" if File.exist?("package-lock.json")
    libexec.install "templates", "prompts", "schemas", "scripts", "playbooks"
    libexec.install "README.md", "CHANGELOG.md", "AGENTS.md", "claudoist.config", "TODOS.example.md"

    system "npm", "install", "--omit=dev", "--prefix", libexec

    bin.write_exec_script libexec/"claudoist"
  end

  test do
    system "#{bin}/claudoist", "--help"
  end
end
