require 'watir'

browser_opts = {detach: true}
browser = Watir::Browser.new:chrome, options: browser_opts
browser.goto 'https://www.google.com/?gws_rd=ssl'

research = ARGV.join(" ")

accept_button = browser.button(id: 'L2AGLb')

accept_button.click

search_bar = browser.text_field(class: 'gsfi')

search_bar.set(research)

search_bar.send_keys(:enter)