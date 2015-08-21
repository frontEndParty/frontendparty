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
      300
    ).animate(
      { height: newHeight },
      300,
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
      name: "Eric Normand"
      portrait: "https://avatars0.githubusercontent.com/u/116172?v=3&s=460"
      position: "Fearless Leader"
      company:
        action: "at"
        name: "LispCast"
        link: "http://www.lispcast.com"
      presentation: "Functional programming is gaining some serious traction in the frontend. Now's your opportunity to become initiated. Eric will be introducing us to ClojureScript, a Clojure-to-JavaScript compiler. Learn about the ins and outs of its ecosystem, such as React extensions, and more. I hope you like parentheses."
      social:
        github: "https://github.com/ericnormand"
        twitter: "https://twitter.com/ericnormand"
    },
    {
      name: "Cameron Sampson"
      portrait: "https://avatars0.githubusercontent.com/u/2473115?v=3&s=460"
      position: "Senior Developer"
      company:
        action: "at"
        name: "Lucid"
        link: "http://luc.id"
      presentation: "Learning, developing, and future-proofing an AngularJS application is serious business. but it doesn't have to feel completely alien. With options like ES6, Babel, and recent updates to the library, writing kickass angular code is easier than ever. Cameron will talk to us about how to use those tools to make angular feel like an actual 'superheroic MVW framework'...like Batman, if Batman was a JavaScript framework (and friendlier)."
      social:
        github: "https://github.com/csampson"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
