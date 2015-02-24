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
      presentation: "Rob takes a look into ES6, the bleeding-edge of JavaScript, and how you can start using it in your projects."
      social:
        twitter: "https://twitter.com/robschley"
        github: "https://github.com/robschley"
    },
    {
      name: "Joe Ellis"
      portrait: "https://0.gravatar.com/avatar/f87a617ecd9bc9f4cd613e420b75c238?d=https%3A%2F%2Fidenticons.github.com%2F3067c356701b93f393f765bed1256bfd.png&r=x&s=440"
      position: "Front-end Developer"
      company:
        action: "that works at"
        name: "Olark"
        link: "https://www.olark.com/"
      presentation: "Sass vs Less vs Stylus vs Rework: Joe does the best advantage / disadvantage / feature comparison of all the popular CSS preprocessors out there to help you figure out which one is best for your project."
      social:
        twitter: "http://twitter.com/notjoeellis"
        github: "http://github.com/joeellis"
    },
    {
      name: "Cameron Sampson"
      portrait: "https://avatars0.githubusercontent.com/u/2473115?v=3&s=460"
      position: "Front-end Developer"
      company:
        action: "that works at"
        name: "Federated Sample"
        link: "http://www.federatedsample.com/"
      presentation: "Cameron will walk us through the wizardry of Browserify, a tool that lets you bundle Node.js -style modules for use on the client-side."
      social:
          twitter: "https://twitter.com/vaerros"
          github: "https://github.com/csampson"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
