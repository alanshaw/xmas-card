// Generated by CoffeeScript 1.4.0
(function(){var e,t,n,r,i,s,o,u,a,f,l,c,h,p,d,v;l=$(window);h=l.width();c=l.height();f=["&#x2744","&#x2745","&#x2746"];s=0;i=function(e){var t,n;n=f[Math.floor(Math.random()*f.length)];t=$('<div class="snowflake" data-size="'+(Math.floor(Math.random()*4)+1)+'">'+n+"</div>");t.css({position:"absolute",top:Math.floor(Math.random()*c),left:Math.floor(Math.random()*h),opacity:0});e.append(t);s+=100;return setTimeout(function(){return t.css("opacity",.5)},s)};r=function(){return $('<div class="snowflakes"/>')};n=[r(),r()];t=0;u=$("#main");for(p=0,v=n.length;p<v;p++){e=n[p];e.css({position:"absolute",top:t,left:0,width:h,height:c});t-=c;for(o=d=0;d<=30;o=++d)i(e);u.append(e)}(a=function(){var t,r,i;for(r=0,i=n.length;r<i;r++){e=n[r];t=parseInt(e.css("top"));e.css({top:t>=c?-c:t+1})}return setTimeout(a,100)})()}).call(this);