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
      name: "Ryan Robinson"
      portrait: "http://photos2.meetupstatic.com/photos/member/d/8/1/0/highres_226975312.jpeg"
      position: "Product Desinger/ UI /UX"
      company:
        action: "that works at"
        name: "Surge Forward"
        link: "http://www.surgeforward.com/"
      presentation: "Learn to use Axure as a front-end design tool to expedite the design/business rules approval with clients and streamline the design process for development handoff."
    },
    {
      name: "Jacqui Nelson"
      portrait: "https://pbs.twimg.com/profile_images/474591077324713984/yC4sBS-B.jpeg"
      position: "Application Developer"
      company:
        action: "that works at"
        name: "Mudbug Media"
        link: "spaceotterinspace.com"
      presentation: "What is ajax? When is it used? How do you debug problems? Find the answers to these questions here."
      social:
        twitter: "https://twitter.com/SpaceOtterIn"
        github: "https://github.com/SpaceOtterInSpace"
    },
    {
      name: "Gil Birman"
      portrait: "https://avatars0.githubusercontent.com/u/2136203?v=3&s=400"
      position: "Developer / Designer"
      company:
        action: "that works at"
        name: "iSeatz"
        link: "http://www.iseatz.com/"
      presentation: "Prepare to have your mind blown – Gil is back and he's gonna teach us transducers."
      social:
          twitter: "https://twitter.com/gilboxme"
          github: "https://github.com/gilbox"
    }
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
