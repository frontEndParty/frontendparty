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
      name: "Bryan Joseph"
      portrait: "https://avatars3.githubusercontent.com/u/1257573?v=2&s=460"
      position: "Senior Developer"
      company:
        action: "that works at"
        name: "Surge"
        link: "http://www.surgeforward.com"
      presentation: "Bryan will be giving us a high-level overview of Isomorphic JavaScript — shared application code that can run on both the client and the server (neat stuff). He'll also walk us through the tools and frameworks that make it all possible. Prepare yourselves."
      social:
        twitter: "https://twitter.com/bryanjos"
        github: "https://github.com/bryanjos"
    },
    {
      name: "George Mauer"
      portrait: "https://avatars2.githubusercontent.com/u/66150?v=2&s=460"
      position: "Senior Developer"
      company:
        action: "that works at"
        name: "Surge"
        link: "http://www.surgeforward.com"
      presentation: "A module system is important. Some would argue that for maintainable JavaScript having some sort of module system is the *most* important thing you can do. Yet for many, introducing ES6, RequireJS, or browserfy mid-project is a nonstarter. That's why George wrote simple-modules - a micro-library built specifically to make it easy for brownfield projects to transition to using a sane JavaScript module system."
      social:
        twitter: "https://twitter.com/togakangaroo"
        github: "https://github.com/togakangaroo"
    },
    {
      name: "Cameron Sampson"
      portrait: "https://avatars0.githubusercontent.com/u/2473115?v=2&s=460"
      position: "Frontend Developer"
      company:
        action: "that works at"
        name: "Federated Sample"
        link: "http://www.federatedsample.com"
      presentation: "Testing is important (you do have 100% test coverage, right?). Cameron will walk us through using Jasmine, a behavior-driven development testing framework for JavaScript, that you may steel your code against the tempest."
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
