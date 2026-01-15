class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :rememberable, :omniauthable, omniauth_providers: %i[google_oauth2 twitter2]

  has_many :projects, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :slug, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /\A[a-zA-Z0-9_\-]+\z/, message: "uses invalid characters" }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # X (Twitter) API often doesn't return email, so generate a dummy one if necessary
      user.email = auth.info.email.presence || "change_me_#{auth.uid}@example.com"
      user.name = auth.info.name
      # Verify if nickname exists (X/Twitter), otherwise use name or random string for slug
      parameterized_name = (auth.info.nickname.presence || auth.info.name).to_s.parameterize
      base_slug = parameterized_name.presence || "user-#{auth.uid}"
      new_slug = base_slug
      counter = 1
      while User.exists?(slug: new_slug)
        new_slug = "#{base_slug}-#{counter}"
        counter += 1
      end
      user.slug = new_slug
    end
  end
end
