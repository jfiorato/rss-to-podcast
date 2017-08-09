class SynthesizeSpeechJob < ActiveJob::Base
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)

    return if post.content.blank?

    temp_file = File.join(Dir.tmpdir, "#{post.id}.mp3")
    FileUtils.touch(temp_file)

    synthesize_speech(post, temp_file)

    post.update_attribute(:audio_url, upload_file(post, temp_file))
  ensure
    File.delete(temp_file) if temp_file
  end

  def synthesize_speech(post, temp_file)
    polly_client = Aws::Polly::Client.new
    response = polly_client.synthesize_speech({
      response_target: temp_file,
      output_format: "mp3",
      text: post.content[0..1400], #polly has a limit apparently
      voice_id: "Joey"
    })
  end

  def upload_file(post, temp_file)
    object_path = File.join(post.feed_id.to_s, File.basename(temp_file))
    s3 = Aws::S3::Resource.new

    s3.bucket(Figaro.env.s3_bucket_name)
              .object(object_path)
              .upload_file(temp_file)

    "https://#{Figaro.env.s3_bucket_name}.s3.amazonaws.com/#{object_path}"
  end
end
