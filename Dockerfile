#1st instruction for baseimage
FROM ruby:3.4.1 
#from .ruby-version

#2. setting up the workshop
#for now we are in root dir but its better work on a separate dir so mk it and cd into it
WORKDIR /rails_app
#any command we run after this will happen inside this folder ..better orgaization

#3. otimizing the build layers
#installing the libraries:
    
COPY Gemfile Gemfile.lock ./
#here ./ means to present directory ie working dir ./rails_app

#4.installing Dependencies
RUN bundle install

#5 bring the app code 
#COPY source dest
COPY . . 

#6 we need a port to interact with hit from out side or it will be closed no connection nothing
EXPOSE 8080
# port 8080 of the container it has its own network stack and ports etc
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
#7 what container should do after all this setup or just exit(ie run the rails server)
CMD ["rails","server","-b","0.0.0.0","-p","8080"]



