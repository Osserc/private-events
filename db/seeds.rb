# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

i = 0
users = Array.new
first_names = ["Steven", "Dakota", "Marley", "Brosef", "Marco", "Nilhogg", "Norio", "Elise", "Inigo", "Morsfeldt"]
last_names = ["Dronner", "Fields", "Bobben", "Josef", "Trulli", "Bilmon", "Shogi", "Fur", "Montoya", "Edgel"]
usernames = ["KebabEnjoyer", "Florin_yak", "Smokey76", "BroJo", "Arugul4", "LizardWizard", "TacMac", "Pianola", "PrepperMaster", "P_i_i_r"]
emails = ["user1@proton.com", "user2@proton.com", "user3@proton.com", "user4@proton.com", "user5@proton.com", "user6@proton.com", "user7@proton.com", "user8@proton.com", "user9@proton.com", "user10@proton.com"]
until i == 10 do
    users << User.create(first_name: first_names[i], last_name: last_names[i], username: usernames[i], email: emails[i], password: "123456")
    i += 1
end

dates = ["09/01/2023", "12/06/2009", "03/21/2022", "05/17/2023", "05/20/2022", "11/07/2022", "08/31/2022", "04/07/2021", "03/12/2020", "06/11/2022", "10/27/2022", "02/25/2021", "09/17/2023", "05/30/2020", "04/14/2020"]
lorem_small = "Lorem ipsum"
lorem_long = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

i = 0
events_list = Array.new
3.times do
    events_list << users[0].events.create!(title: lorem_small, location: lorem_small, date: DateTime.strptime(dates[i], "%m/%d/%Y"), description: lorem_long, private: [true, false].sample, invite_only: [true, false].sample)
    i += 1;
end

2.times do
    events_list << users[1].events.create!(title: lorem_small, location: lorem_small, date: DateTime.strptime(dates[i], "%m/%d/%Y"), description: lorem_long, private: [true, false].sample, invite_only: [true, false].sample)
    i += 1;
end

3.times do
    events_list << users[2].events.create!(title: lorem_small, location: lorem_small, date: DateTime.strptime(dates[i], "%m/%d/%Y"), description: lorem_long, private: [true, false].sample, invite_only: [true, false].sample)
    i += 1;
end

5.times do
    events_list << users[3].events.create!(title: lorem_small, location: lorem_small, date: DateTime.strptime(dates[i], "%m/%d/%Y"), description: lorem_long, private: [true, false].sample, invite_only: [true, false].sample)
    i += 1;
end

2.times do
    events_list << users[4].events.create!(title: lorem_small, location: lorem_small, date: DateTime.strptime(dates[i], "%m/%d/%Y"), description: lorem_long, private: [true, false].sample, invite_only: [true, false].sample)
    i += 1;
end

events_list.each do | event |
    if event.private == true
        event.invite_only = true
    end
end

random_choice = [2, 3, 4, 5, 6]

events_list.each do | event |
    total_invites = random_choice.sample
    randos = (users - [event.user]).sample(total_invites)
    randos.each do | rando |
        event.invitations.create(invitee:rando)
    end
end

users.each do | user |
    i = 0
    total_faves = random_choice.sample
    all_events = events_list.dup
    all_events.delete_if { | event | event.private == true && !event.invitees.include?(user) }
    until i > total_faves do
        count_before = user.favorited_events.count
        single_event = all_events.compact.sample
        single_event.favorites.create(favoriter:user)
        all_events -= [single_event]
        count_after = user.favorited_events.count
        if count_before < count_after
            i += 1
        end
    end
end

users.each do | user |
    i = 0
    total_registrations = random_choice.sample
    all_events = events_list.dup
    all_events.delete_if { | event | event.private == true && !event.invitees.include?(user) }
    until i > total_registrations do
        count_before = user.attended_events.count
        single_event = all_events.sample
        single_event.participations.create(attendee:user)
        all_events -= [single_event]
        count_after = user.attended_events.count
        if count_before < count_after
            i += 1
        end
    end
end