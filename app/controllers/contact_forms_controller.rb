class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.deliver
      redirect_to root_path
      flash[:success] = "Your email has been sent! 😀"
    else
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
