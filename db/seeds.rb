# creates test users
    user1 = User.create(name: "user one", email: "userone@gmail.com", password_digest: BCrypt::Password.create("pkfnjbhrpewrt"), country: "Hungary")
    user2 = User.create(name: "user two", email: "usertwo@gmail.com", password_digest: BCrypt::Password.create("grt4bbzb"), country: "Hungary")
    user3 = User.create(name: "user three", email: "userthree@gmail.com", password_digest: BCrypt::Password.create("evt4btbrz"), country: "United States")
    user4 = User.create(name: "user four", email: "userfour@gmail.com", password_digest: BCrypt::Password.create("ebrtbrteb"), country: "United Kingdom")
    user5 = User.create(name: "user five", email: "userfive@gmail.com", password_digest: BCrypt::Password.create("kojibib"), country: "Germany")
    user6 = User.create(name: "user six", email: "usersix@gmail.com", password_digest: BCrypt::Password.create("fnjbnovonvn"), country: "United States")
    user7 = User.create(name: "user seven", email: "userseven@gmail.com", password_digest: BCrypt::Password.create("knofjevvb"), country: "United States")
    user8 = User.create(name: "user eight", email: "usereight@gmail.com", password_digest: BCrypt::Password.create("webtbbbew"), country: "Brazil")
    user9 = User.create(name: "user nine", email: "usernine@gmail.com", password_digest: BCrypt::Password.create("kmkerbrb"), country: "Nigeria")
    user10 = User.create(name: "user ten", email: "userten@gmail.com", password_digest: BCrypt::Password.create("kjet4bb"), country: "Australia")
    user11 = User.create(name: "user eleven", email: "usereleven@gmail.com", password_digest: BCrypt::Password.create("kjjbbopwrf3"), country: "South Korea")
    user12 = User.create(name: "user twelve", email: "usertwelve@gmail.com", password_digest: BCrypt::Password.create("Iamuser12"), country: "United States")

