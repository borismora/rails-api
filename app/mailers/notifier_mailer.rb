class NotifierMailer < ApplicationMailer
    def welcome_email(email)
        mail(to: email, subject: 'Email de prueba')
    end
end
