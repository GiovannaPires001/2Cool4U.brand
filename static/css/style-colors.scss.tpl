{#/*============================================================================
style.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
      --static/css/style-async.css.tpl --> For non critical styles witch will be loaded asynchronously
      --static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{# /*============================================================================
  Table of Contents

  #Colors and fonts
    // Colors
    // Font families
    // SVG Icons
    // Texts
  #Components
    // Margin and padding
    // Mixins
    // Animations
    // Functions
    // Wrappers
    // Placeholders
    // Dividers
    // Breadcrumbs
    // Headings
    // Buttons
    // Links
    // Modals
    // Forms
    // Tabs
    // Cards
    // Panels
    // Pills
    // Preloaders
    // Banners
    // Sliders
    // Tables
    // Cards
  #Home page
    // Instafeed
    // Video
  #Product grid
    // Grid item
    // Labels
    // Filters
  #Product detail
    // Image
    // Form and info
  #Contact page
    // Data contact
  #Account page
    // Order items
  #Header and nav
    // Ad Bar
    // Header
    // Search
  #Footer

==============================================================================*/ #}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}
	
{# /* // Colors */ #}

$primary-color: {{ settings.primary_color }};
$main-foreground: {{ settings.text_color }};
$main-background: {{ settings.background_color }};

{# /* // Font families */ #}

$heading-font: {{ settings.font_headings | raw }};
$body-font: {{ settings.font_rest | raw }};

{# /* // SVG Icons */ #}

.svg-icon-primary{
  fill: $primary-color;
}
.svg-icon-text{
  fill: $main-foreground;
}
.svg-icon-invert{
  fill: $main-background;
}

{# /* // Texts */ #}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $main-background;
}

{#/*============================================================================
  #Margin and Padding
==============================================================================*/#}



{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Margin and padding */ #}

%section-margin {
  margin-bottom: 70px;
}
%element-margin {
  margin-bottom: 20px;
}
%element-margin-half {
  margin-bottom: 10px;
}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  outline: 0;
  &:hover,
  &:focus{
    text-decoration: none;
    outline: 0;
  }
}

@mixin no-wrap(){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: normal;
}

@mixin drop-shadow(){
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

{# /* // Animations */ #}

%simplefade {
  transition: all 0.5s ease;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 15%); // Darker background, return light color
  }
}

@function set-foreground-color-invert($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return darken($foreground-color, 100%); // black foreground over white background
  } @else {
    @return lighten($foreground-color, 15%); // no dark foreground on dark background
  }
}

@function set-foreground-color-footer($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 30%); // Darker background, return light color
  }
}

{# /* // Wrappers */ #}

%body-font {
  font-size: 12px;
}

body{
  color: $main-foreground;
  font-family: $body-font;
  background-color:$main-background;
  @extend %body-font;
}

.box{
  float: left;
  width: 100%;
  margin-bottom: 20px;
  padding:8px;
  border:1px solid rgba($main-foreground, .2);
}

{# /* // Placeholders */ #}

.placeholder-container{
  background-color:rgba($main-foreground, 0.1);
}
.placeholder-color{
  background-color:rgba($main-foreground, 0.07);
}
.placeholder-icon svg{
  fill:rgba($main-foreground, 0.2);
}
.placeholder-page{
  background: $main-foreground;
  &:hover,
  &.active{
      background: $primary-color;
      opacity: 0.8;
  }
}
.placeholder-shine{
  background-color:rgba($main-foreground, 0.2);
}

{# /* // Dividers */ #}

.divider{
  margin-top: 20px;
  margin-bottom: 20px;
  clear: both;
  border-bottom: 1px solid rgba($main-foreground, .1);
}

{# /* // Breadcrumbs */ #}

.breadcrumbs {
  @extend %element-margin-half;
}

{# /* Headings */ #}

h1,.h1,
h2,.h2,
h3,.h3,
h4,.h4,
h5,.h5,
h6,.h6{
  margin-top: 0;
  font-family: $heading-font;
}

.page-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
  }
}

{# /* // Buttons */ #}

.btn{
  text-decoration: none;
  text-align: center;
  border: 0;
  cursor: pointer;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  text-transform: uppercase;
  background: none;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
  &[disabled],
  &[disabled]:hover{
    opacity: 0.5;
    cursor: not-allowed;
    outline: 0;
  }
  &-default{
    padding: 10px 15px; 
    background-color: rgba($main-foreground, .2);
    color: $main-foreground;
    fill: $main-foreground;
    font-weight: bold;
  }
  &-primary{
    padding: 15px;
  	background-color: $primary-color;
  	color: $main-background;
    fill: $main-background;
    letter-spacing: 4px;
    @extend %body-font;
    &:hover{
      color: $main-background;
      fill: $main-background;
    }
  }
  &-secondary{
    padding: 10px 15px; 
    background-color: $main-background;
    color: $main-foreground;
    fill: $main-foreground;
    border: 1px solid $main-foreground;
  }
  &-block{
    float: left;
    width: 100%;
  }
  &-small{
    display: inline-block;
    padding: 10px;
    font-size: 10px;
    letter-spacing: 2px;
  }
  &-line{
    padding: 10px 0;
    color: $main-background;
    fill: $main-background;
    letter-spacing: 4px;
    @extend %body-font;
    border-bottom: 2px solid;
  }
  &-circle{
    height: 32px;
    border-radius: 50%;
  }
  &-facebook{
    background-color: #1977f2;
    .svg-fb-icon {
      position: relative;
      bottom: 1px;
      height: 26px;
      margin-right: 10px;
      vertical-align: middle;
      fill: #fff;
    }
  }
}

button{
  @extend %body-font;
  cursor: pointer;
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
}

{# /* // Texts */ #}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $main-background;
}

{# /* // Links */ #}

a {
  color: $main-foreground;
  fill: $main-foreground;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    color: rgba($main-foreground, .5);
    fill: rgba($main-foreground, .5);
  }
}

.link-contrast {
  color: $main-background;
  fill: $main-background;
  &:hover,
  &:focus{
    color: rgba($main-background, .8);
    fill: rgba($main-background, .8);
  }
}

.btn-link{
  color: $primary-color;
  fill: $primary-color;
  text-transform: uppercase;
  border-bottom: 1px solid;
  font-weight: bold;
  cursor: pointer;
  &:hover,
  &:focus{
    color: rgba($primary-color, .5);
    fill: rgba($primary-color, .5);
  }
}

{# /* // Modals */ #}

.modal{
  color: $main-foreground;
  background-color:$main-background;
}

{# /* // Forms */ #}

input,
textarea {
  font-family: $body-font;
}

.form-control {
  display: block;
  padding: 10px 8px;
  width: 100%;
  border: 0;
  border-bottom: 1px solid rgba($main-foreground, .5);
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  background-color: $main-background;
  &:focus{
    outline: 0;
  }
  &-inline{
    display: inline;
  }
}

.form-control::-webkit-input-placeholder { 
  color: $main-foreground;
}
.form-control:-moz-placeholder {
  color: $main-foreground;
}
.form-control::-moz-placeholder {
  color: $main-foreground;
}
.form-control:-ms-input-placeholder {
  color: $main-foreground;
}

.form-select{
  display: block;
  padding: 10px 0;
  width: 100%;
  border: 0;
  border-bottom: 1px solid rgba($main-foreground, .5);
  border-radius: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  background-color: $main-background;
  @extend %body-font;
  &-icon{
    background: $main-background;
  }
}

.radio-button {
  input[type="radio"]{
    & +  .radio-button-content .unchecked{
      border:2px solid $main-foreground;
    }
    & +  .radio-button-content .checked{
      background-color: $main-foreground;
    }
  }
}

{# /* // Alerts and notifications */ #}

.alert{
  &-danger,
  &-error{
    color: set-foreground-color-invert($main-background, #cc4845);
    border-color: rgba(set-foreground-color($main-background, #cc4845),.1);
    background-color: rgba(#cc4845, .1); 
  }
  &-warning{
    color: set-foreground-color-invert($main-background, #c09853);
    border-color: rgba(set-foreground-color($main-background, #c09853),.1);
    background-color: rgba(#c09853, .1); 
  }
  &-info{
    color: $main-foreground;
    border-color: rgba($main-foreground, .6);
    background-color: rgba($main-foreground, .02); 
  }
  &-success{
    color: set-foreground-color-invert($main-background, #3caf65);
    border-color: rgba(set-foreground-color($main-background, #3caf65),.1);
    background-color: rgba(#3caf65, .1); 
  }
  &-primary {
    border-color: rgba($primary-color, .1);
    color: $primary-color;
    background-color: rgba($primary-color, .05); 
  }
}

.notification-primary{
  color: $primary-color;
  fill: $primary-color;
  border-color: rgba($primary-color, .2);
  background-color: rgba($primary-color, .1);
}

.notification-floating .notification-primary{
  background-color: $main-background;
  border-color: rgba($primary-color, .2);
}

.notification-secondary {
  padding: 5px 0;
  background: darken($main-background, 3%);
  color: rgba($main-foreground, .8);
  border-bottom: 1px solid rgba($main-foreground, .1);
}

{# /* // Informative banners */ #}

.service-icon {
  fill: $main-foreground;
}

{# /* // Tables */ #}

.table{
  background-color: $main-background;
  color: $main-foreground;
  tbody{
    tr:nth-child(odd){
      background-color: rgba($main-foreground, .05);
    }
  }
  th{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}

.tab-group{
  border-bottom: 1px solid rgba($main-foreground, .1);
  .tab{
    &-link{
      color: $main-foreground;
    }
    &.active{
      .tab-link{
        border-bottom: 2px solid rgba($primary-color, .5);
        color: $primary-color;
      }
    }
  }
}

{# /* Cards */ #}

.card {
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .08);
}

.card-header {
  background-color: rgba($main-foreground, .1);
}

{# /* // Sliders */ #}

.swiper-pagination-bullet-active {
  background-color: $main-foreground;
}


/*============================================================================
  #Home Page
==============================================================================*/

{# /* // Home slider */ #}

.section-slider {
  @extend %section-margin;
}

{# /* // Video */ #}

.section-video-home {
  @extend %element-margin;
}

{# /* // Instafeed */ #}

.section-instafeed-home {
  @extend %element-margin;
}

.instafeed-title {
  display: block;
  @extend %element-margin;
  color: $main-foreground;
}

.instafeed-info {
  color: $main-background;
  fill: $main-background;
  background: rgba($main-foreground, .6);
}

{# /* // Featured products */ #}

.section-featured-home {
  @extend %element-margin;
}


/*============================================================================
  #Product grid
==============================================================================*/

{# /* // Grid item */ #}

.item-link {
  color: $main-foreground;
}

{# /* // Labels */ #}

.label {
  background: darken($main-background, 1%);
  &.label-primary{
    background: $main-foreground;
    color: $main-background;
  }
}

{# /* // Filters */ #}

.filter-remove {
  background: none;
  border-color: rgba(0,0,0,0.2);
  &:after{
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z"/></svg>');
  }
}


/*============================================================================
  #Product detail
==============================================================================*/

{# /* // Image */ #}

.nube-slider-product {
  background: rgba($main-foreground, 0.04);
  @extend %element-margin;
}

{# /* // Form and info */ #}
    
.social-share {
  @extend %element-margin;
  .social-share-button {
    color: $main-foreground;
  }
}

.product-description {
  @extend %section-margin;
}

/*============================================================================
  #Contact page
==============================================================================*/

{# /* // Data contact */ #}

.contact-item {
  @extend %element-margin;
}

.contact-link {
  color: $main-foreground;
}

/*============================================================================
  #Account page
==============================================================================*/

{# /* // Order item */ #}

.order-item {
  padding: 15px 0;
  border-bottom: 1px solid rgba($main-foreground, .08);
  &:first-child {
    border-top: 1px solid rgba($main-foreground, .08);
  }
}

/*============================================================================
  #Header and nav
==============================================================================*/

{# /* // Ad Bar */ #}

.section-advertising {
  background-color: $main-foreground;
  color: $main-background;
}

{# /* // Header */ #}

.head-light{
  background-color: $main-background;
  @extend %simplefade;
  .cart-widget-amount,
  .svg-icon-text {
    color: $main-foreground;
    fill: $main-foreground;
  }
}

.head-dark{
  background-color: $main-foreground;
  @extend %simplefade;
  .cart-widget-amount,
  .svg-icon-text {
    color: $main-background;
    fill: $main-background;
  }
}

.head-transparent{
  background-color: transparent;
}

{# /* // Search */ #}

.search-suggest-item {
  border-bottom: 1px solid rgba($main-foreground, .1);
}

/*============================================================================
  #Footer
==============================================================================*/

.section-footer {
  @extend %section-margin;
}
.element-footer {
  @extend %element-margin;
}

.powered-by-logo svg {
  fill: $main-foreground;
}

{# /* // Newsletter */ #}

.newsletter-btn {
  color: $main-foreground;
}
