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
      name: "Patrick Burtchaell"
      portrait: "https://avatars2.githubusercontent.com/u/3857324?v=3&s=460"
      position: "Product Design Intern"
      company:
        action: "at"
        name: "Facebook"
        link: "http://pburtchaell.com"
      presentation: "Out of the box, Redux is great for synchronous changes to state, but how do you effectively handle asynchronous changes that involve data access and network requests? Patrick will introduce promises, explain Redux middleware that helps solve the async actions problem and cover some ways you can handle async actions in user-interfaces that use React and React Router."
      social:
        github: "https://github.com/pburtchaell"
        twitter: "https://twitter.com/pburtchaell"
        facebook: "https://www.facebook.com/pburtchaell"
    },
    {
      name: "Bill Brown"
      portrait: "https://avatars1.githubusercontent.com/u/1588930?v=3&s=460"
      position: "Interaction Designer"
      company:
        action: "at"
        name: "Echo & Co."
        link: "https://echo.co/"
      presentation: "Bill is going to give us an overview of how to scaffold out front-end projects using Yeoman, \"the web's scaffolding tool for modern web apps\". Learn how to build your own generator and watch a quick demo of Bill's very own custom generator."
      social:
        github: "https://github.com/billybrown"
    },
    {
      name: "Matt Shwery"
      portrait: "https://pbs.twimg.com/profile_images/1244257407/twitme_400x400.png"
      position: "Director of Development"
      company:
        action: "at"
        name: "Lucid"
        link: "https://luc.id/"
      presentation: "Gone are the days of `float`s and `position: absolute` to position parts of your web page. Flexbox solves layout and positioning problems with elegance and ease. If you do CSS, you should know Flexbox."
      social:
        github: "https://github.com/mshwery"
        twitter: "https://twitter.com/mshwery"
        facebook: "https://www.facebook.com/mshwery"
    },
  ]

  _.each people, (person) ->
    source   = $("#person-template").html()
    template = Handlebars.compile source

    context = person
    html    = template context
    $("[data-list=people]").append html
