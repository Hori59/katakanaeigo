class ContactMailer < ApplicationMailer
  default from: 'system@example.com'

  def send_mail(contact)
    @contact = contact
    mail(
      to: ENV['MY_MAIL'],
      subject: 'お問い合わせ通知'
    )
  end
end
