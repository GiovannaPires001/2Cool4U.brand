<div class="js-cart-item cart-item form-row" data-item-id="{{ item.id }}">

  {# Cart item image #}
  <div class="col-2 {% if cart_page %}col-md-1{% endif %}">
    <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-fluid" alt="{{ item.short_name }}"/>
  </div>
  <div class="col-10 {% if cart_page %}col-md-11{% endif %}">

    {# Cart item name #}
    <div class="cart-item-name">
      <a href="{{ item.url }}">
        {{ item.short_name }}
      </a>
      <small>{{ item.short_variant_name }}</small>
    </div>

    {# Cart item quantity controls #}
    <span class="pull-left">
      <button type="button" class="js-cart-quantity-btn cart-item-btn btn" onclick="LS.minusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})">
        {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
      </button>
      <span>
        <input type="number" name="quantity[{{ item.id }}]" data-item-id="{{ item.id }}" value="{{ item.quantity }}" class="js-cart-quantity-input cart-item-input form-control"/>
      </span>
      <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
        {% include "snipplets/svg/sync-alt.tpl" with {svg_custom_class: "icon-inline icon-spin svg-icon-text"} %}
      </span>
      <button type="button" class="js-cart-quantity-btn cart-item-btn btn" onclick="LS.plusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})">
        {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
      </button>
    </span>

    {# Cart item subtotal mobile #}
    <h6 class="js-cart-item-subtotal cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</h6>
  </div>

  {# Cart item delete #}
  <div class="col-1 cart-item-delete text-right">
    <button type="button" class="btn" onclick="LS.removeItem({{ item.id }}{% if not cart_page %}, true{% endif %})">
      {% include "snipplets/svg/trash-alt.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
    </button>
  </div>
</div>
