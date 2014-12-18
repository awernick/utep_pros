$(function() {
 $('#homepage-slides').slidesjs({
 	play: {
 	interval: 4000,
 	auto: true,
 	effect: "fade"
 	},
   width: 1000,
   height: 420,
   navigation: {
     	active: false
   },
   pagination: {
   	active: false,
     	effect: "fade"
   },
   effect: {
     fade: {
       speed: 800
     }
   }
 });
});