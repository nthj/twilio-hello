# Third Prestige Switchboard

Third Prestige was a Ruby on Rails & design studio in Austin, Texas. The core idea behind the switchboard is that we had a small team, worked shifted hours, and were inclined to go very deep in the zone for hours at a time. 

But at any given moment, one of us on the team was less heads down than the rest. I realized this correlated with whoever was most active in Campfire... and I let Ruby solve the rest.

## The ideas

* I wanted whoever was most active in Campfire to answer incoming office line calls.
* I wanted a small switchboard between technical issues and sales. Classic Twilio use case.
* I wanted transcripts to show up in Campfire, so no matter who answered a call, the entire team always had the context of the conversation.
* This was the days before many SAAS services supported team/organization logins, but I was a stickler for 2-factor authentication. I kinda "hacked" this by having text messages piped into our Campfire room, so we could grab 2FA codes for shared logins from there. (I then added our office line as our 2FA for Twilio itself, which was short-sighted, as became evident when our company card was replaced and I couldn't log in to fix our Twilio account because the Twilio account was suspended from the invalid billing information. Hehe. Twilio Support got me up back up and running in no time though. :)

## Hosting

We spooled Hello up onto a Heroku dyno and couldn't have been happier.

## Authored

Copyright 2013-2016 Third Prestige, LLC and Nathaniel Jones.

