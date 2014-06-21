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
      presentation: "Gulp vs. Grunt: make ready for a build system smackdown. Patrick will be introducing us to the contenders, then contrasting the two tools by outlining use cases, as well as showing us some cool plugins and resources along the way."
      social:
        twitter: "https://twitter.com/pburtchaell"
        github: "https://github.com/pburtchaell"
    },
    {
      name: "Adam Clarke"
      portrait: "https://avatars.githubusercontent.com/u/85638?s=400"
      position: "Developer"
      company:
        action: "that works at"
        name: "Revelry Labs"
        link: "http://revelry.co/"
      presentation: "Javascript. We all know it. We all love/tolerate it. Adam's spent countless hours writing and maintaining javascript code, and quite frankly he's fed up with the pain of writing and maintaining large, often unorganized javascript codebases. He found backbone.js and never looked back. Adam will explain how he got started using backbone to make smooth javascript music."
      social:
        twitter: "https://twitter.com/vaxinate/"
        github: "https://github.com/vaxinate"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html