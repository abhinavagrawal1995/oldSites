
jQuery(document).ready(function() {jQuery(".scrollable").scrollable({size:1, clickable:false, circular: true}).navigator().autoscroll({steps: 1, interval: 10000});});
(function(f){function p(a,b,c){var h=c.relative?a.position().top:a.offset().top,e=c.relative?a.position().left:a.offset().left,i=c.position[0];h-=b.outerHeight()-c.offset[0];e+=a.outerWidth()+c.offset[1];var j=b.outerHeight()+a.outerHeight();if(i=="center")h+=j/2;if(i=="bottom")h+=j;i=c.position[1];a=b.outerWidth()+a.outerWidth();if(i=="center")e-=a/2;if(i=="left")e-=a;return{top:h,left:e}}function t(a,b){var c=this,h=a.add(c),e,i=0,j=0,m=a.attr("title"),q=n[b.effect],k,r=a.is(":input"),u=r&&a.is(":checkbox, :radio, select, :button"),
s=a.attr("type"),l=b.events[s]||b.events[r?u?"widget":"input":"def"];if(!q)throw'Nonexistent effect "'+b.effect+'"';l=l.split(/,\s*/);if(l.length!=2)throw"Tooltip: bad events configuration for "+s;a.bind(l[0],function(d){if(b.predelay){clearTimeout(i);j=setTimeout(function(){c.show(d)},b.predelay)}else c.show(d)}).bind(l[1],function(d){if(b.delay){clearTimeout(j);i=setTimeout(function(){c.hide(d)},b.delay)}else c.hide(d)});if(m&&b.cancelDefault){a.removeAttr("title");a.data("title",m)}f.extend(c,
{show:function(d){if(!e){if(m)e=f(b.layout).addClass(b.tipClass).appendTo(document.body).hide().append(m);else if(b.tip)e=f(b.tip).eq(0);else{e=a.next();e.length||(e=a.parent().next())}if(!e.length)throw"Cannot find tooltip for "+a;}if(c.isShown())return c;e.stop(true,true);var g=p(a,e,b);d=d||f.Event();d.type="onBeforeShow";h.trigger(d,[g]);if(d.isDefaultPrevented())return c;g=p(a,e,b);e.css({position:"absolute",top:g.top,left:g.left});k=true;q[0].call(c,function(){d.type="onShow";k="full";h.trigger(d)});
g=b.events.tooltip.split(/,\s*/);e.bind(g[0],function(){clearTimeout(i);clearTimeout(j)});g[1]&&!a.is("input:not(:checkbox, :radio), textarea")&&e.bind(g[1],function(o){o.relatedTarget!=a[0]&&a.trigger(l[1].split(" ")[0])});return c},hide:function(d){if(!e||!c.isShown())return c;d=d||f.Event();d.type="onBeforeHide";h.trigger(d);if(!d.isDefaultPrevented()){k=false;n[b.effect][1].call(c,function(){d.type="onHide";k=false;h.trigger(d)});return c}},isShown:function(d){return d?k=="full":k},getConf:function(){return b},
getTip:function(){return e},getTrigger:function(){return a}});f.each("onHide,onBeforeShow,onShow,onBeforeHide".split(","),function(d,g){f.isFunction(b[g])&&f(c).bind(g,b[g]);c[g]=function(o){f(c).bind(g,o);return c}})}f.tools=f.tools||{version:"1.2.2"};f.tools.tooltip={conf:{effect:"toggle",fadeOutSpeed:"fast",predelay:0,delay:30,opacity:1,tip:0,position:["top","center"],offset:[0,0],relative:false,cancelDefault:true,events:{def:"mouseenter,mouseleave",input:"focus,blur",widget:"focus mouseenter,blur mouseleave",
tooltip:"mouseenter,mouseleave"},layout:"<div/>",tipClass:"tooltip"},addEffect:function(a,b,c){n[a]=[b,c]}};var n={toggle:[function(a){var b=this.getConf(),c=this.getTip();b=b.opacity;b<1&&c.css({opacity:b});c.show();a.call()},function(a){this.getTip().hide();a.call()}],fade:[function(a){var b=this.getConf();this.getTip().fadeTo(b.fadeInSpeed,b.opacity,a)},function(a){this.getTip().fadeOut(this.getConf().fadeOutSpeed,a)}]};f.fn.tooltip=function(a){var b=this.data("tooltip");if(b)return b;a=f.extend(true,
{},f.tools.tooltip.conf,a);if(typeof a.position=="string")a.position=a.position.split(/,?\s/);this.each(function(){b=new t(f(this),a);f(this).data("tooltip",b)});return a.api?b:this}})(jQuery);
(function(e){function n(f,c){var a=e(c);return a.length<2?a:f.parent().find(c)}function t(f,c){var a=this,l=f.add(a),g=f.children(),k=0,m=c.vertical;j||(j=a);if(g.length>1)g=e(c.items,f);e.extend(a,{getConf:function(){return c},getIndex:function(){return k},getSize:function(){return a.getItems().size()},getNaviButtons:function(){return o.add(p)},getRoot:function(){return f},getItemWrap:function(){return g},getItems:function(){return g.children(c.item).not("."+c.clonedClass)},move:function(b,d){return a.seekTo(k+
b,d)},next:function(b){return a.move(1,b)},prev:function(b){return a.move(-1,b)},begin:function(b){return a.seekTo(0,b)},end:function(b){return a.seekTo(a.getSize()-1,b)},focus:function(){return j=a},addItem:function(b){b=e(b);if(c.circular){e(".cloned:last").before(b);e(".cloned:first").replaceWith(b.clone().addClass(c.clonedClass))}else g.append(b);l.trigger("onAddItem",[b]);return a},seekTo:function(b,d,h){if(c.circular&&b===0&&k==-1&&d!==0)return a;if(!c.circular&&b<0||b>a.getSize()||b<-1)return a;
var i=b;if(b.jquery)b=a.getItems().index(b);else i=a.getItems().eq(b);var q=e.Event("onBeforeSeek");if(!h){l.trigger(q,[b,d]);if(q.isDefaultPrevented()||!i.length)return a}i=m?{top:-i.position().top}:{left:-i.position().left};k=b;j=a;if(d===undefined)d=c.speed;g.animate(i,d,c.easing,h||function(){l.trigger("onSeek",[b])});return a}});e.each(["onBeforeSeek","onSeek","onAddItem"],function(b,d){e.isFunction(c[d])&&e(a).bind(d,c[d]);a[d]=function(h){e(a).bind(d,h);return a}});if(c.circular){var r=a.getItems().slice(-1).clone().prependTo(g),
s=a.getItems().eq(1).clone().appendTo(g);r.add(s).addClass(c.clonedClass);a.onBeforeSeek(function(b,d,h){if(!b.isDefaultPrevented())if(d==-1){a.seekTo(r,h,function(){a.end(0)});return b.preventDefault()}else d==a.getSize()&&a.seekTo(s,h,function(){a.begin(0)})});a.seekTo(0,0)}var o=n(f,c.prev).click(function(){a.prev()}),p=n(f,c.next).click(function(){a.next()});!c.circular&&a.getSize()>1&&a.onBeforeSeek(function(b,d){o.toggleClass(c.disabledClass,d<=0);p.toggleClass(c.disabledClass,d>=a.getSize()-
1)});c.mousewheel&&e.fn.mousewheel&&f.mousewheel(function(b,d){if(c.mousewheel){a.move(d<0?1:-1,c.wheelSpeed||50);return false}});c.keyboard&&e(document).bind("keydown.scrollable",function(b){if(!(!c.keyboard||b.altKey||b.ctrlKey||e(b.target).is(":input")))if(!(c.keyboard!="static"&&j!=a)){var d=b.keyCode;if(m&&(d==38||d==40)){a.move(d==38?-1:1);return b.preventDefault()}if(!m&&(d==37||d==39)){a.move(d==37?-1:1);return b.preventDefault()}}});e(a).trigger("onBeforeSeek",[c.initialIndex])}e.tools=e.tools||
{version:"1.2.2"};e.tools.scrollable={conf:{activeClass:"active",circular:false,clonedClass:"cloned",disabledClass:"disabled",easing:"swing",initialIndex:0,item:null,items:".items",keyboard:true,mousewheel:false,next:".next",prev:".prev",speed:400,vertical:false,wheelSpeed:0}};var j;e.fn.scrollable=function(f){var c=this.data("scrollable");if(c)return c;f=e.extend({},e.tools.scrollable.conf,f);this.each(function(){c=new t(e(this),f);e(this).data("scrollable",c)});return f.api?c:this}})(jQuery);
(function(c){var g=c.tools.scrollable;g.autoscroll={conf:{autoplay:true,interval:3E3,autopause:true}};c.fn.autoscroll=function(d){if(typeof d=="number")d={interval:d};var b=c.extend({},g.autoscroll.conf,d),h;this.each(function(){var a=c(this).data("scrollable");if(a)h=a;var e,i,f=true;a.play=function(){if(!e){f=false;e=setInterval(function(){a.next()},b.interval);a.next()}};a.pause=function(){e=clearInterval(e)};a.stop=function(){a.pause();f=true};b.autopause&&a.getRoot().add(a.getNaviButtons()).hover(function(){a.pause();
clearInterval(i)},function(){f||(i=setTimeout(a.play,b.interval))});b.autoplay&&setTimeout(a.play,b.interval)});return b.api?h:this}})(jQuery);
(function(d){function p(c,g){var h=d(g);return h.length<2?h:c.parent().find(g)}var m=d.tools.scrollable;m.navigator={conf:{navi:".navi",naviItem:null,activeClass:"active",indexed:false,idPrefix:null,history:false}};d.fn.navigator=function(c){if(typeof c=="string")c={navi:c};c=d.extend({},m.navigator.conf,c);var g;this.each(function(){function h(a,b,i){e.seekTo(b);if(j){if(location.hash)location.hash=a.attr("href").replace("#","")}else return i.preventDefault()}function f(){return k.find(c.naviItem||
"> *")}function n(a){var b=d("<"+(c.naviItem||"a")+"/>").click(function(i){h(d(this),a,i)}).attr("href","#"+a);a===0&&b.addClass(l);c.indexed&&b.text(a+1);c.idPrefix&&b.attr("id",c.idPrefix+a);return b.appendTo(k)}function o(a,b){a=f().eq(b.replace("#",""));a.length||(a=f().filter("[href="+b+"]"));a.click()}var e=d(this).data("scrollable"),k=p(e.getRoot(),c.navi),q=e.getNaviButtons(),l=c.activeClass,j=c.history&&d.fn.history;if(e)g=e;e.getNaviButtons=function(){return q.add(k)};f().length?f().each(function(a){d(this).click(function(b){h(d(this),
a,b)})}):d.each(e.getItems(),function(a){n(a)});e.onBeforeSeek(function(a,b){var i=f().eq(b);!a.isDefaultPrevented()&&i.length&&f().removeClass(l).eq(b).addClass(l)});e.onAddItem(function(a,b){b=n(e.getItems().index(b));j&&b.history(o)});j&&f().history(o)});return c.api?g:this}})(jQuery);
(function(e){function v(a,b,c){var j=a.offset().top,g=a.offset().left,l=c.position.split(/,?\s+/),f=l[0];l=l[1];j-=b.outerHeight()-c.offset[0];g+=a.outerWidth()+c.offset[1];c=b.outerHeight()+a.outerHeight();if(f=="center")j+=c/2;if(f=="bottom")j+=c;a=a.outerWidth();if(l=="center")g-=(a+b.outerWidth())/2;if(l=="left")g-=a;return{top:j,left:g}}function w(a){function b(){return this.getAttribute("type")==a}b.key="[type="+a+"]";return b}function s(a,b,c){function j(f,d,k){if(!(!c.grouped&&f.length)){var h;
if(k===false||e.isArray(k)){h=i.messages[d.key||d]||i.messages["*"];h=h[c.lang]||i.messages["*"].en;(d=h.match(/\$\d/g))&&e.isArray(k)&&e.each(d,function(n){h=h.replace(this,k[n])})}else h=k[c.lang]||k;f.push(h)}}var g=this,l=b.add(g);a=a.not(":button, :image, :reset, :submit");e.extend(g,{getConf:function(){return c},getForm:function(){return b},getInputs:function(){return a},invalidate:function(f,d){if(!d){var k=[];e.each(f,function(h,n){h=a.filter("[name="+h+"]");if(h.length){h.trigger("OI",[n]);
k.push({input:h,messages:[n]})}});f=k;d=e.Event()}d.type="onFail";l.trigger(d,[f]);d.isDefaultPrevented()||q[c.effect][0].call(g,f,d);return g},reset:function(f){f=f||a;f.removeClass(c.errorClass).each(function(){var d=e(this).data("msg.el");if(d){d.remove();e(this).data("msg.el",null)}})},checkValidity:function(f,d){f=f||a;f=f.not(":disabled");if(!f.length)return true;d=d||e.Event();d.type="onBeforeValidate";l.trigger(d,[f]);if(d.isDefaultPrevented())return d.result;var k=[],h=c.errorInputEvent+
".v";f.each(function(){var p=[],m=e(this).unbind(h).data("messages",p);e.each(t,function(){var o=this,r=o[0];if(m.filter(r).length){o=o[1].call(g,m,m.val());if(o!==true){d.type="onBeforeFail";l.trigger(d,[m,r]);if(d.isDefaultPrevented())return false;var u=m.attr(c.messageAttr);if(u){p=[u];return false}else j(p,r,o)}}});if(p.length){k.push({input:m,messages:p});m.trigger("OI",[p]);c.errorInputEvent&&m.bind(h,function(o){g.checkValidity(m,o)})}if(c.singleError&&k.length)return false});var n=q[c.effect];
if(!n)throw'Validator: cannot find effect "'+c.effect+'"';if(k.length){g.invalidate(k,d);return false}else{n[1].call(g,f,d);d.type="onSuccess";l.trigger(d,[f]);f.unbind(h)}return true}});e.each("onBeforeValidate,onBeforeFail,onFail,onSuccess".split(","),function(f,d){e.isFunction(c[d])&&e(g).bind(d,c[d]);g[d]=function(k){e(g).bind(d,k);return g}});c.formEvent&&b.bind(c.formEvent,function(f){if(!g.checkValidity(null,f))return f.preventDefault()});b.bind("reset",function(){g.reset()});a[0]&&a[0].validity&&
a.each(function(){this.oninvalid=function(){return false}});if(b[0])b[0].checkValidity=g.checkValidity;c.inputEvent&&a.bind(c.inputEvent,function(f){g.checkValidity(e(this),f)});a.filter(":checkbox, select").filter("[required]").change(function(f){var d=e(this);if(this.checked||d.is("select")&&e(this).val())q[c.effect][1].call(g,d,f)})}e.tools=e.tools||{version:"1.2.2"};var x=/\[type=([a-z]+)\]/,y=/^-?[0-9]*(\.[0-9]+)?$/,z=/^([a-z0-9_\.\-\+]+)@([\da-z\.\-]+)\.([a-z\.]{2,6})$/i,A=/^(https?:\/\/)?([\da-z\.\-]+)\.([a-z\.]{2,6})([\/\w \.\-]*)*\/?$/i,
i;i=e.tools.validator={conf:{grouped:false,effect:"default",errorClass:"invalid",inputEvent:null,errorInputEvent:"keyup",formEvent:"submit",lang:"en",message:"<div/>",messageAttr:"data-message",messageClass:"error",offset:[0,0],position:"center right",singleError:false,speed:"normal"},messages:{"*":{en:"is required."}},localize:function(a,b){e.each(b,function(c,j){i.messages[c]=i.messages[c]||{};i.messages[c][a]=j})},localizeFn:function(a,b){i.messages[a]=i.messages[a]||{};e.extend(i.messages[a],
b)},fn:function(a,b,c){if(e.isFunction(b))c=b;else{if(typeof b=="string")b={en:b};this.messages[a.key||a]=b}if(b=x.exec(a))a=w(b[1]);t.push([a,c])},addEffect:function(a,b,c){q[a]=[b,c]}};var t=[],q={"default":[function(a){var b=this.getConf();e.each(a,function(c,j){c=j.input;c.addClass(b.errorClass);var g=c.data("msg.el");if(!g){g=e(b.message).addClass(b.messageClass).appendTo(document.body);c.data("msg.el",g)}g.css({visibility:"hidden"}).find("span").remove();e.each(j.messages,function(l,f){e("<span/>").html(f).appendTo(g)});
g.outerWidth()==g.parent().width()&&g.add(g.find("p")).css({display:"inline"});j=v(c,g,b);g.css({visibility:"visible",position:"absolute",top:j.top,left:j.left}).fadeIn(b.speed)})},function(a){var b=this.getConf();a.removeClass(b.errorClass).each(function(){var c=e(this).data("msg.el");c&&c.css({visibility:"hidden"})})}]};e.each("email,url,number".split(","),function(a,b){e.expr[":"][b]=function(c){return c.getAttribute("type")===b}});e.fn.oninvalid=function(a){return this[a?"bind":"trigger"]("OI",
a)};i.fn(":email","is not a valid email address.",function(a,b){return!b||z.test(b)});i.fn(":url","is not a valid URL.",function(a,b){return!b||A.test(b)});i.fn(":number","has to be a numeric value.",function(a,b){return y.test(b)});i.fn("[max]","has to be smaller than $1",function(a,b){a=a.attr("max");return parseFloat(b)<=parseFloat(a)?true:[a]});i.fn("[min]","has to be larger than $1",function(a,b){a=a.attr("min");return parseFloat(b)>=parseFloat(a)?true:[a]});
i.fn("[required]","is required.",function(a,b){if(a.is(":checkbox"))return a.is(":checked");return!!b});i.fn("[pattern]",function(a){var b=new RegExp("^"+a.attr("pattern")+"$");return b.test(a.val())});e.fn.validator=function(a){if(this.data("validator"))return this;a=e.extend(true,{},i.conf,a);if(this.is("form"))return this.each(function(){var c=e(this),j=new s(c.find(":input"),c,a);c.data("validator",j)});else{var b=new s(this,this.eq(0).closest("form"),a);return this.data("validator",
b)}}})(jQuery);
(function(b){function c(a){switch(a.type){case "mousemove":return b.extend(a.data,{clientX:a.clientX,clientY:a.clientY,pageX:a.pageX,pageY:a.pageY});case "DOMMouseScroll":b.extend(a,a.data);a.delta=-a.detail/3;break;case "mousewheel":a.delta=a.wheelDelta/120;break}a.type="wheel";return b.event.handle.call(this,a,a.delta)}b.fn.mousewheel=function(a){return this[a?"bind":"trigger"]("wheel",a)};b.event.special.wheel={setup:function(){b.event.add(this,d,c,{})},teardown:function(){b.event.remove(this,
d,c)}};var d=!b.browser.mozilla?"mousewheel":"DOMMouseScroll"+(b.browser.version<"1.9"?" mousemove":"")})(jQuery);