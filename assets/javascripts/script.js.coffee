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
      name: "Lee Martin"
      portrait: "https://avatars3.githubusercontent.com/u/199962?v=2&s=460"
      position: "Software Developer"
      company:
        action: "that works with"
        name: "Rockers"
        link: "http://leemartin.com/"
      presentation: "Intimacy Doesn’t Scale. Lee will talk us through how he developed an application directly linking the band Little Dragon to its fans using HTML5 video, Phone Lib and a number of js libraries."
      social:
        twitter: "https://twitter.com/leemartin"
        github: "https://github.com/leemartin"
    },
    {
      name: "Marc Cenac"
      portrait: "https://avatars0.githubusercontent.com/u/547446?s=400"
      position: "Senior Java Developer"
      company:
        action: "that works at"
        name: "GE Capital"
        link: "http://www.nolajobs.gecapital.com/"
      presentation: "Real-time file upload progress meter using node.js and socket.io. When uploading large files, it is useful to show the user the progress of the file upload.  I will show how to accomplish a file upload using AJAX, then how to display the progress of the upload from client to server.  Then I will show how to display the progress of a file upload to a 3rd party service by emitting events from node.js and socket.io."
      social:
        twitter: "https://twitter.com/marcusthebrown"
        github: "https://github.com/marcusthebrown"
    },
    {
      name: "Brian Danos"
      portrait: "https://avatars2.githubusercontent.com/u/1470015?v=2&s=460"
      position: "CIO"
      company:
        action: "that works at"
        name: "Archon"
        link: "http://archoninfosys.com/"
      presentation: "Fast forms. A review of current best practices and a look towards the future of form design."
      social:
        twitter: "https://twitter.com/leemartin"
        github: "https://github.com/leemartin"
    }
  ]
  console.log people
  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html