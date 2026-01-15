module MetaTagsHelper
  def default_meta_tags
    {
      site: "Wacca",
      title: "Wacca",
      reverse: true,
      separator: "|",
      description: "Waccaは、あなたの活動やプロジェクトを可視化し、共有するためのポートフォリオサービスです。",
      keywords: "ポートフォリオ, プロジェクト管理, クリエイター, エンジニア",
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: "/icon.png" },
        { href: "/apple-touch-icon.png", rel: "apple-touch-icon", sizes: "180x180", type: "image/png" }
      ],
      og: {
        site_name: "Wacca",
        title: "Wacca",
        description: "Waccaは、あなたの活動やプロジェクトを可視化し、共有するためのポートフォリオサービスです。",
        type: "website",
        url: request.original_url,
        image: image_url("wacca_logo.png"),
        locale: "ja_JP"
      },
      twitter: {
        card: "summary_large_image"
        # site: "@your_twitter_account",
      }
    }
  end
end
