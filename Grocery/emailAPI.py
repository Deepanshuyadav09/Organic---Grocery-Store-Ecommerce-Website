def sendMail(email,password,subject="",html="",purpose_url=""):
	import smtplib
	from email.mime.multipart import MIMEMultipart
	from email.mime.text import MIMEText
	
	me = "ydeep9154@gmail.com"
	you = email

	msg = MIMEMultipart('alternative')
	msg['From'] = me
	msg['To'] = you

	if subject=="":
		msg['Subject'] = "Registration Successfull"
	else:
		msg['Subject'] = subject

	if html=="":
		html = """<html>
  					<head></head>
  					<body>
    					<h1>Welcome to Organic - Grocery Shop.</h1>
    					<p>You have successfully registered on this website</p>
    					<h2>Username : """+email+"""</h2>    					
    				</body>
				</html>
			"""
	else:
		html = html
	
	s = smtplib.SMTP('smtp.gmail.com', 587) 
	s.starttls() 
	s.login("ydeep9154@gmail.com", "ymzz dwnf ewxa rknd") 

	
	part2 = MIMEText(html, 'html')

	msg.attach(part2)
	
	s.sendmail(me,you, str(msg)) 
	s.quit() 
	print("mail send successfully....")
