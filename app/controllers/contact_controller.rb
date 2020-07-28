class ContactController < ApplicationController
  def index # 問合せ送信画面
    @contact = Contact.new
  end

  def confirm # 問合せ内容確認画面
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def thanks # 送信完了画面
    @contact = Contact.new(contact_params)
    if params[:back]
      render :index
    else
      ContactMailer.send_mail(@contact)
      render :action => 'thanks'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :body, :email)
  end
end
