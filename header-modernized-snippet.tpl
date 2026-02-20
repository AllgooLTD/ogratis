<section id="side_panel" class="hide" aria-hidden="true">
    <div class="full-dialog-overlay" data-close-full-dialog="true" role="presentation"></div>
    <div class="full-dialog-container full-dialog-side-control" id="full-dialog-container-js" role="dialog" aria-modal="true" aria-labelledby="full-dialog-title">
        <button type="button" class="full-dialog-close" data-close-full-dialog="true" aria-label="{_close}"></button>
        <div class="full-dialog-body">
            <h2 id="full-dialog-title" class="hide">{_details}</h2>
            <iframe id="full-dialog-widget" name="full-dialog-widget" width="100%" height="100%" frameborder="0" title="{_details}" loading="lazy" referrerpolicy="strict-origin-when-cross-origin"></iframe>
        </div>
    </div>
</section>

<script>
(function () {
    function closeDialog() {
        if (typeof close_full_dialog === 'function') {
            close_full_dialog();
        }
    }

    document.addEventListener('click', function (event) {
        if (event.target && event.target.closest('[data-close-full-dialog="true"]')) {
            closeDialog();
        }
    });

    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            closeDialog();
        }
    });
})();
</script>

{apihook[headerbit_start]}

<!--<section id="billboard-promo" aria-hidden="true"></section>
<script>if (true && typeof ilance_widget === 'function') {ilance_widget("block", {mode:'hpa', id:9, cid:'{cid}', width:1920, height:55, divider:false, mime:'.png', alttext:'', container:'billboard-promo'});}</script>-->

<if condition="isset($ilance->show['slimheader']) AND $ilance->show['slimheader']">

<section id="top-head-container" class="header-container-slim">
<!-- start header -->
<header class="header-slim">
	<!-- start top-bar -->
    <div class="top-bar-slim">

        <div class="m-0-10-0-10">
        <span class="<if condition="$ilance->config['template_textdirection'] == 'ltr'">left m-2-10-0-0<else />right m-2-0-0-10</if>">
        	<a href="{http_server}" title="{site_name}"><img src="{imguploadscdn}meta/logo.png" alt="{site_name}" decoding="async" fetchpriority="high" /></a>
            <ul class="slim-links">
            	<if condition="isset($_SESSION['ilancedata']['user']['isadmin']) AND $_SESSION['ilancedata']['user']['isadmin']">
                <li><a href="{https_server_admin}" title="{_admin}" target="_blank">{_admin_cp}</a></li>
                </if>
            	<if condition="isset($ilance->config['stores']) AND $ilance->config['stores']">
                <li><a href="{https_server}stores/" title="{_stores}">{_stores}</a></li>
                <if condition="isset($_SESSION['ilancedata']['user']['userid']) AND $ilance->permissions->check_access($_SESSION['ilancedata']['user']['userid'], 'canopenstore') == 'yes'">
                <if condition="$ilance->stores->has_store($_SESSION['ilancedata']['user']['userid'])">
                <li><a href="{https_server}selling/store/manage/" title="{_manage_store}">{_manage_store}</a></li>
                <else />
                <li><a href="{https_server}selling/store/create/" title="{_open_a_store}">{_open_a_store}</a></li>
                </if>
                </if>
                </if>
                <if condition="isset($ilance->config['brands']) AND $ilance->config['brands']"><li><a href="{https_server}b/" class="pt-16">{_brands}</a></li></if>
                <if condition="isset($ilance->config['enablenonprofits']) AND $ilance->config['enablenonprofits']"><li><a href="{https_server}nonprofits/" class="pt-16">{_nonprofits}</a></li></if>
                <if condition="isset($ilance->config['auctionevents']) AND $ilance->config['auctionevents']"><li><a href="{https_server}auctions/" class="pt-16">{_auctions}</a></li></if>
				<if condition="!empty($_SESSION['ilancedata']['user']['userid']) AND $ilance->permissions->check_access($_SESSION['ilancedata']['user']['userid'], 'createproductauctions') == 'yes'"><li><a href="{https_server}sell/" title="{_sell_new_item}">{_sell_new_item}</a></li></if>
                <if condition="!empty($_SESSION['ilancedata']['user']['userid'])"><li><a href="{https_server}account/" title="{_my_cp}">{_my_cp}</a></li></if>
                <if condition="!empty($_SESSION['ilancedata']['user']['userid'])"><li><a href="{https_server}buying/purchases/" title="{_orders}">{_orders}</a></li></if>
				<li><a href="{https_server}search/advanced.html" title="{_search}">{_search}</a></li>
            </ul>
        </span>
        <div class="top-bar-info <if condition="$ilance->config['template_textdirection'] == 'ltr'">right<else />left</if>">{login_include}</div>
        </div>
    </div>
    <!-- end top-bar -->
