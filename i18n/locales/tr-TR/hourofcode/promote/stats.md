* * *

title: <%= hoc_s(:title_stats) %> layout: wide nav: promote_nav

* * *

<%= view :signup_button %>

# Blurbs and Useful Stats

## Use this short blurb in newsletters

### Bring computer science to your school. Start with an Hour of Code

Bilgisayarlar her yerde, ancak artık 10 yıl öncesine kıyasla daha az okul bilgisayar bilimini öğretiyor. İyi haber şu ki, biz bu durumu değiştirmek için yola çıktık. If you heard about the [Hour of Code](%= resolve_url('/') %) last year, you might know it made history. In the first Hour of Code, 15 million students tried computer science. Last year, that number increased to 60 million students! The [Hour of Code](%= resolve_url('/') %) is a one-hour introduction to computer science, designed to demystify code and show that anybody can learn the basics. [Sign up](%= resolve_url('/') %) to host an Hour of Code this <%= campaign_date('full') %> during Computer Science Education Week. To add your school to the map, go to https://hourofcode.com/<%= @country %>

## Infographics

<%= view :stats_carousel %>

<%= view :signup_button %>