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
      name: "Jay Casteel"
      portrait: "https://pbs.twimg.com/profile_images/532662763290509312/IjkLc2yB.jpeg"
      presentation: "Web design is a constantly evolving art that, in retrospect, has had some pretty hilarious growing pains. Jay will talk about the evolution of web design: where it's been and where it's going."
      social:
        twitter: "https://twitter.com/jay_casteel"
    },
    {
      name: "Cameron Sampson"
      portrait: ""
      presentation: "Cameron will walk through us data visualization in virtual reality (!) using Mozilla A-Frame (WebVR). The future is now."
      social:
        globe: "http://www.cameronsampson.com"
    },
    {
      name: "Eli Silverman"
      portrait: ""
      presentation: "Why are WordPress developers the last to gain access to modern dev and deployment tools? There's no good reason... Eli will be giving a demo of how to install and configure the automated deployment tools he uses that leverage grunt.js and the WP-CLI. Great for intermediate WP devs looking to grow their capacity and work more efficiently."
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