</header>
<!-- end header -->
</section>

<else />

<section id="top-head-container" class="header-container">
<!-- start header -->
<header class="header">
    <!-- start box -->
	<div class="box-fluid">
    	<!-- start header-top -->
    	<div class="header-top">

        	<div class="top-nav-left">
            	<!-- start logo -->
                <div id="logo">
                    <div class="logo onlydesktop">
                        <a href="{https_server}" title="{site_name}"><img src="{imguploadscdn}meta/logo.png" alt="logo desktop" decoding="async" fetchpriority="high" /></a>
                    </div>
                    <div class="logo onlymobile">
                        <a href="{https_server}" title="{site_name}"><img src="{imguploadscdn}meta/logo-mobile.png" alt="logo mobile" decoding="async" /></a>
                    </div>
                </div>
                <!-- end logo -->
            </div>

            <div class="top-nav-right" id="billboard-3"></div>
            <script>if (typeof ilance_widget === 'function') {ilance_widget("block", {mode:'hpa', id:3, cid:'{cid}', width:400, height:39, divider:false, mime:'.gif', container:'billboard-3'});}</script>

            <div class="top-nav-fill">
            	<!-- start search -->
                <div class="search">
                        <!-- start search-box -->
                        <div class="search-box">
                        	<form name="global" id="globalsearch" action="{https_server}search" method="post" dir="{template_textdirection}" accept-charset="UTF-8">
                            <input type="hidden" name="mode" id="searchmode" value="product" />
                            <if condition="defined('LOCATION') AND LOCATION == 'search'">{hiddenfields}</if>
                            <input type="submit" value="" class="button-<if condition="$ilance->config['template_textdirection'] == 'ltr'">left<else />right</if>" />
                            <!-- start setting-box -->
                            <div class="setting-box">
                                <a href="javascript:;" class="setting setting-<if condition="$ilance->config['template_textdirection'] == 'ltr'">left<else />right</if>"><span>{_settings}</span></a>
                                <div id="search-setting-panel" class="setting-panel <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
                                    <div class="title">
                                        <span><a href="{http_server}search/advanced.html?returnurl={pageurl_urlencoded}" title="{_advanced_search}">{_advanced_search}</a></span>
                                        <h3>{_search_options}</h3>
                                    </div>
                                    <div class="setting-form">
                                        <div class="row">
                                            <label for="cid">{_category}</label>
                                            {search_category_pulldown_v4}
                                            <ul class="checkbox-list">
                                                <li><label for="titlesonly"><input name="titlesonly" id="titlesonly" type="checkbox" value="1" class="checkbox <if condition="$ilance->config['template_textdirection'] == 'ltr'">m-2-8-0-0<else />m-2-0-0-8</if>" /> {_search_auction_titles_only}</label></li>
                                                <li><label for="imagesonly"><input name="images" id="imagesonly" type="checkbox" value="1" class="checkbox <if condition="$ilance->config['template_textdirection'] == 'ltr'">m-2-8-0-0<else />m-2-0-0-8</if>" /> {_show_only_with_images}</label></li>
                                                <li><label for="freeshipping"><input name="freeshipping" id="freeshipping" type="checkbox" value="1" class="checkbox <if condition="$ilance->config['template_textdirection'] == 'ltr'">m-2-8-0-0<else />m-2-0-0-8</if>" /> {_show_items_with_free_shipping}</label></li>
                                            </ul>
                                        </div>
                                        <div class="row">
                                            <label for="itemnumber">{_item_number}</label>
                                            <input name="itemid" type="text" id="itemnumber" placeholder="{_eg_placeholder_itemnumber}" class="input" />
                                        </div>
                                        <div class="row last">
                                            <input type="submit" value="{_search}" id="bigsearchbutton" class="button2" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end setting-box -->
                            <div class="search-menu <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-0-10 br-5-0-0-5<else />p-0-10-0-10 br-0-5-5-0</if>">
                                <a href="javascript:;" title="{_all_categories_upper}" class="menu-link"><span id="search-menu-selected">{_all_categories_upper}</span></a>
                            </div>
                            <div class="input-field"><input name="q" id="search_keywords_id" type="text" value="{q}" autocomplete="off" spellcheck="false" class="input" /></div>
                            <div id="search_autocomplete" class="autocompletev4"></div>
                            <div class="search-menu-list <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-10-0-15 bs-5-5-5-0<else />p-15-15-0-10 bs-n5-5-5-0</if>" id="search-menu">
                                <ul>
                                    {categorypulldownpopup}
                                </ul>
                            </div>
                            <if condition="isset($ilance->config['fulltextsearch']) AND $ilance->config['fulltextsearch']"><input type="hidden" name="sort" id="searchsort" value="124" /><else /><input type="hidden" name="sort" id="searchsort" value="01" /></if>
                    		</form>

                        </div>
                        <!-- end search-box -->

                </div>
                <!-- end search -->
            </div>


        </div>
        <!-- end header-top -->
        <!-- start header-bot -->
        <div class="header-bot">
        	<div class="bot-nav-left">
                <div id="global-location"></div>
            </div>
            <div class="bot-nav-right">
            	<!-- start top-link -->
                <div class="top-link">

                    {apihook[top_links_ul_start]}

                    <ul>
                    	{apihook[top_links_prestart]}

                        <if condition="isset($_SESSION['ilancedata']['user']['userid']) AND $_SESSION['ilancedata']['user']['userid'] > 0 AND $ilance->permissions->check_access($_SESSION['ilancedata']['user']['userid'], 'createproductauctions') == 'yes' OR !isset($_SESSION['ilancedata']['user']['userid'])"><li class="sell-hover"><a href="javascript:;" class="pt-16"><span>{_sell}</span></a>

                            <div class="top-dropdown <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
                                <if condition="empty($_SESSION['ilancedata']['user']['username'])"><div class="user-login <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                    <a class="login-link" href="{https_server}signin/?redirect={request_uriencoded}">{_login}</a>
                                    <p><if condition="isset($ilance->config['facebookkey']) AND !empty($ilance->config['facebookkey'])"><a href="{https_server}signin/facebook/"><img src="{imgcdn}v5/img_facebook_ico.png" width="24" alt="Facebook" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['twitterkey']) AND !empty($ilance->config['twitterkey'])"><a href="{https_server}signin/twitter/"><img src="{imgcdn}v5/img_twitter_ico.png" width="24" alt="Twitter" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['linkedinkey']) AND !empty($ilance->config['linkedinkey'])"><a href="{https_server}signin/linkedin/"><img src="{imgcdn}v5/img_linkedin_ico.png" width="24" alt="Linked In" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['googlepluskey']) AND !empty($ilance->config['googlepluskey'])"><a href="{https_server}signin/googleplus/"><img src="{imgcdn}v5/img_google_ico.png" width="24" alt="GooglePlus" /></a></if></p>
                                    <span class="new-user smaller">{_dont_have_an_account} <a href="{https_server}register/">{_register} ›</a></span>
                                </div>
                                {apihook[top_links_sell_guest_after_register]}
                                <else />
                                <div class="user-login <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                    <h3>{_sell} {_on} {site_name}</h3>
                                </div>
                                <ul>
                                    {apihook[topnav_sell_links_start]}
                                    <li><a href="{http_server}sell/">{_sell_new_item}</a></li>
                                    <if condition="isset($ilance->config['globalfilters_bulkupload']) AND $ilance->config['globalfilters_bulkupload']">
                                    <li><a href="{https_server}sell/bulk/">{_sell_bulk_items}</a></li>
                                    </if>
                                    <if condition="isset($ilance->config['auctionevents']) AND $ilance->config['auctionevents']"><li><a href="{https_server}auctions/create-event/" title="{_create_auction_event}">{_create_auction_event}</a></li></if>
                                    <li><a href="{https_server}feedback/?cmd=_leave-feedback&view=2">{_leave_feedback_for_buyers}</a></li>
                                    <li><a href="{https_server}selling/?displayorder=desc">{_im_selling}</a></li>
                                    <li><a href="{https_server}selling/?sub=sold&amp;displayorder=desc">{_items_ive_sold}</a></li>
									<if condition="isset($ilance->config['auctionevents']) AND $ilance->config['auctionevents']"><li><a href="{https_server}selling/?sub=auctions">{_my_auction_events}</a></li></if>
                                    <li><a href="{https_server}selling/profile/payments/">{_selling_payment_profiles}</a></li>
                                    <li><a href="{https_server}selling/profile/tax/">{_selling_tax_profiles}</a></li>
                                    {apihook[topnav_sell_links_end]}
                                </ul>
                                </if>
                            </div>

                        </li></if>

                        {apihook[top_links_start]}

                        <if condition="isset($_SESSION['ilancedata']['user']['userid']) AND $_SESSION['ilancedata']['user']['userid'] > 0 AND ($ilance->permissions->check_access($_SESSION['ilancedata']['user']['userid'], 'productbid') == 'yes' OR $ilance->permissions->check_access($_SESSION['ilancedata']['user']['userid'], 'buynow') == 'yes')"><li class="buy-hover"><a href="javascript:;" class="pt-16"><span>{_buy}</span></a>

                            <div class="top-dropdown <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
                                <if condition="empty($_SESSION['ilancedata']['user']['username'])"><div class="user-login <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                    <a class="login-link" href="{https_server}signin/?redirect={request_uriencoded}">{_login}</a>
                                    <p><if condition="isset($ilance->config['facebookkey']) AND !empty($ilance->config['facebookkey'])"><a href="{https_server}signin/facebook/"><img src="{imgcdn}v5/img_facebook_ico.png" width="24" alt="Facebook" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['twitterkey']) AND !empty($ilance->config['twitterkey'])"><a href="{https_server}signin/twitter/"><img src="{imgcdn}v5/img_twitter_ico.png" width="24" alt="Twitter" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['linkedinkey']) AND !empty($ilance->config['linkedinkey'])"><a href="{https_server}signin/linkedin/"><img src="{imgcdn}v5/img_linkedin_ico.png" width="24" alt="Linked In" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['googlepluskey']) AND !empty($ilance->config['googlepluskey'])"><a href="{https_server}signin/googleplus/"><img src="{imgcdn}v5/img_google_ico.png" width="24" alt="GooglePlus" /></a></if></p>
                                    <span class="new-user smaller">{_dont_have_an_account} <a href="{https_server}register/">{_register} ›</a></span>
                                </div>
                                {apihook[top_links_sell_guest_after_register]}
                                <else />
                                <div class="user-login <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                    <h3>{_buy} {_on} {site_name}</h3>
                                </div>
                                <ul>
                                    {apihook[topnav_buy_links_start]}
                                    <li><a href="{http_server}buying/">{_buying_activity}</a></li>
                                    <li><a href="{https_server}buying/management/?bidsub=awarded">{_items_ive_won}</a></li>
                                    <li><a href="{https_server}buying/purchases/">{_my_orders}</a></li>
                                    <li><a href="{https_server}feedback/?cmd=_leave-feedback&view=1">{_leave_feedback_for_sellers}</a></li>
                                    <li><a href="{https_server}purchase/confirm/shipping/">{_shipping_profiles}</a></li>
                                    <li><a href="{https_server}purchase/confirm/billing/">{_billing_profiles}</a></li>
                                    <li><a href="{https_server}search/advanced.html">{_advanced_search}</a></li>
                                    <if condition="isset($ilance->config['currencyconverter']) AND $ilance->config['currencyconverter']"><li><a href="{https_server}currency-converter/">{_currency_converter}</a></li></if>
                                    {apihook[topnav_buy_links_end]}
                                </ul>
                                </if>
                            </div>

                        </li>
                        </if>

                        {apihook[top_links_mid]}

                        <li class="favorite-hover"><a href="javascript:;" class="pt-16"><span>{_following}</span></a>

                            <div class="top-dropdown2 <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
                                <div class="user-login bb-n <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                    <h3>{_following}</h3>
                                    <p class="gray mt-10">{_your_favorites_hold_items}</p>
                                </div>
                                <div class="tab-cont">
                                        <h4><span class="smaller gray <if condition="$ilance->config['template_textdirection'] == 'ltr'">right mr-10<else />left ml-10</if>"><a href="javascript:;" onclick="location.href='{https_server}watchlist/auctions/'">{_manage}</a></span><a href="javascript:;" class="link">{_auction_events}</a></h4>
                                        <if condition="empty($_SESSION['ilancedata']['user']['username'])">
                                        <div class="txtb">
                                            <p>{_you_must_be_logged_in_to}</p>
                                            <a class="login-link" href="{https_server}signin/?redirect={request_uriencoded}">{_login}</a>
                                            <div class="clear"></div>
                                            <span class="new-user smaller">{_dont_have_an_account} <a href="{https_server}register/">{_register} ›</a></span>
                                        </div>
                                        <else />
                                        <div class="txtb nopadding">
                                            <div id="favouriteauctionevents">
                                                <span class="p-{table_cellpadding}"><img src="{imgcdn}v5/ico_working.gif" width="13" height="13" alt="{_loading}" /></span></div>
                                            </div>
                                        </if>
                                </div>
                                <div class="tab-cont">
                                        <h4><span class="smaller gray <if condition="$ilance->config['template_textdirection'] == 'ltr'">right mr-10<else />left ml-10</if>"><a href="javascript:;" onclick="location.href='{https_server}watchlist/'">{_manage}</a></span><a href="javascript:;" class="link">{_items}</a></h4>
                                        <if condition="empty($_SESSION['ilancedata']['user']['username'])">
                                        <div class="txtb">
                                            <p>{_you_must_be_logged_in_to}</p>
                                            <a class="login-link" href="{https_server}signin/?redirect={request_uriencoded}">{_login}</a>
                                            <div class="clear"></div>
                                            <span class="new-user smaller">{_dont_have_an_account} <a href="{https_server}register/">{_register} ›</a></span>
                                        </div>
                                        <else />
                                        <div class="txtb nopadding">
                                            <div id="favouriteitems">
                                                <span class="p-{table_cellpadding}"><img src="{imgcdn}v5/ico_working.gif" width="13" height="13" alt="{_loading}" /></span></div>
                                            </div>
                                        </if>
                                </div>
                                <div class="tab-cont">
                                        <h4><span class="smaller gray <if condition="$ilance->config['template_textdirection'] == 'ltr'">right mr-10<else />left ml-10</if>"><a href="javascript:;" onclick="location.href='{https_server}watchlist/sellers/'">{_manage}</a></span><a href="javascript:;" class="link">{_sellers}</a></h4>
                                        <if condition="empty($_SESSION['ilancedata']['user']['username'])">
                                        <div class="txtb">
                                            <p>{_you_must_be_logged_in_to}</p>
                                            <a class="login-link" href="{https_server}signin/?redirect={request_uriencoded}">{_login}</a>
                                            <div class="clear"></div>
                                            <span class="new-user smaller">{_dont_have_an_account} <a href="{https_server}register/">{_register} ›</a></span>
                                        </div>
                                        <else />
                                        <div class="txtb nopadding">
                                            <div class="minh-395" id="favouritesellers">
                                                <span class="p-{table_cellpadding}"><img src="{imgcdn}v5/ico_working.gif" width="13" height="13" alt="{_loading}" /></span>
                                            </div>
                                        </div>
                                        </if>
                                </div>
                                <div class="tab-cont">
                                        <h4><span class="smaller gray <if condition="$ilance->config['template_textdirection'] == 'ltr'">right mr-10<else />left ml-10</if>"><a href="javascript:;" onclick="location.href='{https_server}preferences/saved-searches/'">{_manage}</a></span><a href="javascript:;" class="link">{_searches}</a></h4>
                                        <if condition="empty($_SESSION['ilancedata']['user']['username'])">
                                        <div class="txtb">
                                            <p>{_you_must_be_logged_in_to}</p>
                                            <a class="login-link" href="{https_server}signin/?redirect={request_uriencoded}">{_login}</a>
                                            <div class="clear"></div>
                                            <span class="new-user">{_dont_have_an_account} <a href="{https_server}register/">{_register} ›</a></span>
                                        </div>
                                        <else />
                                        <div class="txtb nopadding">
                                            <div class="minh-395" id="favouritesearches">
                                                <span class="p-{table_cellpadding}"><img src="{imgcdn}v5/ico_working.gif" width="13" height="13" alt="{_loading}" /></span>
                                            </div>
                                        </div>
                                        </if>
                                </div>
                            </div>

                        </li>
						<if condition="$ilance->language->lang_count_canselect() > 1"><li class="lang-hover"><a href="javascript:;">{user[languageiso]}<br /><span class="pt-2"><img src="{imgcdn}v5/ico_language.png" width="14" height="14"></span></a>
							<div class="top-dropdown <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
								{languagelinks}
							</div>
						</li></if>
                        <if condition="$ilance->styles->styles_count_visible() > 1"><li class="lang-hover"><a href="javascript:;" title="User Experience">UX<br /><span class="pt-2"><img src="{imgcdn}v5/ico_theme.png" height="14"></span></a>
                            <div class="top-dropdown <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
                                {themelinks}
                            </div>
                        </li></if>
