# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nonprofit_list = [
    "National Public Radio", "United Nations Children's Fund",
    "Human Rights Watch", "WikiLeaks", "Green Peace",
    "Smithsonian Institute", "Human Rights Campaign",
    "Charity: water", "Kiva", "American Museum of Natural History",
    "Doctors Without Borders", "Rotary Foundation of Rotary International",
    "Sierra Club", "Feeding America", "New York Public Library",
    "Natural Resources Defense Council", "Metropolitan Museum of Art", "Oxfam",
    "Do Something", "Planned Parenthood Federation of America",
    "Wikimedia Foundation",
    "Environmental Defense", "Monterey Bay Aquarium", "Save the Children",
    "Teach for America", "United States Fund for UNICEF",
    "The Trevor Project", "Alzheimer's Association",
    "International Rescue Committee", "Conservation International Foundation",
    "Water.org", "Museum of Modern Art",
    "Oxfam America", "Friends of the National Zoo", "American Red Cross",
    "Disabled American Veterans", "Lions Clubs International Foundation",
    "National FFA Foundation", "Ronald McDonald House Charities",
    "National Council of YMCAs of the USA", "Samaritan's Purse",
    "Billy Graham Evangelistic Association", "National 4-H Council",
    "United States Olympic Committee", "World Wildlife Fund",
    "Zoological Society of San Diego",
    "American Society for the Prevention of Cruelty to orgs",
    "Goodwill", "Lincoln Center for Performing Arts", "Arthritis Foundation",
    "Compassion International", "Council on Foreign Relations",
    "Partners In Health", "St. Jude's Children's Research Hospital",
    "World Food Program USA", "Stand Up To Cancer",
    "Dana-Farber Cancer Institute", "Wounded Warrior Project",
    "Creative Commons", "International Committee of the Red Cross",
    "Global Giving", "Susan G Komen Breast Cancer Foundation",
    "World Vision USA", "Food & Water Watch", "Room to Read", "ACLU", "Ashoka",
    "Operation Blessing International Relief", "Habitat for Humanity",
    "Girl Scouts of the USA", "Alley Cat Allies", "PetSmart Charities",
    "Art Institute of Chicago", "National Audubon Society",
    "JFK Center for Performing Arts", "Farm Sanctuary", "Big Cat Rescue",
    "International Justice Mission", "Focus on the Family", "USO",
    "Aquarium of the Pacific", "Make-A-Wish", "Operation Homefront",
    "Cincinnati Zoo & Botanical Garden", "World Wildlife Fund",
    "The 92nd Street Y", "The Center for Strategic and International Studies",
    "Carter Center", "Human Rights First",
    "Alex's Lemonade Stand Foundation", "Museum of Fine Arts",
    "Boys & Girls Clubs of America", "National Aquarium",
    "World Vision", "TED", "American Heart Association", "United Way",
    "Defenders of Wildlife", "Public Broadcasting Service", "Kaboom"]


nonprofit_list.count.times do |i|
  Organization.create([
    { name: nonprofit_list[i] }
  ])
end

100.times do
  Donor.create(
    name: Faker::Name.name
    )
end

100.times do
  Donation.create(
    amount: rand(100...100_000),
    donor_id: Donor.all.sample.id,
    organization_id: Organization.all.sample.id,
    date: Faker::Date.backward(1000)
    )
end
