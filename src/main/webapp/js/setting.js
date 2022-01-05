


function backgroundSet(background) {
                    		$('body').css("background", background);
                    		$('#write_page').css("background", background);
                    		$('#show_page').css("background", background);
                    		$('#write_page').css("background",background);
                    		$('#reply_page').css("background",background);
                    		$('#sticker_page').css("background",background);
                    		$('.manager_form_input').css("background", background);
                    		$('.manger_view_btn').css("background", background);
                    		$('.view_input2').css("background", background);
                    		console.log($('.hidden'))
                    		console.log($('.hidden').val())
                    		$('.hidden + *').css("background", $(this).prev().val())
                    	}
function font_sizing(font_size) {
						const content = parseInt(16) + parseInt(font_size);
						const semi = 20 + parseInt(font_size);
						const tit = 25 + parseInt(font_size);
						$('.content_font_size').css("font-size",content+"px");
						$('.semi_tit_font_size').css("font-size",semi+"px");
						$('.title_font_size').css("font-size",tit+"px");
					}
function font_style(font_style_result) {
						$('body').css("font-family",font_style_result);
					}  
$(function() {
	const fontSize = sessionStorage.getItem("fontSize");
	const fontStyle = sessionStorage.getItem("fontStyle");
	const backgroundColor = sessionStorage.getItem("backgroundColor");
	console.log(fontSize);
	console.log(fontStyle);
	console.log(backgroundColor);
	font_style(fontStyle);
	font_sizing(fontSize);   
	backgroundSet(backgroundColor);
});
