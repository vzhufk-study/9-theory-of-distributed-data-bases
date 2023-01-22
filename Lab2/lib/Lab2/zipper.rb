require 'zip'


class Zipper
  def run(format, output)
    Zip::ZipFile.open(output, Zip::ZipFile::CREATE) { |zio|
      Dir["**/*." + format].map{ |item| zio.add(item, item) };
    }
  end
end