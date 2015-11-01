class Contact < MailForm::Base
  attribute :firstname, :validate => true
  attribute :lastname, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :nickname, :captcha => true
  def headers
    {
      :subject => 'Registration Form',
      :to => 'drallewellyn@me.com',
      :from => %('#{firstname} #{lastname}' <#{email}>)
    }
  end
end