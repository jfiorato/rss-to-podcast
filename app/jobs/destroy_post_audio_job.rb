class DestroyPostAudioJob < ActiveJob::Base
  queue_as :default

  def perform(feed_id)
    s3 = Aws::S3::Resource.new

    s3.bucket(Figaro.env.s3_bucket_name).objects(prefix: "#{feed_id}/").each do |obj|
      obj.delete
    end
  end
end
