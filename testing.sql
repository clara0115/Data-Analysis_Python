use mavenfuzzyfactory;

select
pageview_url,
count(distinct website_session_id) as sessions,
count(distinct order_id) as orders
from
(select
website_session_id,
website_pageview_id,
pageview_url,
order_id
from website_pageviews
left join orders using(website_session_id)
where website_pageview_id>=53550
and website_pageviews.created_at<'2012-11-10'
and pageview_url in ('/billing','/billing-2')) as t1
group by 1