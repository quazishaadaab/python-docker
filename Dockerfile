
#Specify base image, if no base image than FROM scratch

FROM python:3.8-slim-buster

#This specifies where we start the path. in this case, the path is where the app.py file is 
WORKDIR /app
#Copy the requirement.txt file, second parameter is where the file is located .
COPY requirements.txt requirements.txt
#install all requirements. This is same as terminal line statement
#RUN command will execute stuff in the IMAGE. 
RUN pip3 install -r requirements.txt
#Add all the source code in working directory(app.py)
COPY . .   

#CMD will execute stuff in the container(server)
#Note that we need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD ["python3", "-m" ,"flask", "run","--host=0.0.0.0"]


