class I386ElfBinutils < Formula
  desc "FSF Binutils for i386-elf cross development"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.gz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.32.tar.gz"
  sha256 "9b0d97b3d30df184d302bced12f976aa1e5fbf4b0be696cdebc6cca30411a46e"

  bottle do
    sha256 "89312270dc465d7d2c622d7253acfecc7e8b0d5a5cc7688822c1dbb10ee7166e" => :mojave
    sha256 "1f7b4aa5dd270750954ef0a177223843affc45214cb7f19fc5e85743608fc8a6" => :high_sierra
    sha256 "7ca42ad9603b7e336f029ae87407c789f1533af638daa54d3db3f2bde2afbf0c" => :sierra
  end

  def install
    system "./configure", "--target=i386-elf",
                          "--disable-multilib",
                          "--disable-nls",
                          "--disable-werror",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "f()", shell_output("#{bin}/i386-elf-c++filt _Z1fv")
  end
end
