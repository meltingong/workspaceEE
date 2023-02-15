/**
 * 
 */

function guestCreateForm() {
	/*
	document.f.action = 'guest_write_form.jsp';
	document.f.submit();
	*/
	window.location.href='guest_write_form.do';
}
function guestModify() {
	if (document.f.guest_name.value == "") {
		alert("이름을 입력하십시요.");
		document.f.guest_name.focus();
		return;
	}
	if (document.f.guest_email.value == "") {
		alert("이메일을 입력하십시요.");
		document.f.guest_email.focus();
		return;
	}
	if (document.f.guest_homepage.value == "") {
		alert("홈페이지를 입력하십시요.");
		document.f.guest_homepage.focus();
		return;
	}

	if (document.f.guest_title.value == "") {
		alert("제목을 입력하십시요.");
		document.f.guest_title.focus();
		return;
	}
	if (document.f.guest_content.value == "") {
		alert("내용을 입력하십시요.");
		document.f.guest_content.focus();
		return;
	}
	
	document.f.method='POST';
	document.f.action = "guest_modify_action.do";
	document.f.submit();
}

function guestList() {
	window.location.href='guest_list.do';
}

function guestModifyForm() {
	document.f.action = "guest_modify_form.do";
	document.f.method='POST';
	document.f.submit();
}
function guestRemove() {
	if (window.confirm("정말 삭제하시겠습니까?")) {
		document.f.method='POST';
		document.f.action = "guest_remove_action.do";
		document.f.submit();
	}
}
function guestCreate() {
	if (document.f.guest_name.value == "") {
		alert("이름을 입력하십시요.");
		document.f.guest_name.focus();
		return false;
	}
	if (document.f.guest_email.value == "") {
		alert("이메일을 입력하십시요.");
		document.f.guest_email.focus();
		return false;
	}
	if (document.f.guest_homepage.value == "") {
		alert("홈페이지를 입력하십시요.");
		document.f.guest_homepage.focus();
		return false;
	}

	if (document.f.guest_title.value == "") {
		alert("제목을 입력하십시요.");
		document.f.guest_title.focus();
		return false;
	}
	if (document.f.guest_content.value == "") {
		alert("내용을 입력하십시요.");
		document.f.guest_content.focus();
		return false;
	}
	document.f.action = "guest_write_action.do";
	document.f.method='POST';
	document.f.submit();
}
