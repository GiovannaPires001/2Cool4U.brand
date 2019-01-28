<div class="service-item-container col-sm swiper-slide p-0 px-sm-3">
    <div class="service-item row justify-content-md-center text-sm-left">
        
        <div class="col-sm-auto">
            {% if banner_services_icon == 'shipping' %}
                {% include "snipplets/svg/truck.tpl" with {'service': true} %}
            {% elseif banner_services_icon == 'card' %}
                {% include "snipplets/svg/credit-card-blank.tpl" with {'service': true} %}
            {% elseif banner_services_icon == 'security' %}
                {% include "snipplets/svg/lock.tpl" with {'service': true} %}
            {% elseif banner_services_icon == 'returns' %}
                {% include "snipplets/svg/sync-alt.tpl" with {'service': true} %}
            {% elseif banner_services_icon == 'whatsapp' %}
                {% include "snipplets/svg/whatsapp.tpl" with {'service': true} %}
            {% elseif banner_services_icon == 'promotions' %}
                {% include "snipplets/svg/tag.tpl" with {'service': true} %}
            {% elseif banner_services_icon == 'cash' %}
                {% include "snipplets/svg/dollar-sign.tpl" with {'service': true} %}
            {% endif %}
        </div>
        <div class="col">
            {% if banner_services_url %}
                <a href="{{ banner_services_url }}">
            {% endif %}
            <h3 class="service-title">{{ banner_services_title }}</h3>
            <p>{{ banner_services_description }}</p>
            {% if banner_services_url %}
                </a>
            {% endif %}
        </div>
    </div>
</div>
