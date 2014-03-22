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
      name: "Jeremy Miller"
      portrait: "https://avatars0.githubusercontent.com/u/4400160?s=400" #gravatar("miller@radolo.com")
      position: "User Interface Designer"
      company:
        name: "Radolo"
        link: "http://www.radolo.com/"
      presentation: "Jeremy is going to speak about the use of collaboration tools such as Invision in the design and development process."
      social:
        twitter: "https://twitter.com/JMillsPaysBills"
        github: "http://github.com/jmillspaysbills"
    },
    {
      name: "George Mauer"
      portrait: gravatar("gmauer@gmail.com")
      position: "Senior Software Developer"
      company:
        name: "Surge"
        link: "http://www.surgeforward.com/"
      presentation: "For the last year George has been the guy doing interviews at Surge while it has nearly tripled in size. He's going to share with us on technical interviews to build a talented team."
      social:
        twitter: "https://twitter.com/togakangaroo"
        github: "http://github.com/togakangaroo"
    },
    {
      name: "Kurtis Rainbolt-Greene"
      portrait: gravatar("me@kurtisrainboltgreene.name")
      position: "Software Developer"
      company:
        name: "WeBRAND"
        link: "http://www.webrand.com/"
      presentation: "Introduction to Ember.js via Lineman.js. A glance at how frontend was done before ember, how it's currently done, and how it's should be done."
      social:
        twitter: "https://twitter.com/krainboltgreene‎"
        github: "http://github.com/krainboltgreene"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html