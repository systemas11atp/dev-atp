{**
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 
 <div class="product-variants">
  <div class="row">
    <script type="text/javascript">
      atributos =  '<div class="definition-list variantes-productos">'
      atributos += "<dl ><dt><b>Código</b></dt><dd style='text-align: right;'>{$product.reference_to_display}</dd></dl>"
    </script>
    {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}
    <div class="clearfix product-variants-item {if $group.group_type == 'select'}col-lg-3 col-md-12{/if}">
      <span class="control-label">{$group.name}</span>
      {if $group.group_type == 'select'}
      <select
      class="form-control form-control-select"
      id="group_{$id_attribute_group}"
      data-product-attribute="{$id_attribute_group}"
      name="group[{$id_attribute_group}]">
      {foreach from=$group.attributes key=id_attribute item=group_attribute}
      {if $group_attribute.selected}
      <script> 
        atributos += coma+ '<dl ><dt><b>{$group.name}</b></dt><dd style="text-align: right;">{$group_attribute.name}</dd></dl>'
        coma = ""
      </script>
      {/if}
      <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
      {/foreach}
    </select>
    {elseif $group.group_type == 'color'}
    <div class="row">
      <div class="col-lg-8 col-sm-12">
        <ul id="group_{$id_attribute_group}" class="color_list">
          {foreach from=$group.attributes key=id_attribute item=group_attribute}
          <li class="float-xs-left input-container">
            <label aria-label="{$group_attribute.name}" >
              {if $group_attribute.selected}
              <script> 
                atributos += coma+ '<dl ><dt><b>Color</b></dt><dd style="text-align: right;">{$group_attribute.name}</dd></dl>'
                coma = ""
              </script>
              {/if}
              <input onmouseover="cambiaColor(this)" class="input-color" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if} {if $group_attribute.selected}id="elColorSeleccionado"{/if}>
              <span
              {if $group_attribute.texture}
              class="color texture" style="border-radius: 20px; background-image: url({$group_attribute.texture})"
              {elseif $group_attribute.html_color_code}
              class="color" style="border-radius: 20px; background-color: {$group_attribute.html_color_code}" 
              {/if}
              ><span class="sr-only">{$group_attribute.name}</span></span>
            </label>
          </li>
          {/foreach}
        </ul>
      </div>
    </div>
    {elseif $group.group_type == 'radio'}
    <ul id="group_{$id_attribute_group}">
      {foreach from=$group.attributes key=id_attribute item=group_attribute}
      <li class="input-container float-xs-left">
        <label>
          <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
          <span class="radio-label">{$group_attribute.name}</span>
        </label>
      </li>
      {/foreach}
    </ul>
    {/if}
  </div>
  {/if}
  {/foreach}
  <script>

   atributos +=  '</div>'
   document.getElementById('product-atributos').innerHTML= atributos
   cambiaColor(document.getElementById('elColorSeleccionado'))
 </script>
</div>
</div>
