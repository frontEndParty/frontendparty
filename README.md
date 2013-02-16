## Get Started

Install node with guide here:

`http://blog.nodeknockout.com/post/33857791331/how-to-install-node-npm`

Install sass if you do not already have it:

`gem install sass`

Then, to install all the dependencies, run:

`npm install`

Clone this repo, in it's local directory run:

`node app.js`

In a separate tab, run sass watch (it will automatically compile scss files to the public css folder):

`sass --watch assets/css:public/css`

Note:  The above is kind of a pain, so if you don't like SASS, feel free to submit a pull request that changes it over to LESS.  I just prefer SASS so I started with that, and later found out that the node-sass module is currently broken :( I really don't about changing it to LESS if that makes it easier to work with.