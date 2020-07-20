# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact
    contact = Contact.new(name: "山田 太郎", body: "問合せメッセージ")
    ContactMailer.send_mail(contact)
  end
end
