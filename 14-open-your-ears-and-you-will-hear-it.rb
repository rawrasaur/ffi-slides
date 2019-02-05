require "./13-when-im-going-im-going-for-mine.rb"

require 'webrick'

Port = 1024 + rand(10000)
Server = WEBrick::HTTPServer.new Port: Port, DocumentRoot: __dir__

Server.mount_proc '/index.html' do |req, res|
  res.status = 200
  res['Content-Type'] = 'text/html; charset=utf-8'
  res.body = File.read(__FILE__).split(/^__END__$/, 2)[1]
end

if __FILE__ == $0
  Thread.new { Server.start }

  sleep 0.1

  config = WKWebViewConfiguration.alloc.init
  config.setUserContentController(WKUserContentController.alloc.init)

  view = WKWebView.alloc.initWithFrame(RECT, configuration: config)
  view.loadRequest(NSURLRequest.alloc.initWithURL(NSURL.alloc.initWithString(NSString.alloc.initWithUTF8String("http://localhost:#{Port}/index.html"))))
  Window.contentView.addSubview(view)

  NSApplication.sharedApplication.tap { |app| app.setActivationPolicy(0); app.activateIgnoringOtherApps(1) }.run
end

__END__
<!DOCTYPE html>

<html>
  <body>
    <style>
      html {
        font-size: 20px;
      }

      body {
        height: 100vh;
      }

      #code {
        width: 60%; margin: auto 20px auto auto;
      }

      #code pre {
       border-radius: 12px;
      }

      #image {
        width: 35%; margin: auto auto auto auto;
      }

      #image img {
        width: 100%; border-radius: 12px;
      }

      #introduction {
        display: flex;
        flex-direction: column;
        align-content: center;
        justify-content: center;
      }

      #introduction h1 {
        font-family: "Avenir";
        font-size: 48pt;
        text-align: center;
      }

      #introduction span {
        font-family: "Avenir";
        font-size: 32pt;
        text-align: center;
      }

      #introduction li {
        font-family: "Avenir";
        font-size: 32pt;
      }

      #introduction ul.final li {
        font-family: "Avenir";
        font-size: 20pt;
      }

      #introduction img {
        padding-top: 60px;
      }

      /* PrismJS 1.15.0
      /* PrismJS 1.15.0
      https://prismjs.com/download.html#themes=prism-tomorrow&languages=clike+ruby&plugins=line-numbers+file-highlight+command-line */
      /**
       * prism.js tomorrow night eighties for JavaScript, CoffeeScript, CSS and HTML
       * Based on https://github.com/chriskempson/tomorrow-theme
       * @author Rose Pritchard
       */

      code[class*="language-"],
      pre[class*="language-"] {
      	color: #ccc;
      	background: none;
      	font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace;
      	text-align: left;
      	white-space: pre;
      	word-spacing: normal;
      	word-break: normal;
      	word-wrap: normal;
      	line-height: 1.5;

      	-moz-tab-size: 4;
      	-o-tab-size: 4;
      	tab-size: 4;

      	-webkit-hyphens: none;
      	-moz-hyphens: none;
      	-ms-hyphens: none;
      	hyphens: none;

      }

      /* Code blocks */
      pre[class*="language-"] {
      	padding: 1em;
      	margin: .5em 0;
      	overflow: auto;
      }

      :not(pre) > code[class*="language-"],
      pre[class*="language-"] {
      	background: #2d2d2d;
      }

      /* Inline code */
      :not(pre) > code[class*="language-"] {
      	padding: .1em;
      	border-radius: .3em;
      	white-space: normal;
      }

      .token.comment,
      .token.block-comment,
      .token.prolog,
      .token.doctype,
      .token.cdata {
      	color: #999;
      }

      .token.punctuation {
      	color: #ccc;
      }

      .token.tag,
      .token.attr-name,
      .token.namespace,
      .token.deleted {
      	color: #e2777a;
      }

      .token.function-name {
      	color: #6196cc;
      }

      .token.boolean,
      .token.number,
      .token.function {
      	color: #f08d49;
      }

      .token.property,
      .token.class-name,
      .token.constant,
      .token.symbol {
      	color: #f8c555;
      }

      .token.selector,
      .token.important,
      .token.atrule,
      .token.keyword,
      .token.builtin {
      	color: #cc99cd;
      }

      .token.string,
      .token.char,
      .token.attr-value,
      .token.regex,
      .token.variable {
      	color: #7ec699;
      }

      .token.operator,
      .token.entity,
      .token.url {
      	color: #67cdcc;
      }

      .token.important,
      .token.bold {
      	font-weight: bold;
      }
      .token.italic {
      	font-style: italic;
      }

      .token.entity {
      	cursor: help;
      }

      .token.inserted {
      	color: green;
      }

      pre[class*="language-"].line-numbers {
      	position: relative;
      	padding-left: 3.8em;
      	counter-reset: linenumber;
      }

      pre[class*="language-"].line-numbers > code {
      	position: relative;
      	white-space: inherit;
      }

      .line-numbers .line-numbers-rows {
      	position: absolute;
      	pointer-events: none;
      	top: 0;
      	font-size: 100%;
      	left: -3.8em;
      	width: 3em; /* works for line-numbers below 1000 lines */
      	letter-spacing: -1px;
      	border-right: 1px solid #999;

      	-webkit-user-select: none;
      	-moz-user-select: none;
      	-ms-user-select: none;
      	user-select: none;

      }

      	.line-numbers-rows > span {
      		pointer-events: none;
      		display: block;
      		counter-increment: linenumber;
      	}

      		.line-numbers-rows > span:before {
      			content: counter(linenumber);
      			color: #999;
      			display: block;
      			padding-right: 0.8em;
      			text-align: right;
      		}

      .command-line-prompt {
      	border-right: 1px solid #999;
      	display: block;
      	float: left;
      	font-size: 100%;
      	letter-spacing: -1px;
      	margin-right: 1em;
      	pointer-events: none;

      	-webkit-user-select: none;
      	-moz-user-select: none;
      	-ms-user-select: none;
      	user-select: none;
      }

      .command-line-prompt > span:before {
      	color: #999;
      	content: ' ';
      	display: block;
      	padding-right: 0.8em;
      }

      .command-line-prompt > span[data-user]:before {
      	content: "[" attr(data-user) "@" attr(data-host) "] $";
      }

      .command-line-prompt > span[data-user="root"]:before {
      	content: "[" attr(data-user) "@" attr(data-host) "] #";
      }

      .command-line-prompt > span[data-prompt]:before {
      	content: attr(data-prompt);
      }
    }
    </style>
    <div id="container" style="display: flex; justify-content: center; align-content: center; height: 100%">
      <div id="code"><pre><code class="language-ruby line-numbers">Open your ears and you will hear it</code></pre></div>
      <div id="image"><img></div>
    </div>
    <script>
    /* PrismJS 1.15.0
    https://prismjs.com/download.html#themes=prism-tomorrow&languages=clike+ruby&plugins=line-numbers+file-highlight+command-line */
    var _self="undefined"!=typeof window?window:"undefined"!=typeof WorkerGlobalScope&&self instanceof WorkerGlobalScope?self:{},Prism=function(){var e=/\blang(?:uage)?-([\w-]+)\b/i,t=0,n=_self.Prism={manual:_self.Prism&&_self.Prism.manual,disableWorkerMessageHandler:_self.Prism&&_self.Prism.disableWorkerMessageHandler,util:{encode:function(e){return e instanceof a?new a(e.type,n.util.encode(e.content),e.alias):"Array"===n.util.type(e)?e.map(n.util.encode):e.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/\u00a0/g," ")},type:function(e){return Object.prototype.toString.call(e).slice(8,-1)},objId:function(e){return e.__id||Object.defineProperty(e,"__id",{value:++t}),e.__id},clone:function(e,t){var a=n.util.type(e);switch(t=t||{},a){case"Object":if(t[n.util.objId(e)])return t[n.util.objId(e)];var r={};t[n.util.objId(e)]=r;for(var l in e)e.hasOwnProperty(l)&&(r[l]=n.util.clone(e[l],t));return r;case"Array":if(t[n.util.objId(e)])return t[n.util.objId(e)];var r=[];return t[n.util.objId(e)]=r,e.forEach(function(e,a){r[a]=n.util.clone(e,t)}),r}return e}},languages:{extend:function(e,t){var a=n.util.clone(n.languages[e]);for(var r in t)a[r]=t[r];return a},insertBefore:function(e,t,a,r){r=r||n.languages;var l=r[e],i={};for(var o in l)if(l.hasOwnProperty(o)){if(o==t)for(var s in a)a.hasOwnProperty(s)&&(i[s]=a[s]);a.hasOwnProperty(o)||(i[o]=l[o])}var u=r[e];return r[e]=i,n.languages.DFS(n.languages,function(t,n){n===u&&t!=e&&(this[t]=i)}),i},DFS:function(e,t,a,r){r=r||{};for(var l in e)e.hasOwnProperty(l)&&(t.call(e,l,e[l],a||l),"Object"!==n.util.type(e[l])||r[n.util.objId(e[l])]?"Array"!==n.util.type(e[l])||r[n.util.objId(e[l])]||(r[n.util.objId(e[l])]=!0,n.languages.DFS(e[l],t,l,r)):(r[n.util.objId(e[l])]=!0,n.languages.DFS(e[l],t,null,r)))}},plugins:{},highlightAll:function(e,t){n.highlightAllUnder(document,e,t)},highlightAllUnder:function(e,t,a){var r={callback:a,selector:'code[class*="language-"], [class*="language-"] code, code[class*="lang-"], [class*="lang-"] code'};n.hooks.run("before-highlightall",r);for(var l,i=r.elements||e.querySelectorAll(r.selector),o=0;l=i[o++];)n.highlightElement(l,t===!0,r.callback)},highlightElement:function(t,a,r){for(var l,i,o=t;o&&!e.test(o.className);)o=o.parentNode;o&&(l=(o.className.match(e)||[,""])[1].toLowerCase(),i=n.languages[l]),t.className=t.className.replace(e,"").replace(/\s+/g," ")+" language-"+l,t.parentNode&&(o=t.parentNode,/pre/i.test(o.nodeName)&&(o.className=o.className.replace(e,"").replace(/\s+/g," ")+" language-"+l));var s=t.textContent,u={element:t,language:l,grammar:i,code:s},g=function(e){u.highlightedCode=e,n.hooks.run("before-insert",u),u.element.innerHTML=u.highlightedCode,n.hooks.run("after-highlight",u),n.hooks.run("complete",u),r&&r.call(u.element)};if(n.hooks.run("before-sanity-check",u),!u.code)return n.hooks.run("complete",u),void 0;if(n.hooks.run("before-highlight",u),!u.grammar)return g(n.util.encode(u.code)),void 0;if(a&&_self.Worker){var c=new Worker(n.filename);c.onmessage=function(e){g(e.data)},c.postMessage(JSON.stringify({language:u.language,code:u.code,immediateClose:!0}))}else g(n.highlight(u.code,u.grammar,u.language))},highlight:function(e,t,r){var l={code:e,grammar:t,language:r};return n.hooks.run("before-tokenize",l),l.tokens=n.tokenize(l.code,l.grammar),n.hooks.run("after-tokenize",l),a.stringify(n.util.encode(l.tokens),l.language)},matchGrammar:function(e,t,a,r,l,i,o){var s=n.Token;for(var u in a)if(a.hasOwnProperty(u)&&a[u]){if(u==o)return;var g=a[u];g="Array"===n.util.type(g)?g:[g];for(var c=0;c<g.length;++c){var f=g[c],h=f.inside,d=!!f.lookbehind,m=!!f.greedy,p=0,y=f.alias;if(m&&!f.pattern.global){var v=f.pattern.toString().match(/[imuy]*$/)[0];f.pattern=RegExp(f.pattern.source,v+"g")}f=f.pattern||f;for(var b=r,k=l;b<t.length;k+=t[b].length,++b){var w=t[b];if(t.length>e.length)return;if(!(w instanceof s)){if(m&&b!=t.length-1){f.lastIndex=k;var _=f.exec(e);if(!_)break;for(var j=_.index+(d?_[1].length:0),P=_.index+_[0].length,A=b,O=k,x=t.length;x>A&&(P>O||!t[A].type&&!t[A-1].greedy);++A)O+=t[A].length,j>=O&&(++b,k=O);if(t[b]instanceof s)continue;I=A-b,w=e.slice(k,O),_.index-=k}else{f.lastIndex=0;var _=f.exec(w),I=1}if(_){d&&(p=_[1]?_[1].length:0);var j=_.index+p,_=_[0].slice(p),P=j+_.length,N=w.slice(0,j),S=w.slice(P),E=[b,I];N&&(++b,k+=N.length,E.push(N));var C=new s(u,h?n.tokenize(_,h):_,y,_,m);if(E.push(C),S&&E.push(S),Array.prototype.splice.apply(t,E),1!=I&&n.matchGrammar(e,t,a,b,k,!0,u),i)break}else if(i)break}}}}},tokenize:function(e,t){var a=[e],r=t.rest;if(r){for(var l in r)t[l]=r[l];delete t.rest}return n.matchGrammar(e,a,t,0,0,!1),a},hooks:{all:{},add:function(e,t){var a=n.hooks.all;a[e]=a[e]||[],a[e].push(t)},run:function(e,t){var a=n.hooks.all[e];if(a&&a.length)for(var r,l=0;r=a[l++];)r(t)}}},a=n.Token=function(e,t,n,a,r){this.type=e,this.content=t,this.alias=n,this.length=0|(a||"").length,this.greedy=!!r};if(a.stringify=function(e,t,r){if("string"==typeof e)return e;if("Array"===n.util.type(e))return e.map(function(n){return a.stringify(n,t,e)}).join("");var l={type:e.type,content:a.stringify(e.content,t,r),tag:"span",classes:["token",e.type],attributes:{},language:t,parent:r};if(e.alias){var i="Array"===n.util.type(e.alias)?e.alias:[e.alias];Array.prototype.push.apply(l.classes,i)}n.hooks.run("wrap",l);var o=Object.keys(l.attributes).map(function(e){return e+'="'+(l.attributes[e]||"").replace(/"/g,"&quot;")+'"'}).join(" ");return"<"+l.tag+' class="'+l.classes.join(" ")+'"'+(o?" "+o:"")+">"+l.content+"</"+l.tag+">"},!_self.document)return _self.addEventListener?(n.disableWorkerMessageHandler||_self.addEventListener("message",function(e){var t=JSON.parse(e.data),a=t.language,r=t.code,l=t.immediateClose;_self.postMessage(n.highlight(r,n.languages[a],a)),l&&_self.close()},!1),_self.Prism):_self.Prism;var r=document.currentScript||[].slice.call(document.getElementsByTagName("script")).pop();return r&&(n.filename=r.src,n.manual||r.hasAttribute("data-manual")||("loading"!==document.readyState?window.requestAnimationFrame?window.requestAnimationFrame(n.highlightAll):window.setTimeout(n.highlightAll,16):document.addEventListener("DOMContentLoaded",n.highlightAll))),_self.Prism}();"undefined"!=typeof module&&module.exports&&(module.exports=Prism),"undefined"!=typeof global&&(global.Prism=Prism);
    Prism.languages.clike={comment:[{pattern:/(^|[^\\])\/\*[\s\S]*?(?:\*\/|$)/,lookbehind:!0},{pattern:/(^|[^\\:])\/\/.*/,lookbehind:!0,greedy:!0}],string:{pattern:/(["'])(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,greedy:!0},"class-name":{pattern:/((?:\b(?:class|interface|extends|implements|trait|instanceof|new)\s+)|(?:catch\s+\())[\w.\\]+/i,lookbehind:!0,inside:{punctuation:/[.\\]/}},keyword:/\b(?:if|else|while|do|for|return|in|instanceof|function|new|try|throw|catch|finally|null|break|continue)\b/,"boolean":/\b(?:true|false)\b/,"function":/\w+(?=\()/,number:/\b0x[\da-f]+\b|(?:\b\d+\.?\d*|\B\.\d+)(?:e[+-]?\d+)?/i,operator:/--?|\+\+?|!=?=?|<=?|>=?|==?=?|&&?|\|\|?|\?|\*|\/|~|\^|%/,punctuation:/[{}[\];(),.:]/};
    !function(e){e.languages.ruby=e.languages.extend("clike",{comment:[/#.*/,{pattern:/^=begin(?:\r?\n|\r)(?:.*(?:\r?\n|\r))*?=end/m,greedy:!0}],keyword:/\b(?:alias|and|BEGIN|begin|break|case|class|def|define_method|defined|do|each|else|elsif|END|end|ensure|false|for|if|in|module|new|next|nil|not|or|protected|private|public|raise|redo|require|rescue|retry|return|self|super|then|throw|true|undef|unless|until|when|while|yield)\b/});var n={pattern:/#\{[^}]+\}/,inside:{delimiter:{pattern:/^#\{|\}$/,alias:"tag"},rest:e.languages.ruby}};delete e.languages.ruby.function,e.languages.insertBefore("ruby","keyword",{regex:[{pattern:/%r([^a-zA-Z0-9\s{(\[<])(?:(?!\1)[^\\]|\\[\s\S])*\1[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r\((?:[^()\\]|\\[\s\S])*\)[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r\{(?:[^#{}\\]|#(?:\{[^}]+\})?|\\[\s\S])*\}[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r\[(?:[^\[\]\\]|\\[\s\S])*\][gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/%r<(?:[^<>\\]|\\[\s\S])*>[gim]{0,3}/,greedy:!0,inside:{interpolation:n}},{pattern:/(^|[^\/])\/(?!\/)(\[.+?]|\\.|[^\/\\\r\n])+\/[gim]{0,3}(?=\s*($|[\r\n,.;})]))/,lookbehind:!0,greedy:!0}],variable:/[@$]+[a-zA-Z_]\w*(?:[?!]|\b)/,symbol:{pattern:/(^|[^:]):[a-zA-Z_]\w*(?:[?!]|\b)/,lookbehind:!0},"method-definition":{pattern:/(\bdef\s+)[\w.]+/,lookbehind:!0,inside:{"function":/\w+$/,rest:e.languages.ruby}}}),e.languages.insertBefore("ruby","number",{builtin:/\b(?:Array|Bignum|Binding|Class|Continuation|Dir|Exception|FalseClass|File|Stat|Fixnum|Float|Hash|Integer|IO|MatchData|Method|Module|NilClass|Numeric|Object|Proc|Range|Regexp|String|Struct|TMS|Symbol|ThreadGroup|Thread|Time|TrueClass)\b/,constant:/\b[A-Z]\w*(?:[?!]|\b)/}),e.languages.ruby.string=[{pattern:/%[qQiIwWxs]?([^a-zA-Z0-9\s{(\[<])(?:(?!\1)[^\\]|\\[\s\S])*\1/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?\((?:[^()\\]|\\[\s\S])*\)/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?\{(?:[^#{}\\]|#(?:\{[^}]+\})?|\\[\s\S])*\}/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?\[(?:[^\[\]\\]|\\[\s\S])*\]/,greedy:!0,inside:{interpolation:n}},{pattern:/%[qQiIwWxs]?<(?:[^<>\\]|\\[\s\S])*>/,greedy:!0,inside:{interpolation:n}},{pattern:/("|')(?:#\{[^}]+\}|\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,greedy:!0,inside:{interpolation:n}}],e.languages.rb=e.languages.ruby}(Prism);
    !function(){if("undefined"!=typeof self&&self.Prism&&self.document){var e="line-numbers",t=/\n(?!$)/g,n=function(e){var n=r(e),s=n["white-space"];if("pre-wrap"===s||"pre-line"===s){var l=e.querySelector("code"),i=e.querySelector(".line-numbers-rows"),a=e.querySelector(".line-numbers-sizer"),o=l.textContent.split(t);a||(a=document.createElement("span"),a.className="line-numbers-sizer",l.appendChild(a)),a.style.display="block",o.forEach(function(e,t){a.textContent=e||"\n";var n=a.getBoundingClientRect().height;i.children[t].style.height=n+"px"}),a.textContent="",a.style.display="none"}},r=function(e){return e?window.getComputedStyle?getComputedStyle(e):e.currentStyle||null:null};window.addEventListener("resize",function(){Array.prototype.forEach.call(document.querySelectorAll("pre."+e),n)}),Prism.hooks.add("complete",function(e){if(e.code){var r=e.element.parentNode,s=/\s*\bline-numbers\b\s*/;if(r&&/pre/i.test(r.nodeName)&&(s.test(r.className)||s.test(e.element.className))&&!e.element.querySelector(".line-numbers-rows")){s.test(e.element.className)&&(e.element.className=e.element.className.replace(s," ")),s.test(r.className)||(r.className+=" line-numbers");var l,i=e.code.match(t),a=i?i.length+1:1,o=new Array(a+1);o=o.join("<span></span>"),l=document.createElement("span"),l.setAttribute("aria-hidden","true"),l.className="line-numbers-rows",l.innerHTML=o,r.hasAttribute("data-start")&&(r.style.counterReset="linenumber "+(parseInt(r.getAttribute("data-start"),10)-1)),e.element.appendChild(l),n(r),Prism.hooks.run("line-numbers",e)}}}),Prism.hooks.add("line-numbers",function(e){e.plugins=e.plugins||{},e.plugins.lineNumbers=!0}),Prism.plugins.lineNumbers={getLine:function(t,n){if("PRE"===t.tagName&&t.classList.contains(e)){var r=t.querySelector(".line-numbers-rows"),s=parseInt(t.getAttribute("data-start"),10)||1,l=s+(r.children.length-1);s>n&&(n=s),n>l&&(n=l);var i=n-s;return r.children[i]}}}}}();
    !function(){"undefined"!=typeof self&&self.Prism&&self.document&&document.querySelector&&(self.Prism.fileHighlight=function(t){t=t||document;var e={js:"javascript",py:"python",rb:"ruby",ps1:"powershell",psm1:"powershell",sh:"bash",bat:"batch",h:"c",tex:"latex"};Array.prototype.slice.call(t.querySelectorAll("pre[data-src]")).forEach(function(t){if(!t.hasAttribute("data-src-loaded")){for(var a,n=t.getAttribute("data-src"),r=t,s=/\blang(?:uage)?-([\w-]+)\b/i;r&&!s.test(r.className);)r=r.parentNode;if(r&&(a=(t.className.match(s)||[,""])[1]),!a){var o=(n.match(/\.(\w+)$/)||[,""])[1];a=e[o]||o}var l=document.createElement("code");l.className="language-"+a,t.textContent="",l.textContent="Loading…",t.appendChild(l);var i=new XMLHttpRequest;i.open("GET",n,!0),i.onreadystatechange=function(){4==i.readyState&&(i.status<400&&i.responseText?(l.textContent=i.responseText,Prism.highlightElement(l),t.setAttribute("data-src-loaded","")):l.textContent=i.status>=400?"✖ Error "+i.status+" while fetching file: "+i.statusText:"✖ Error: File does not exist or is empty")},i.send(null)}}),Prism.plugins.toolbar&&Prism.plugins.toolbar.registerButton("download-file",function(t){var e=t.element.parentNode;if(e&&/pre/i.test(e.nodeName)&&e.hasAttribute("data-src")&&e.hasAttribute("data-download-link")){var a=e.getAttribute("data-src"),n=document.createElement("a");return n.textContent=e.getAttribute("data-download-link-label")||"Download",n.setAttribute("download",""),n.href=a,n}})},document.addEventListener("DOMContentLoaded",function(){self.Prism.fileHighlight()}))}();
    !function(){if("undefined"!=typeof self&&self.Prism&&self.document){var e=/(?:^|\s)command-line(?:\s|$)/;Prism.hooks.add("before-highlight",function(t){var a=t.vars=t.vars||{},n=a["command-line"]=a["command-line"]||{};if(n.complete||!t.code)return n.complete=!0,void 0;var r=t.element.parentNode;if(!r||!/pre/i.test(r.nodeName)||!e.test(r.className)&&!e.test(t.element.className))return n.complete=!0,void 0;if(t.element.querySelector(".command-line-prompt"))return n.complete=!0,void 0;var o=t.code.split("\n");n.numberOfLines=o.length;var s=n.outputLines=[],i=r.getAttribute("data-output"),l=r.getAttribute("data-filter-output");if(i||""===i){i=i.split(",");for(var m=0;m<i.length;m++){var d=i[m].split("-"),p=parseInt(d[0],10),c=2===d.length?parseInt(d[1],10):p;if(!isNaN(p)&&!isNaN(c)){1>p&&(p=1),c>o.length&&(c=o.length),p--,c--;for(var u=p;c>=u;u++)s[u]=o[u],o[u]=""}}}else if(l)for(var m=0;m<o.length;m++)0===o[m].indexOf(l)&&(s[m]=o[m].slice(l.length),o[m]="");t.code=o.join("\n")}),Prism.hooks.add("before-insert",function(e){var t=e.vars=e.vars||{},a=t["command-line"]=t["command-line"]||{};if(!a.complete){for(var n=e.highlightedCode.split("\n"),r=0;r<a.outputLines.length;r++)a.outputLines.hasOwnProperty(r)&&(n[r]=a.outputLines[r]);e.highlightedCode=n.join("\n")}}),Prism.hooks.add("complete",function(t){var a=t.vars=t.vars||{},n=a["command-line"]=a["command-line"]||{};if(!n.complete){var r=t.element.parentNode;e.test(t.element.className)&&(t.element.className=t.element.className.replace(e," ")),e.test(r.className)||(r.className+=" command-line");var o=function(e,t){return(r.getAttribute(e)||t).replace(/"/g,"&quot")},s=new Array(n.numberOfLines+1),i=o("data-prompt","");if(""!==i)s=s.join('<span data-prompt="'+i+'"></span>');else{var l=o("data-user","user"),m=o("data-host","localhost");s=s.join('<span data-user="'+l+'" data-host="'+m+'"></span>')}var d=document.createElement("span");d.className="command-line-prompt",d.innerHTML=s;for(var p=0;p<n.outputLines.length;p++)if(n.outputLines.hasOwnProperty(p)){var c=d.children[p];c.removeAttribute("data-user"),c.removeAttribute("data-host"),c.removeAttribute("data-prompt")}t.element.insertBefore(d,t.element.firstChild),n.complete=!0}})}}();

      async function setup() {
        let a = await fetch('/slides.json')
        let result = await a.json()

        window.currentSlide = result.slides.map((x) => x.name).indexOf(result.default)
        window.slides = result.slides

        await setSlide()
      }

      async function setSlide() {
        let slide = window.slides[window.currentSlide]

        if (slide.type == "ruby") {
          document.getElementById("container").innerHTML = `<div id="code"><pre data-src="${slide.name}.rb"></pre></div><div id="image"><img src="${slide.name}.png"></div>`
        } else if (slide.type == "html") {
          document.getElementById("container").innerHTML = await (await fetch(`/${slide.name}.html`)).text()
        }

        Prism.fileHighlight(document)
      }

      async function runCode() {
        let slide = window.slides[window.currentSlide]

        let e = await fetch(`/execute/${slide.name}.rb`)

        let previous = document.querySelector(".command-line")
        if (previous) { previous.parentNode.removeChild(previous) }
        document.getElementById("code").innerHTML += `<pre class="command-line" data-user="root" data-host="localhost" data-filter-output="(out)"><code class="language-none">${await e.text()}</code></pre>`

        Prism.highlightElement(document.querySelector(".command-line code"))
      }

      window.addEventListener("keypress", function (e) {
        if (e.key == "a") {
          window.currentSlide = Math.max(0, window.currentSlide - 1)
          setSlide()
        } else if (e.key == "s") {
          window.currentSlide = Math.min(window.slides.length - 1, window.currentSlide + 1)
          setSlide()
        } else if (e.key == "d") {
          if (window.slides[window.currentSlide].type == "ruby") {
            runCode()
          }
        }
      }, false)
      setup()
    </script>
  </body>
</html>
