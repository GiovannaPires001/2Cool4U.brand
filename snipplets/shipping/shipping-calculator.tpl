{% if shipping_calculator_show %}
	<div class="{% if product_detail %}product-shipping-calculator{% endif %} mb-2">
	    <div class="js-shipping-calculator-form">

	    	{# Shipping calcualtor input #}
            
            {% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_value: cart.shipping_zipcode, input_name: 'zipcode', input_custom_class: 'js-shipping-input', input_placeholder: "Código postal" | translate, input_label: false, input_append_content: true, input_group_custom_class: 'form-row align-items-center', form_control_container_custom_class: 'col-5'} %}
	            {% block input_prepend_content %}
	            	<span class="col-1">
		            	{% include "snipplets/svg/truck.tpl" %}
	        	 	</span>
	    		{% endblock input_prepend_content %}
                {% block input_form_alert %}
                    <div class="js-ship-calculator-error invalid-zipcode alert alert-danger" style="display: none;">{{ "No encontramos este código postal. ¿Está bien escrito?" | translate }}</div>
				    <div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger" style="display: none;">{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
				    <div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger" style="display: none;">{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
                {% endblock input_form_alert %}
                {% block input_append_content %}
                <span class="col-6">
	                <button class="js-calculate-shipping btn btn-default btn-block">	
				    	<span class="js-calculate-shipping-wording">{{ "Calcular envío" | translate }}</span>
			    		<span class="js-calculating-shipping-wording" style="display: none;">{{ "Calculando" | translate }}</span>
				    	<span class="loading" style="display: none;"><i class="far fa-sync-alt fa-spin"></i></span>
				    </button>
	    		    {% if shipping_calculator_variant %}
				    	<input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
				    {% endif %}
			    </span>
	    		{% endblock input_append_content %}
            {% endembed %}
		</div>
		<div class="js-shipping-calculator-response mb-3 float-left w-100 {% if product_detail %}list{% endif %}" style="display: none;"></div>
	</div>
{% endif %}