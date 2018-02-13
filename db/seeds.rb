# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


UserChannel.destroy_all
User.destroy_all
Message.destroy_all
Channel.destroy_all
Team.destroy_all



flatiron = Team.create(name:"Flatiron")

brendan = User.create(team: flatiron, username: 'bmcilhen@gmail.com', password: '123', display_name: 'Brendan McIlhenny', image_url: 'https://i.ytimg.com/vi/0pNMRvGnamU/hqdefault.jpg')
greg = User.create(team: flatiron, username: 'greg@gmail.com', password: '123', display_name: 'Greg Driza', image_url: 'https://i.ytimg.com/vi/0pNMRvGnamU/hqdefault.jpg')
tim = User.create(team: flatiron, username: 'tim@gmail.com', password: '123', display_name: 'Tim Campbell', image_url: 'https://i.ytimg.com/vi/0pNMRvGnamU/hqdefault.jpg')




webDev1030 = Channel.create(team: flatiron, name: 'Web Dev 10-30', details: 'something', owner: brendan, channel_type: 'CHANNEL')
webDev1120 = Channel.create(team: flatiron, name: 'Web Dev 11-20', details: 'We stink', owner: tim, channel_type: 'CHANNEL')




# webDev1030.users << greg
# webDev1030.save

brendanWebDev1030UserChannel = UserChannel.create(user: brendan, channel: webDev1030, last_seen: DateTime.now)
gregWebDev1030UserChannel = UserChannel.create(user: greg, channel: webDev1030, last_seen: DateTime.now)
timWebDev1030UserChannel = UserChannel.create(user: tim, channel: webDev1030, last_seen: DateTime.now)
timWebDev1120UserChannel = UserChannel.create(user: tim, channel: webDev1120, last_seen: DateTime.now)
brendanWebDev1120UserChannel = UserChannel.create(user: brendan, channel: webDev1120, last_seen: DateTime.now)




brendanWebDev1030Message = Message.create(content: 'hey', user: brendan, channel: webDev1030)
gregWebDev1030Message = Message.create(content: 'bronson', user: greg, channel: webDev1030)
brendanWebDev1030Message = Message.create(content: 'lol, definitely', user: brendan, channel: webDev1030)
