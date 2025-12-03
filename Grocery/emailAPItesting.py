def sendMail(email, password, subject="", html="", purpose_url=""):

    html = """<html>
                <head></head>
                <body>
                    <h1>Welcome to Activity School</h1>
                    <p>You have successfully registered , please click on the link below to verify your account</p>
                    <h2>Username : """+email+"""</h2>	
                </body>
            </html>
        """
    return html