<form action="{{ store.cart_url }}" method="post" class="js-ajax-cart-panel cart-body">
	<div class="cart-body">
      	<div class="js-ajax-cart-list cart-row">
	        {# Cart panel items #}
	        {% if cart.items %}
	          {% for item in cart.items %}
	            {% include "snipplets/cart-item-ajax.tpl" %}
	          {% endfor %}
	        {% endif %}
        </div>
        <div class="js-empty-ajax-cart cart-row" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
    	 	{# Cart panel empty #}
            <div class="alert alert-info">{{ "El carrito de compras está vacío." | translate }}</div>
        </div>
        <div id="error-ajax-stock" style="display: none;">
        	<div class="alert alert-warning">
             	{{ "¡Uy! No tenemos más stock de este producto para agregar este producto al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link">{{ "ver otros acá" | translate }}</a>
	        </div>
        </div>
        <div class="cart-row">
	        {% include "snipplets/cart-totals.tpl" %}
	    </div>
	</div>
</form>