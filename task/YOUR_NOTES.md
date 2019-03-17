## How to run the challenge ##

Just run `bundle exec ruby run_challenge.rb` in a terminal.

Run `bundle exec rspec` to run the test suite.

If bundle command is not found, execute `gem install bundler` first.

## Notes ##

### About git comments ###

Make sure to check the git comments, not only the titles.

I've added some thoughts and explanations about why I'm doing what I'm doing in
most of them.

### About commiting to master ###

I usually use git flow, but haven't done so to not pollute the
custom .git/config as requested in the challenge, and to simplify
the code review.

In a real production environment, working in develop with pull/merge
requests and tagged releases is pretty much a must.

### About namespacing ###

All the code I'm doing in the challenge is namespaced in the module Loco2
to avoid any future naming collision with any installed gem.

### About domain modelling ###

All the code under `lib/loco2` will hold the domain models.

Also I'm taking the opportunity of this challenge to test the HashCast library,
that has been on my radar for some time but hadn't had the time to play with it.

Its pretty basic but the resulting code is very readable, let's see if its
featureful enough to fulfill all the requirements of the challenge or
If I will need to change it later to another gem or custom solution.

### About parser / presenter naming ###

I've done some thought about which naming and layout convention use for the
parser and presentation code. Gemspec style? Rails-like?

Finally I've decided against any overengineering, and just dropped the files
in the root lib directory without any specific namespacing, just a Loco2 prefix.

In a real production project, the nature of the project and the conventions
for it will determine where this will be stored, and which name it shoud have.

### About exception handling in retrieving the data ###

For simplicity in the challenge purposes, I haven't done any exception handling
when retrieving the data from disk or parsing the XML.

In real production code that interfaces with external providers, often exception
handling code to take in account faulty networking, incomplete o malformed data, 
etc. excedes in LOC the code handling the expected flow.

### About currency

Again for simplicity I'm parsing the price as float. Nowadays, in production code
I'm wary of any code handling money that does not store the price as integer cents
to avoid rounding issues, and if possible in some format with the embedded currency
to ensure 100% of the time that we are not adding/substracting prices in different
currencies. 

I strongly support the use of [money](https://github.com/Rubymoney/money) or at least
a simple in-house solution that takes in account the rounding and currency rules.