<li class="login-hover"><if condition="empty($_SESSION['ilancedata']['user']['username'])"><a href="javascript:;">{_hello}, {_sign_in}<br /><span class="bold fs-14">{_your_account}</span></a><else /><a href="javascript:;">{_hello}, <if condition="empty($_SESSION['ilancedata']['user']['userid'])">{_sign_in}<else />{user[username]}</if><br /><span class="bold fs-14">{_your_account}</span></a></if>

                            <div class="top-dropdown <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
                                <if condition="empty($_SESSION['ilancedata']['user']['username']) OR empty($_SESSION['ilancedata']['user']['userid'])"><div class="user-login <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                    <a class="login-link" href="{https_server}signin/?redirect={request_uriencoded}">{_login}</a>
                                    <p><if condition="isset($ilance->config['facebookkey']) AND !empty($ilance->config['facebookkey'])"><a href="{https_server}signin/facebook/"><img src="{imgcdn}v5/img_facebook_ico.png" width="24" alt="Facebook" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['twitterkey']) AND !empty($ilance->config['twitterkey'])"><a href="{https_server}signin/twitter/"><img src="{imgcdn}v5/img_twitter_ico.png" width="24" alt="Twitter" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['linkedinkey']) AND !empty($ilance->config['linkedinkey'])"><a href="{https_server}signin/linkedin/"><img src="{imgcdn}v5/img_linkedin_ico.png" width="24" alt="Linked In" /></a>&nbsp;&nbsp;&nbsp;</if><if condition="isset($ilance->config['googlepluskey']) AND !empty($ilance->config['googlepluskey'])"><a href="{https_server}signin/googleplus/"><img src="{imgcdn}v5/img_google_ico.png" width="24" alt="GooglePlus" /></a></if></p>
                                    <span class="new-user smaller">{_dont_have_an_account} <a href="{https_server}register/">{_register} ›</a></span>
                                </div>
                                {apihook[top_links_guest_after_register]}
                                <else />
                                {apihook[top_links_member_before_navigation]}
                                <div class="user-login <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                <h3>{_account}</h3>
                                </div>
                                </if>

                                <ul>
                                    {apihook[topnav_links_start]}
									<li><a href="{https_server}account/">{_my_account}</a></li>
                                    <li><a href="{https_server}messages/">{_messages}</a> <span class="gray" id="newmessagestopnav"></span></li>
                                    <li><a href="{https_server}buying/purchases/">{_my_orders}</a></li>
                                    <li><a href="{https_server}accounting/">{_payment_profiles}</a></li>
                                    <li><a href="{https_server}accounting/billing-payments/">{_billing_and_payments}</a></li>
                                    <li><a href="{https_server}membership/">{_subscription}</a></li>
                                    <li class="divider"><a href="{https_server}feedback/?cmd=_leave-feedback">{_leave_feedback}</a></li>
                                    <if condition="!empty($_SESSION['ilancedata']['user']['username']) AND !empty($_SESSION['ilancedata']['user']['userid'])"><li><a href="{https_server}signout/">{_log_out}</a></li></if>
                                    {apihook[topnav_links_end]}
                                </ul>

                            </div>
                        </li>

                        <li class="order-hover bold fs-14"><a href="{https_server}buying/purchases/">{_orders}</a>

                        </li>

                        <li class="cart-hover"><a href="{https_server}cart/?returnurl={pageurl_urlencoded}" class="shoppingcart"><span id="cart-count" class="cart-count a_active">{cartcount}</span></a>

                            <div id="shopping-cart-list" class="hide top-dropdown gap2 <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">

                                <div class="user-login <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-15-0-12-15<else />p-15-15-12-0</if>">
                                    <h3>{_shopping_cart}</h3>

									<div class="pt-20 mlr-15<if condition="isset($cartcount) AND $cartcount <= 0"> hide</if>" id="cart-checkout-button"><button class="btn minh-35 w-100pct" onclick="location.href='{https_server}purchase/confirm/'">{_checkout}</button></div>
                                    <div class="clear"></div>

                                </div>

                                <div id="shopping-cart"><div class="p{table_cellpadding}"><img src="{imgcdn}v5/ico_working.gif" width="13" height="13" alt="{_loading}" /></div></div>


                            </div>
                        </li>


                        {apihook[top_links_end]}

                    </ul>

                    {apihook[top_links_ul_end]}

                </div>
                <!-- end top-link -->

            </div>

            <div class="bot-nav-fill">

            	<div class="top-nav-left">
                    <div class="top-link">
                        <ul>
                            <li class="login-hover">
  <a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" data-delay="500" href="{https_server}catalog/?ref=nav"><br /><span class="bold fs-20">{_category}</span></a>

  {shopbycategory}
