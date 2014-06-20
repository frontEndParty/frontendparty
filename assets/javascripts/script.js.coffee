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
      name: "Gil Birman"
      portrait: "http://i.imgur.com/7B6erWE.jpg"
      position: "Developer"
      company:
        action: "that works at"
        name: "iSeatz"
        link: "http://www.iseatz.com/"
      presentation: "Building responsive UIs sometimes calls for some guile. Gil will walk us through using fluid layout techniques, Sass sorcery, and sprinklings of AngularJS to create ridiculously responsive single-page apps."
      social:
        facebook: "https://facebook.com/gilbox.me"
        github: "https://github.com/gilbox"
    }
    {
      name: "Patrick Burtchaell"
      portrait: "https://avatars.githubusercontent.com/u/3857324?s=400"
      position: "Freelance Designer"
      presentation: "Gulp vs. Grunt: make ready for a build system smackdown. Patrick will be contrasting the two tools by outling use cases and also showing us some cool plugins and resources along the way."
      social:
        twitter: "https://twitter.com/pburtchaell"
        github: "https://github.com/pburtchaell"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html