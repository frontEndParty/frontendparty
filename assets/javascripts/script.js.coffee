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
      name: "Jonathan Lloyd"
      portrait: "https://avatars3.githubusercontent.com/u/4411668?v=3&s=460"
      position: "VP Product Development"
      company:
        action: "that works at"
        name: "Turbosquid"
        link: "http://www.turbosquid.com"
      presentation: "Peek into the world of launching a product as Jonathan explores a rapid and light-weight process for developing front-end prototypes."
      social:
        github: "https://github.com/Jonpolygon"
        twitter: "https://twitter.com/jonpolygon"
    },
    {
      name: "Elise Hotard Blanchard"
      portrait: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAIAAAAAJDA5YjdmMjM2LWVlZjYtNDkyYS04NGQwLTBkYmY5Nzg5ODJiNg.jpg"
      position: "Designer + Developer"
      company:
        action: "at"
        name: "elisehotardblanchard.com"
        link: "http://elisehotardblanchard.com/"
      presentation: "With retina devices becoming the standard, SVGs provide an illustration solution that is supported, scalable, and crisp. By learning how to optimize SVGs for the web, we can provide superior and interactive user interfaces to the visitors on our websites."
      social:
        twitter: "https://twitter.com/oleaceae"
    },
    {
      name: "Matt Shwery"
      portrait: "https://avatars0.githubusercontent.com/u/710752?v=3&s=460"
      position: "Director of Development"
      company:
        action: "being awesome at"
        name: "Federated Sample"
        link: "http://www.federatedsample.com/"
      presentation: "JSPM is on a mission to streamline all the things: package manager that wraps npm+github, flat versioned dependencies (deduped!), SystemJS module loader, built-in ES6 support. Could JSPM really replace npm + gulp + browserify bundling entirely?"
      social:
        github: "https://github.com/mshwery"
        twitter: "https://twitter.com/mshwery"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
