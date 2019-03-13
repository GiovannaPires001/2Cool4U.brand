{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}

<section class="category-header mt-4 section-margin">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				{% embed "snipplets/page-header.tpl" with { breadcrumbs: false } %}
					{% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
				{% endembed %}
			</div>
		</div>
		<div class="row">
			{% if products %}
				{% set columns = settings.grid_columns %}
				<div class="col-6{% if columns == 2 %} col-sm-9{% else %} col-sm-8{% endif %}">
				{% if has_filters %}
					<a href="#" class="js-modal-open filter-link" data-toggle="#nav-filters">
						{{ 'Filtrar' | t }} {% include "snipplets/svg/filter.tpl" %} 
					</a>		   
					{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters modal-docked-small', modal_position: 'left', modal_transition: 'slide', modal_width: 'full'  } %}
						{% block modal_body %}
							{% snipplet "grid/filters.tpl" %}
						{% endblock %}
					{% endembed %}
				{% else %}
					<h6 class="filter-title">{{ 'Filtro aplicado:' | translate }}</h6>
				{% endif %}
				</div>
				<div class="col-6{% if columns == 2 %} col-sm-3{% else %} col-sm-4{% endif %} text-right">
					{% include 'snipplets/grid/sort-by.tpl' %}
				</div>
				<div class="js-append-filters col-12" style="display: none;">
				</div>
			{% endif %}
		</div>
	</div>
</section>

{% if not show_help %}
<section class="category-body">
	<div class="container">
		{% if products %}
	        <div class="js-product-table row">
	        	{% include 'snipplets/product_grid.tpl' %}
	        </div>
	        {% if pages.current == 1 and not pages.is_last %}
             	<div class="text-center mt-5 mb-5">
	                <a class="js-load-more btn btn-primary">
	                	<i class="js-load-more-spinner far fa-sync-alt fa-spin" style="display:none;"></i>{{ 'Mostrar más productos' | t }}
	                </a>
	            </div>
	             <div id="js-infinite-scroll-spinner" class="mt-5 mb-5 text-center w-100" style="display:none">
                    <i class="far fa-sync-alt fa-spin fa-3x"></i>
                </div>
	        {% endif %}
	    {% else %}
	        <p class="text-center">
	            {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
	        </p>
	    {% endif %}
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
{% endif %}