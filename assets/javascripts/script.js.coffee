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
      name: "Eric Normand"
      portrait: "https://pbs.twimg.com/profile_images/378800000843917243/092f2c83730c6811f68ec991ad026662.jpeg"
      position: "Fearless Leader"
      company:
        action: "at"
        name: "LispCast"
        link: "http://www.lispcast.com/"
      presentation: "CSS meets the Lambda Calculus. What does the lambda calculus (the foundation of functional programming) have to say about CSS? Do preprocessors like Sass and Less really help? How can they do better?"
      social:
        twitter: "https://twitter.com/ericnormand"
        github: "https://github.com/ericnormand"
    },
    {
      name: "Gustavo Tavares"
      portrait: "https://pbs.twimg.com/profile_images/491437675631480835/SA9xqt2o_400x400.jpeg"
      position: "Dragon-Fruit Taster"
      company:
        action: "at"
        name: "Hylotron"
        link: "http://hylotron.com"
      presentation: "Middleman build system. From source to site with minimal pain – Middleman takes on the structure of a static site to produce one. Based on a plugin structure, it can build sites in a variety of ways – free from the constraint of a blog. We'll build a simple website to prove just that, and host it on GitHub so you can imagine Middleman in your workflow."
      social:
        twitter: "https://twitter.com/ovatsug25"
        github: "https://github.com/ovatsug25"
    },
    {
      name: "Brian Berlin"
      portrait: "https://pbs.twimg.com/profile_images/1645815727/37729_403706732819_729157819_5043802_3547129_n_400x400.jpg"
      position: "Co-founder & PTO / Owner"
      company:
        action: "at"
        name: "Airpnp/3Coasts"
        link: "http://www.airpnp.co/"
      presentation: "Automated Front-End Testing. I'm going to show off some tools I've found to do front end testing. Specifically we will look at examples of how we used phantomjs along with casperjs to do functional testing on Airpnp. I'll also show how we use wraith for regression testing before deploying static sites at 3Coasts."
      social:
        twitter: "https://twitter.com/brianberlin"
        github: "https://github.com/brianberlin"
    }
  ]   

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