</li>
                        </ul>
                    </div>
                </div>

            	<div id="background-links">
                	<div class="top-nav-left">

                        <div class="top-link">
                            <ul>
                                <if condition="isset($_SESSION['ilancedata']['user']['isadmin']) AND $_SESSION['ilancedata']['user']['isadmin']">
                                <li class="admin-hover"><a href="{https_server_admin}" class="pt-16">{_admin}</a></li>
                                </if>
                                <!--<li><a href="{https_server}auctions/" class="pt-16">{_auctions}</a></li>-->
                                <if condition="isset($ilance->config['stores']) AND $ilance->config['stores']">
                                <li><a href="{https_server}stores/" class="pt-16">{_stores}</a></li>
                                <if condition="isset($_SESSION['ilancedata']['user']['userid']) AND $ilance->permissions->check_access($_SESSION['ilancedata']['user']['userid'], 'canopenstore') == 'yes'">
                                <if condition="$ilance->stores->has_store($_SESSION['ilancedata']['user']['userid'])">
                                <li><a href="{https_server}selling/store/manage/" class="pt-16">{_manage_store}</a></li>
                                <else />
                                <li><a href="{https_server}selling/store/create/" class="pt-16" title="{_open_a_store}">{_open_a_store}</a></li>
                                </if>
                                </if>
                                </if>
                                <if condition="isset($ilance->config['brands']) AND $ilance->config['brands']"><li><a href="{https_server}b/" class="pt-16">{_brands}</a></li></if>
                                <if condition="isset($ilance->config['enablenonprofits']) AND $ilance->config['enablenonprofits']"><li><a href="{https_server}nonprofits/" class="pt-16">{_nonprofits}</a></li></if>
                                <if condition="isset($ilance->config['auctionevents']) AND $ilance->config['auctionevents']"><li><a href="{https_server}auctions/" class="pt-16">{_auctions}</a></li></if>
                                {headerpagelinks}
                            </ul>
                        </div>
                    </div>

                </div>

            </div>


    		<div class="arrow-bot">
                <a href="javascript:;" class="arrow-link" title="{_recently_viewed_items}">arrow-bot</a>
                <!-- start product-list -->
                <div class="product-list <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">
                    <a href="javascript:;" class="arrow-bot2 arrow-link <if condition="$ilance->config['template_textdirection'] == 'ltr'">bs-5-5-5-0<else />bs-n5-5-5-0</if>">arrow-bot</a>
                    <!-- row -->
                    <div class="row mx-0">
                        <strong><a href="javascript:;" title="{_close}" class="close <if condition="$ilance->config['template_textdirection'] == 'ltr'">m-15-17-0-0<else />m-15-0-0-17</if>">{_close}</a> {_recently_viewed_items}</strong>
                    </div>
                    <!-- row -->
                    <div id="recentviewedtoploader">
                    <div class="row2">
                        <ul>
                            <li class="active <if condition="$ilance->config['template_textdirection'] == 'ltr'">p-0-17-0-0<else />p-0-0-0-17</if>" title="{_loading}"><img src="{imgcdn}v5/ico_working.gif" width="13" height="13" alt="{_loading}" /></li>
                        </ul>
                    </div>
                    </div>
                </div>
                <!-- end product-list -->
        	</div>
        </div>
        <!-- end header-bot -->
    </div>
    <!-- end box -->

</header>
<!-- end header -->
</section>
</if>

<!-- end header container -->
<section id="app-widget" class="app-widget"></section>
<section id="top-subnav" class="top-dynamic subnav<if condition="!isset($ilance->show['topsubnav']) OR (isset($ilance->show['topsubnav']) AND !$ilance->show['topsubnav'])"> hide</if>"><div class="w-100pct">{topsubnav}</div><!-- a links only --></section>
<section id="top-dynamic" class="top-dynamic<if condition="!isset($ilance->show['topdynamic']) OR (isset($ilance->show['topdynamic']) AND !$ilance->show['topdynamic'])"> hide</if>"><div class="w-100pct">{topdynamic}</div></section>
<section id="listing-notices"></section>
<section id="top-ax"></section>
<script>if (typeof ilance_widget === 'function') {ilance_widget("block", {mode:'hpax', cid:'{cid}', limit:1, minlimit:1, viewmode:'billboard', width:980, height:55, zone:'hbnc', container:'top-ax'});}</script>
