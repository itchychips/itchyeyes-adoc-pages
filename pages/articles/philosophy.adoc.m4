= Philosophy, programming
COMMON_HEADER

NAVHOME_LINK

== The rules.

Rules:

. Break all rules.
. You can handle it.
. Old things in use exist for a reason.
. You are not Big Name Or Specific Company.
. Be pragmatic; not dogmatic.
. Take a stroll and build


== 1. Break all rules.

All rules you find, unless you have a good reason to follow them, ignore them.
Break them. Because programming is very intangible and abstract, only by
realizing the pain will you know if a rule is good or bad. Only through
breaking them will you find which rules are actually important and which are
not so important.

This is not to say no rules should be followed, but any rules you find that
come from other people should be taken with a grain of salt. Rules of your
team's codebase should obviously be followed, but I argue that rules like SOLID
principles and don't-repeat-yourself don't become obvious until you break them
and steer your personal ruleset vaguely in the direction of those rules after
(admittedly annoying) trial and error.

The unfortunate part about programming and software engineering is that we have
very little solid quantitative analysis on the discipline. Thus, the next best
thing is qualtitative analysis. Unfortunately, rules tend to come from people
spreading dogma or selling something, which means you may not be able to tell
at a glance whether a rule is worth following or if it's a bunch of hot steam.

== 2. You can handle it.

Many rules are over-applied. Don't Repeat Yourself. Write Tests Before
Implementation. SOLID principles. Such rules exist when there is sufficient
complexity, yet they can make simple cases far too complex. You can handle the
complexity. Take a step back and see what actual complexity happens as a result
of breaking the rule. If the complexity is manageable (and I mean manageable,
even if frustrating), you can handle it and refactor it later.

In my experience, using too many rules too soon will make it much harder to
retool your code. Test driven development is a very big one in this, because
you're going to throw away at least a third to a half of your code if you need
to rewrite your architecture. That's not to say they don't have benefits, it's
just that often we try to put all the rules we think would be nice at the start
of a clean slate, but never realize how much trouble they can cause during the
initial prototype of a project.

== 3. Old things in use exist for a reason.

It seems some ecosystems like to reinvent theirselves every few years. Concepts
like the relational database, languages like C, and paradigms such as
object-oriented programming exist for a reason. Do not dismiss something out of
hand just because it is old. That is fallacious. That is an appeal to novelty.
Understand why old systems are in place. Understand that familiarity is a
strength. Understand that concepts that stand the test of time with millions of
man hours behind them are worth your time.

That is not to say that just because something is old and in existence that you
should necessarily use it, but it's important to be judicious in what you use
regardless of age. Sometimes old things exist because someone won't let it die.

A concrete example of issues that arose because people embraced the new too
soon was the NoSQL craze from about 2010 to 2014. Many of those efforts have
resulted in rewriting back to the old relational model, because apparently most
data is relational and SQL had a lot of benefit attached to it.

== 4. You are not Big Name Or Specific Company.

You are not Google. You are not Facebook. You are not Microsoft. You are not a
thermal solutions company. Their solutions that they come up with may work, but
they will not fit your needs exactly. Simpler solutions will work for you until
they don't, and you will only know it when they don't work. Their complex
solutions may just bog you down.

If this is not true, and you are, in fact, aforementioned companies, see rules
1 and 2.

Google and Facebook did not take over the world's information by starting big
and getting bigger. They started small. You will start small.

== 5. Be pragmatic; not dogmatic.

These rules seem dogmatic; they are certainly worded that way. They aren't
meant to be. If you disagree with any of them, don't follow them. These are my
personal rules that have stood through my personal development experience and
will continue evolving.

== 6. Take a stroll and build

This is the newest addition to my philosophy, and might conflict with the rest
in some way (see rules 1, 2, and 5 here). Contrasting to "move fast and break
things", I find it more import and fulfilling to "take a stroll and build". You
are allowed to be frustrated with how your code works, what cases it doesn't
cover, and standards misses. However, if you're allowed time to construct
rather than fix what is broken, you'll be in a better mindset and may find
software more fulfilling than draining, and I think that's what we have
collectivly forgotten as software developers.

If I ever help start a tech workers' cooperative, this is the primary value I
would like the culture to have.
