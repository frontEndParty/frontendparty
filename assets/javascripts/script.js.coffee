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
      name: "Steve Price"
      portrait: "https://pbs.twimg.com/profile_images/1125393262/MooseRooster2010ver3.png"
      position: "Button Pushing Monkey"
      company:
        action: "at"
        name: "Surge Consulting"
        link: "http://www.surgeforward.com"
      presentation: "How a green-as-grass junior dev ended up inheriting a cowboy-coded mess of a web app architecture, including a bunch of core features that straight up didn't work, making sense out of the chaos by the seat of his pants and ascending to mid-level dev status in the process. For all those facing their own trial-by-fire, the path through it lies within you and here's how to find it."
      social:
        twitter: "https://twitter.com/themooserooster"
        github: "https://github.com/themooserooster"
    },
    {
      name: "Lee Gillentine"
      portrait: "https://pbs.twimg.com/profile_images/479341200982306817/q97m-iTQ.png"
      position: "Developer"
      company:
        action: "at"
        name: "Slate Technology"
        link: "http://leesome.com"
      presentation: "Tips and techniques for rapidly developing web applications from side projects to MVPs to custom software"
      social:
        twitter: "https://twitter.com/geetotes"
        github: "https://github.com/geetotes"
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
