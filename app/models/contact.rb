class Contact < MailForm::Base

  attribute :name, validate: true
  attribute :message,   validate: true
  attribute :email,     validate: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  attribute :nickname,  captcha: true


  def headers
    if Rails.env.production?
      mail_to = ENV["MAILER_SENDER"]
    else
      mail_to = ENV["MAILER_TO_DEVELOP"]
    end

    {
      subject: "Alguien en saloon.com te ha enviado un mensaje",
      to: 'santi_rm8@hotmail.com',
      from: %("#{name}" <#{email}>)
    }
  end

end