# creates built-in challenges
    challenge1 = Challenge.create(title: "Use Energy Efficient Lightbulbs", description: "Energy efficient lightbulbs are a simple way to reduce the amount of power you use. Not only will this help the planet, it will also save your bank balance too. By replacing just one lightbulb, the effect can be tremendous. If every house in the USA did this, it would reduce pollution by the same amount as removing one million cars from the road!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge2 = Challenge.create(title: "Turn Your Computer Off Overnight", description: "If you turn your computer off every night, again you will reduce the power you use. You will save an average of $14 a year. It’s not a huge amount, but better in your pocket than your energy supplier’s right?", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge3 = Challenge.create(title: "Garden Manually", description: "Try to avoid using a hose pipe – use a watering can instead to concentrate on the areas you need watering. Try to water first thing before the sun is up to reduce water wasted to evaporation. Rake old clippings by hand, or leave them to fertilise your soil. Use vinegar on weeds instead of harsh weed killers.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge4 = Challenge.create(title: "Turn Off Lights When You’re Not in The Room", description: "You don’t need to light up a room no one is using. Save energy and money by getting into the habit of switching off the lights when you leave the room. For standard bulbs, do this each time you leave. For energy savers, do this if you are leaving the room for more than fifteen minutes. You will also save on your cooling costs, as lights can make your rooms hotter!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge5 = Challenge.create(title: "Do Errand Batches", description: "Instead of doing each errand as it occurs to you, why not do them in a batch. This will save you time and will also reduce your fuel costs. You could even errand share with a friend!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge6 = Challenge.create(title: "Invest in A Travel Mugs", description: "Having a travel mug keeps your coffee/tea hot for longer, meaning less waste and less re-boiling the kettle! Some coffee chains will even offer a discount for filling up your own cup rather than issuing a paper one. Certain drip coffee makers (here is a good list) also comes with free travel mugs.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge7 = Challenge.create(title: "Adjust The Temperature", description: "Adjusting the temperature in your home by just one degree can save you 10% on your energy use over the year. This is another great saving you and another great help for the planet. Where possible, set a timer so your heating/cooling doesn’t need to be on when you aren’t home.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge8 = Challenge.create(title: "Buy Local Products", description: "Where possible, buy local produce. This saves all the pollution incurred by transporting goods long distance.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge9 = Challenge.create(title: "Buy Second Hand", description: "A lot of things can be sourced second hand. Things that have a short usage period due to growth, for example, a child’s bicycle, can be picked up second hand in fantastic condition and also at a fraction of the price. This saves you money and helps to reduce packaging materials.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge10 = Challenge.create(title: "Use Cruise Control", description: "If your car has a cruise control, then do use it! You paid for it along with the car anyway. This will help to improve your mileage at least by 15%, which will in the process save the environment, gasoline and your wallet.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge11 = Challenge.create(title: "Plant Your Own Tree", description: "There are multiple benefits to planting a tree in your garden. It is good for the environment both the land and the air, it can shade your home and cut back your air con usage and it can even increase the value of your property. You could make it an annual event where each family member plants a new tree.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge12 = Challenge.create(title: "Shorten Your Shower Time", description: "Probably not one to go hand-in-hand with the above point, shortening your shower time buy just two minutes can save more than ten gallons of water. If everyone saved just one gallon, it would be two times more water saved than is currently drawn daily from the Great Lakes.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge13 = Challenge.create(title: "Share A Shower", description: "Feeling a bit amorous and want to clean off a bit for your partner? Chances are they feel exactly the same. Why not shower together – use half the amount of water, and maybe even start the fun in there!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge14 = Challenge.create(title: "Turn The Tap Off When Brushing", description: "When brushing your teeth, turning the tap off while brushing can save five gallons of water per day – the equivalent of 1.5 billion gallons of water across the USA.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge15 = Challenge.create(title: "Opt for A Shower", description: "Switching your bath for a shower can make a huge difference. Baths use approximately double the amount of water a shower uses. This not only saves water, but it saves you money on heating the excess water too.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge16 = Challenge.create(title: "Re-Think Your Water Consumptions", description: "Bottled water is handy when you’re on the go, but why not buy one bottle and then refill it from the tap or your work’s water cooler. Around 90% of water bottles end up decomposing in landfills rather than being recycled.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge17 = Challenge.create(title: "Personalise Gift Wrapping", description: "Gift wrap is a major waste of paper and resource. Re-use gift wrap, bows and tags. Or why not be really creative and make your own gift wrap – use old newspapers, maps or magazines and create your own design!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge18 = Challenge.create(title: "Never Throw Away Newspapers", description: "Make sure to recycle your old newspapers - 69% (or 44 million newspapers) of the newspapers printed in the USA are thrown away every day. Even if you recycle only once per week, half a million trees could be saved. Or even better, why not avoid newspapers altogether and read the online versions!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge19 = Challenge.create(title: "Use All of the Paper", description: "If you jot a note down on paper, save it and use the rest of the sheet for your notes. American business waste 21 million tonnes of paper per annum! Ideally, try to have your business as paperless as possible. When it is absolutely necessary, print on both sides of the page. And don’t forget to recycle it!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge20 = Challenge.create(title: "Don’t Waste Napkins", description: "We’ve all done it – gone somewhere and took a napkin or two more than we needed, only to throw them away unused. If everyone in the USA used one less napkin a day, current figures show that it could save a billion pounds of space in landfills.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge21 = Challenge.create(title: "Launder Sensibly", description: "For your own pocket, and the good of the environment, don’t wash half loads. Wait until there’s enough to do a load and cut your laundry in half. Also, think about the water temperature. If every household in the USA switched from a hot to a warm cycle, it could save the equivalent of 100,000 barrels of oil per day.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge22 = Challenge.create(title: "Have A Vegetarian Day", description: "You don’t have to give up meat for life, but try to commit to one meat free day a week. It takes 2,500 gallons of water to produce a single pound of beef. And each hamburger that comes from animals on ex-forestry ground is responsible for the destruction of fifty-five square feet of forest.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge23 = Challenge.create(title: "Use A Clothesline", description: "Do your clothes a favour and switch off the dryer. Hang clothes outside to dry naturally. The material will last longer, it will smell and feel fresher and of course, you are saving on that power usage!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge24 = Challenge.create(title: "Choose Your Diapers Wisely", description: "Wherever possible, choose cloth diapers – this aids the environment and is kinder to baby’s skin. If you desperately need the convenience of the disposable diaper, use an environmentally friendly brand. The average child uses between five and eight thousand diapers – which equates to 3.5 million tonnes of landfill waste. And makes a huge dent in your pocket!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge25 = Challenge.create(title: "Always Recycle Glass", description: "Did you know that un recycled glass can take up to a million years to decompose? Always make sure to recycle your glass. It can reduce related water pollution by up to fifty percent and related air pollution by up to twenty percent.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge26 = Challenge.create(title: "Don’t Pre-Heat Your Oven", description: "Unless it’s absolutely essential, for example if you’re making bread, you don’t need to pre-heat the oven. You can just set it away when you are ready to start cooking. Bonus tip: When checking the food, look through the door rather than opening it until the final check.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge27 = Challenge.create(title: "Don’t Pre-Rinse the Dishes", description: "If you can’t live without your dishwasher, then at least cut the pre-rinse. With a decent detergent, your dishes will be just as clean and you can save an average of twenty gallons of water per load.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge28 = Challenge.create(title: "Use Picnic Markers", description: "Ideally, use reusable cups/plates/cutlery. If you choose to use disposable ones, use a different colour marker pen for each person so only one of each is used, rather than getting them mixed up and having to get fresh ones.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge29 = Challenge.create(title: "Recycle Your Cell Phone", description: "With the average consumer replacing their cell phones every eighteen months, 130 million cell phones are being disposed of each year. If these go into landfill sites, the toxins from the cell battery leak into the soil and pollute the ground. Use a recycling programme. An added bonus to this is many of these programmes contribute to charities.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge30 = Challenge.create(title: "Regularly Maintain Your Vehicle", description: "If your vehicle’s engine is running correctly, the filters are clean and the tyres correctly inflated, the vehicle will be more efficient on fuel. This reduces pollution and saves you money. It’s worth cleaning out the trunk now and again too – extra weight uses extra fuel!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge31 = Challenge.create(title: "Recycle Unwanted Wire Hangers", description: "Although wire hangers are generally made of steel, therefore not recyclable in the typical sense, many dry cleaners will gladly take these off your hands to reuse.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge32 = Challenge.create(title: "Always Recycle Glass and Aluminium", description: "It is possible to make twenty recycled cans with the same amount of energy it takes to make just one new one. That’s a great saving. And the glass is another great saving. Every ton of glass that is recycled saves nine gallons of the oil used for fuel to produce new glass.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge33 = Challenge.create(title: "Work from Home", description: "If possible, get an arrangement in place with your employer where you can work from home some or all of the time. This saves gasoline, which will reduce air pollution and save you money. And it also means you can work in your pyjamas with no make-up and your hair scragged back if you want to! Bonus.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge34 = Challenge.create(title: "Keep Your Fireplace Damper Closed", description: "If you’re not using your fireplace at any given time, keep the damper closed. Having the damper open is like having a forty-eight inch window open all the time! Image the hundreds of dollars you are wasting on heating air that then gets sucked up your chimney.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge35 = Challenge.create(title: "Reduce Your Junk Mail", description: "The average American citizen receives forty pounds of junk mail per year – forty pounds! That’s a lot of paper being wasted. You can register for services that reduce the amount of junk mail you receive. Not only is this beneficial to the environment, but let’s face it, none of us want that junk mail anyway – the clue is in the name!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge36 = Challenge.create(title: "Choose Matches Over a Lighter", description: "As the majority of lighters these days are disposable lighters, 1.5 billion of them end up in landfills every year. They are also made of plastic and filled with butane, neither of which are environmentally friendly. Choose matches instead, ideally the paper ones. The wood ones are made from trees, but the paper ones are made from recycled paper so you are doing no harm.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge37 = Challenge.create(title: "Use Online Directories", description: "How many people still use paper telephone directories? Virtually none, but the telecoms companies will still send them out unless you opt out. Opt out and use an online service instead. These directories can account for up to 10% of trash in landfill sites. If you do still use a paper directory, don’t forget to recycle the old one.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge38 = Challenge.create(title: "Don’t Throw It Away", description: "You know the old saying, one man’s trash is another man’s treasure? Well it is often true. Don’t throw away perfectly good things just because you’re sick of them, or no longer have use for them. Instead, donate them to a local charity shop, or list them on a free collection site online.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge39 = Challenge.create(title: "Use A Professional Car Wash Service", description: "Car wash services are trying to reduce costs and maximise profits, therefore, they have the optimal amount of water for a thorough clean down to a fine art. Using these services ensures minimal water wastage. If everyone in the USA who washes their own cars used a car wash even once, it would save 8.7 billion gallons of water per year!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge40 = Challenge.create(title: "Don’t Use Plastic Carrier Bags", description: "Plastic carrier bags are not biodegradable, nor are they recyclable. They sit in landfills where they often end up polluting the ocean and infiltrating food sources. Use a stronger, reusable bag.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge41 = Challenge.create(title: "Use e-Tickets", description: "Not only do you save $9 per flight by using an e-ticket as opposed to a paper one, it also saves wasting all of that paper.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge42 = Challenge.create(title: "Download Software", description: "Again, it is often cheaper to download software than it is to buy the discs. It also reduces wasted packaging materials, and it can be beneficial when the software is upgraded, and the downloaded version is automatically included in the updates.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge43 = Challenge.create(title: "Don’t Use an Answering Machine", description: "For the majority of people, answering machines are obsolete, as both cell and land line phones come with integrated voice mail. Make sure you are using the voice mail feature rather than having an external answering machine, which just uses up unnecessary power.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge44 = Challenge.create(title: "Don’t Use Coffee Stirrers", description: "Every year, 138 billion straws and stirrers are thrown away in the USA. Don’t use these stirrers. Not only are they wasteful and bad for the environment, they are a waste of money. Use a spoon to stir your coffee, then simply wash and reuse it.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge45 = Challenge.create(title: "Use Non-Chemical De-Icers", description: "Most people use ice melters to clear the sidewalks after a big storm. These contain harmful chemicals and should be avoided. Similarly, salt based products can be harmful to pets and could end up contaminating drinking water. Always look for a pet-safe, non-chemical de-icer.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge46 = Challenge.create(title: "Use paper based cotton buds", description: "You can buy cotton buds with a paper spindle or a plastic one. If 10% of US households used paper based ones, it would save over 150,000 gallons of gasoline.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge47 = Challenge.create(title: "Pay Household Bills Online", description: "Paying online is not only quick and convenient, but receiving your statements online can make a huge difference to the environment. If every US household received electronic statements, then we could save 18.5 million trees, 2.2 billion tonnes of greenhouse gases 1.7 billion pounds of solid waste per year.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge48 = Challenge.create(title: "Cancel Your Paper Bank Statements", description: "If every US household opted to receive online statements rather than paper, it would save enough money to send 17,000 college graduates to university each year. Some banks will also pay you a dollar a month to opt out of paper statements.", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge49 = Challenge.create(title: "Use Rechargeable Batteries", description: "It’s no secret that the corrosive acid in throw away batteries is extremely damaging to soil when they end up in landfills. Although the recharging unit is initially an unexpected expense, long term, this will save you money. And you’ll never find yourself short of a battery when you need one!", creator: User.all[rand 0..(User.all.size - 1)].name)
    challenge50 = Challenge.create(title: "Share The Knowledge", description: "Often, when people are damaging the environment, it is because they don’t have the facts, or haven’t considered a particular course of action. Share this list with your friends – if each of them takes on board just one point, the effect could be immense. And if they share it on too, think of the mass chain reaction.Let’s work together to make the world a better place.", creator: User.all[rand 0..(User.all.size - 1)].name)

# assigns commitments and challenges through commitments to users
    Challenge.all.each do |ch|
        user_number = rand 0..(User.all.size - 1)
        regularity = ["daily", "occasional"][rand 0..1]
        
        user = User.all[user_number].commitments.build(challenge: ch, regularity: regularity)
        user.save
    end

# creates groups
    group1 = Group.create(name: "Green Olympia", description: "This group was created for sharing knowledge and tips related to eco-friendly lifestyle among people living in Olympia, Washington.")
    group2 = Group.create(name: "Green Budapest", description: "This group was created for sharing knowledge and tips related to eco-friendly lifestyle among people living in Budapest, Hungary.")
    group3 = Group.create(name: "Sustainable Water Use", description: "This group was created for sharing knowledge and tips related to sustainable water consumption and supply.")
    group4 = Group.create(name: "Waste Management", description: "This group was created for sharing knowledge and tips related to sustainable water consumption and supply.")
    group5 = Group.create(name: "Sustainable Energy", description: "This group was created for sharing knowledge and tips related to sustainable water consumption and supply.")

# assigns challenges to groups
    # group1
    group1.challenges << challenge3
    group1.challenges << challenge8
    group1.challenges << challenge9
    group1.challenges << challenge16
    group1.challenges << challenge22
    group1.challenges << challenge50

    # group2
    group2.challenges << challenge3
    group2.challenges << challenge8
    group2.challenges << challenge9
    group2.challenges << challenge16
    group2.challenges << challenge22
    group2.challenges << challenge38

    # group3
    group3.challenges << challenge12
    group3.challenges << challenge13
    group3.challenges << challenge15
    group3.challenges << challenge16
    group3.challenges << challenge27
    group3.challenges << challenge39

    # group4
    group4.challenges << challenge20
    group4.challenges << challenge25
    group4.challenges << challenge29
    group4.challenges << challenge35
    group4.challenges << challenge38

    # group5
    group5.challenges << challenge1
    group5.challenges << challenge2
    group5.challenges << challenge4
    group5.challenges << challenge49

# assigns members to the groups
    user1.memberships.create(membership_type: "creator", group: group2)
    user3.memberships.create(membership_type: "creator", group: group1)
    user5.memberships.create(membership_type: "creator", group: group3)
    user5.memberships.create(membership_type: "creator", group: group4)
    user9.memberships.create(membership_type: "creator", group: group5)

    User.all.each do |u|
        Group.all.each do |g|
            u.memberships.create(group: g) unless g.users.include?(u)
        end
    end

# assigns posts to groups and members
    30.times do
        title = "Lorem Ipsum"
        content = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        user_number = rand 0..(User.all.size - 1)
        group_number = rand 0..4

        User.all[user_number].posts.create(title: title, content: content, group: Group.all[group_number])
    end


# assigns random comments to posts
    20.times do
        post = Post.all[rand 0..(Post.all.size)]
        
        post.comments.create(content: "consectetur adipisicing elit", user: User.all[rand 0..(User.all.size)])
    end

    