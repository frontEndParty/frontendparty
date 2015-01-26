$ ->
   # $("h1").fitText(1, { maxFontSize: "40px" } )

  tabs = $("[data-tab]")
  stash = $("[data-behavior=stash]")
  mainContainer = $("[data-behavior=main-container]")
  contentContainer = $("[data-behavior=content-container]")

  tabs.click ->
    oldTab = (tabs.filter -> $(this).hasClass('active')).data "tab"
    newTab = $(this).data "tab"

    oldContent = $("[data-content=" + oldTab + "]")
    newContent = $("[data-content=" + newTab + "]")

    tabs.removeClass "active"
    $(this).addClass "active"

    newHeight = newContent.actual("height")

    contentContainer.animate(
      { opacity: 0 },
      500
    ).animate(
      { height: newHeight },
      500,
      ->
        oldContent.hide()
        newContent.show()
    ).animate({
      opacity: 1
    })

  gravatar = (email) ->
    "http://www.gravatar.com/avatar/" + md5(email)

  people = [


    {
      name: "Rob Schley"
      portrait: "https://pbs.twimg.com/profile_images/460662400736194560/RuaFLZBH.jpeg"
      position: "Developer"
      company:
        action: "that works at"
        name: "Oseberg"
        link: "http://www.oseberg.io"
      presentation: "Rob takes a look into ES6, the bleeding-edge of JavaScript, and how you can start using it in your projects"
      social:
        twitter: "https://twitter.com/robschley"
        github: "https://github.com/robschley"
    },
    {
      name: "Jason Pelker"
      portrait: "https://media.licdn.com/media/p/8/005/04e/04f/1e70c8a.jpg"
      position: "Founder"
      company:
        action: "that made"
        name: "Item-9 Consulting"
        link: "http://item-9.com/"
      presentation: "The End of Web Design - Jason talks about the ways the last 20 years of web design has failed clients and what the future of the medium holds."
      social:
        twitter: "https://twitter.com/jpelker"
        linkedin: "https://www.linkedin.com/in/jasonpelker"
    },
    {
      name: "Gil Birman"
      portrait: "https://avatars0.githubusercontent.com/u/2136203?v=3&s=400"
      position: "Developer / Designer"
      company:
        action: "that works at"
        name: "Skuba Design"
        link: "http://skubadesign.com/"
      presentation: "Gil is going to give us a great intro to building apps with ReactJS and immutable data structures."
      social:
          twitter: "https://twitter.com/gilboxme"
          github: "https://github.com/gilbox"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
