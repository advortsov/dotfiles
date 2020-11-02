import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import sys
import secret


def send_email(receiver, subject='', body='', attachment='', ):
    # get the password in the gmail (manage your google account, click on the avatar on the right)
    # then go to security (right) and app password (center)
    # insert the password and then choose mail and this computer and then generate
    # copy the password generated here
    # put the email of the receiver here
    sender = secret.my_email

    # Setup the MIME
    message = MIMEMultipart()
    message['From'] = sender
    message['To'] = receiver
    message['Subject'] = subject

    message.attach(MIMEText(body, 'plain'))

    if attachment != '':
        # open the file in binary
        binary_pdf = open(attachment, 'rb')
        payload = MIMEBase('application', 'octate-stream', Name=attachment)
        payload.set_payload(binary_pdf.read())
        # enconding the binary into base64
        encoders.encode_base64(payload)
        # add header with pdf name
        payload.add_header('Content-Decomposition', 'attachment', filename=attachment)
        message.attach(payload)

    # use gmail with port
    session = smtplib.SMTP('smtp.gmail.com', 587)

    # enable security
    session.starttls()
    # login with mail_id and password
    session.login(sender, secret.my_email_pass)

    text = message.as_string()
    session.sendmail(sender, receiver, text)
    session.quit()
    print('Mail Sent')


if __name__ == "__main__":
    r = sys.argv[1]
    t = ''
    a = ''
    b = ''
    if len(sys.argv) > 2:
        t = sys.argv[2]
    if len(sys.argv) > 3:
        b = sys.argv[3]
    if len(sys.argv) > 4:
        a = sys.argv[4]
    send_email(r, t, b, a)
