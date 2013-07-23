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
      portrait: gravatar "eclecticrob@gmail.com"
      position: "Developer Extraordinaire"
      company:
        name: "Rob Schley"
        link: "http://github.com/robschley"
      presentation: "Rob is going to dive deep into AngularJS and show us some advanced techniques when using AngularJS in real-world applications."
      social:
        twitter: "http://twitter.com/RobSchley"
        github: "http://github.com/robschley"
    },
    {
      name: "Ron Domingue"
      portrait: gravatar "me@rondomingue.com"
      position: "Creative Director and Co-Founder "
      company:
        name: "Epilogue"
        link: "http://epiloguepub.com/"
      presentation: "Ron will talk about his experience with digital publishing versus app development on the iOS platform, producing Hotel Whiskey Tango and Love Letters from New Orleans. "
      social:
        twitter: "http://twitter.com/rondomingue"
        facebook: "https://www.facebook.com/rondomingue"
    },
    {
      name: "Steven Achord"
      portrait: gravatar "steven@achordinteractive.com"
      position: "Interactive Developer / Designer"
      company:
        name: "Achord Interactive"
        link: "http://cargocollective.com/achord"
      presentation: "Steven is presenting on everything CodeKit, an awesome app to help speed up front-end development through automation."
      social:
        twitter: "http://twitter.com/StevenAchord"
        facebook: "https://www.facebook.com/steven.achord.5"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html