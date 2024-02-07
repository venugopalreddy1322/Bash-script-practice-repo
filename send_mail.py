import smtplib

email = "venu.cph@gmail.com"
password = "<smtp_password>"
hostname = "smtp.gmail.com"

with smtplib.SMTP(host=hostname) as connection:
        connection.starttls()

        connection.login(user=email, password=password)
        connection.sendmail(from_addr=email,
                            to_addrs="venu.cph@gmail.com",
                            msg="Subject: Test\n\n This is test email")
