import Markdown

main =
  Markdown.toHtml markdown

markdown = """

# I Love Markdown

[Mysite](billscribe.com) let's you subscribe to bills in the Oklahoma 
legislature, and markdown let me write that link easily.

  * Lists are a thing.
  * They work like this.
  * Listy list list list
  * ...

The elm-markdown package parses all of this content, allowing
sweet sweet blocks of `Element` or `Html`.

"""
