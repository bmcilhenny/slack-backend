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

brendan = User.create(username: 'bmcilhen@gmail.com', password: '123', display_name: 'Brendan McIlhenny', image_url: 'https://i.ytimg.com/vi/0pNMRvGnamU/hqdefault.jpg')
greg = User.create(username: 'greg@gmail.com', password: '123', display_name: 'Greg Driza', image_url: 'https://i.ytimg.com/vi/0pNMRvGnamU/hqdefault.jpg')
tim = User.create(username: 'tim@gmail.com', password: '123', display_name: 'Tim Campbell', image_url: 'https://i.ytimg.com/vi/0pNMRvGnamU/hqdefault.jpg')




webDev1030 = Channel.create(name: 'Web Dev 10-30', details: 'something', owner: brendan)
webDev1120 = Channel.create(name: 'Web Dev 11-20', details: 'We stink', owner: tim)




# webDev1030.users << greg
# webDev1030.save

brendanWebDev1030UserChannel = UserChannel.create(user: brendan, channel: webDev1030, last_seen: DateTime.strptime("02/01/2018 01:18", "%m/%d/%Y %H:%M"))
gregWebDev1030UserChannel = UserChannel.create(user: greg, channel: webDev1030, last_seen: DateTime.strptime("02/01/2018 01:18", "%m/%d/%Y %H:%M"))
timWebDev1030UserChannel = UserChannel.create(user: tim, channel: webDev1030, last_seen: DateTime.strptime("02/01/2018 01:18", "%m/%d/%Y %H:%M"))
timWebDev1120UserChannel = UserChannel.create(user: tim, channel: webDev1120, last_seen: DateTime.strptime("02/01/2018 01:18", "%m/%d/%Y %H:%M"))
brendanWebDev1120UserChannel = UserChannel.create(user: brendan, channel: webDev1120, last_seen: DateTime.strptime("02/01/2018 01:18", "%m/%d/%Y %H:%M"))




brendanWebDev1030Message = Message.create(content: 'hey', user: brendan, channel: webDev1030)
gregWebDev1030Message = Message.create(content: 'bronson', user: greg, channel: webDev1030)
brendanWebDev1030Message = Message.create(content: 'lol, definitely', user: brendan, channel: webDev1030)
