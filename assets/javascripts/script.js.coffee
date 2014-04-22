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
      name: "Matt Shwery"
      portrait: "https://avatars2.githubusercontent.com/u/710752?s=400"
      position: "UI Designer / Developer"
      company:
        action: "that works at"
        name: "Federated Sample"
        link: "http://www.federatedsample.com"
      presentation: "Matt will introduce D3.js, a fantastic library for compelling, custom data-driven visualizations. It provides a wealth of abstraction for composing svgs in the DOM, but is geared towards one-off visuals. Matt will take a look at how we transform d3.js into reusable components."
      social:
        twitter: "https://twitter.com/mshwery"
        github: "https://github.com/mshwery"
    },
    {
      name: "Bryan Joseph"
      portrait: "https://avatars3.githubusercontent.com/u/1257573?s=400"
      position: "Software Developer"
      company:
        action: "that is planning"
        name: "Open Source NOLA"
        link: "http://opensourcenola.org"
      presentation: "A discussion about keeping your web or mobile applications functional while disconnected from your servers. We will discuss some practices and technologies that help to make your apps working whether connected or disconnected."
      social:
        twitter: "https://twitter.com/bryanjos"
        github: "https://github.com/bryanjos"
    },
    {
      name: "Benjamin Eckel"
      portrait: "https://avatars1.githubusercontent.com/u/185919?s=400"
      position: "Software Developer"
      company:
        action: "that blogs at"
        name: "SIMST.IM"
        link: "http://bhelx.simst.im"
      presentation: "Ionic is a new framework based on Angular.js built to simplify the creation of cross-platform mobile applications. Ben will build a 15 minute sample application and talk about the pros and cons of this approach."
      social:
        twitter: "https://twitter.com/bhelx/"
        github: "https://github.com/bhelx/"
    }
  ]
  console.log people
  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html