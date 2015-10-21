class Contact < MailForm::Base
  attribute :firstname, :validate => true
  attribute :lastname,  :validate => true  
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "New Contact",
      :to => "anthony@llewellyn.in",
      :from => %("#{firstname} #{lastname}" <#{email}>)
    }
  end
end