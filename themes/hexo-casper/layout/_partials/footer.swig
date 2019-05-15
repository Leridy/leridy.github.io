{# footer #}

{% include "search.swig" %}

<footer class="site-footer outer">
	<div class="site-footer-content inner">
		<section class="copyright">
			<a href="{{ config.root }}" title="{{ config.title }}">{{ config.title }}</a>
			&copy; {{ date(Date.now(), 'YYYY') }}
		</section>
		<nav class="site-footer-nav">
           <p>友情链接</p>
           {% for key,link in theme.footer %}
           <a href="{{ link }}" title="{{ key }}" target="_blank" rel="noopener">{{ key }}</a>
           {% endfor %}
        </nav>
    </div>
</footer>