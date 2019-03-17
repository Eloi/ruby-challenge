## How to run the challenge ##

Just run `bundle exec ruby run_challenge.rb` in a terminal.

Run `bundle exec rspec` to run the test suite.

If bundle command is not found, execute `gem install bundler` first.

## Notes ##

### About git comments ###

Make sure to check the git comments, not only the titles.

I've added some thoughts and explanations about what I'm trying to achieve
and the thought process behind what I'm doing in most of them.

### About commiting to master ###

I usually use git flow, but haven't done so on this codebase to not pollute the
custom .git/config, as requested in the challenge, and to simplify
the code review.

In a real production environment, in my opinion working in develop and feature
branches with pull/merge requests and tagged releases is pretty much a must.

### About namespacing ###

All the code I'm doing in the challenge is namespaced in the module Loco2
to avoid any future naming collision with any installed gem.

### About domain modelling ###

All the code under `lib/loco2` will hold the domain models.

Also I'm taking the opportunity of this challenge to test the HashCast library,
that has been on my radar for some time but hadn't had the time to play with it.

HashCast is pretty basic, but the resulting code is very readable, so let's see 
if its featureful enough to fulfill all the requirements of the challenge or If 
I will need to change it later to another gem or custom solution.

### About parser / presenter naming ###

I've dedicated some thought to naming and layout conventions that I should use
for the parser and presentation code. Gemspec style? Rails-like?

Finally I've decided against any overengineering, and just dropped the files
in the root lib directory without any specific namespacing, just a Loco2 prefix.

In a real production project, the nature of the project and the conventions
for it will determine how this will code will be named and be stored.

### About exception handling in retrieving the data ###

For simplicity in the challenge purposes, I haven't done any exception handling
when retrieving the data from disk or parsing the XML.

In real production code that interfaces with external providers, often exception
handling code excedes in LOC the code handling the expected flow, as there are
so many things that could go wrong: faulty networking, misconfigured servers, 
incomplete o malformed data, evolving remote specs, etc. 

### About currency

Again for simplicity: I'm parsing the price as float, and assuming no currency
changes when adding the prices.

Nowadays, in production code I'm wary of any code handling money that does not 
store the price as integer cents to avoid rounding issues, and if possible in
some format with the embedded currency to ensure 100% of the time that we are not
adding/substracting prices in different currencies. 

I strongly support the use of [money](https://github.com/Rubymoney/money) or at least
a simple in-house solution that takes in account the rounding and currency rules.




