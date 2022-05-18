# README

This is an Odin Project assignment. Find out more here: https://www.theodinproject.com/lessons/ruby-on-rails-private-events

This was a fun project, and really solidified my understanding of the Rails framework. I was a little shaky on some aspects, like routing, seeding and forms, but between googling and experimentation I got them to work the way I wanted them to.

In term of functionality, I went a bit beyond the specifications, since I decided to add a favorite system to the app. This way, a user can bookmark specific events without committing to a registration. Bookmarked events appear in the user's profile page when the same user is logged in. Speaking of the profile, if the corresponding user is logged in, it displays a button to edit the relative profile, the bookmarked events, and then the events he created and the ones he registered for, divided by date. Without logging in, the panel only shows the created and registered events.

The events themselves offer two distinct functionalities: private mode and invite-only mode. A privated event will not allow anyone to see it or visualizing its page without being on the invite list; an invited-only event will allow anyone to see it, but will prevent registration unless the user is invited.

Invitations are managed through the event page, by checking the users and then clicking the corresponding button, which will regenerate the invitation list and update it if necessary.

Now, for its flaws: the design I ended up with is not to my liking, and I paid the price of trying to reuse .css classes; it would have been much better to namespace like I did with my previous project (https://ancient-depths-57347.herokuapp.com/). What I gained in brevity I paid for in ease of modification. But it was a learning experience.

For a demonstration without bothering to sign-up, you can log-in with the following credentials: email: user1@proton.com password: 123456

Live preview on Heroku: https://secret-thicket-41728.herokuapp.com/