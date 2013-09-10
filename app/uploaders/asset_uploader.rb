class AssetUploader < CarrierWave::Uploader::Base

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
