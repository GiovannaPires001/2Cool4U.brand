<div class="js-product-variants form-row">
	{% for variation in product.variations %}
		<div class="{% if loop.length == 3 %} col-12 col-sm-4 {% elseif loop.length == 2 %} col-6 {% else %} col col-sm-6{% endif %}">
			{% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_custom_class: 'js-variation-option js-refresh-installment-data'} %}
				{% block select_options %}
					{% for option in variation.options %}
						<option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
					{% endfor %}
				{% endblock select_options%}
			{% endembed %}
		</div>
	{% endfor %}
</div>