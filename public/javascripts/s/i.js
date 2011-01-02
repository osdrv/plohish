var _ = function(v) { return (v === undefined)? nil: v }

function auth() {
	VK.init(function() {
		var user = {}
		VK.api('getUserInfoEx', { format: 'json', test_mode: 1 }, function(r) {
			var response, name, fields = ['uid', 'first_name', 'last_name', 'sex', 'city', 'country', 'photo']
			if (r.response !== undefined && r.response.user_id !== undefined) {
				VK.api('getProfiles', { uids: r.response.user_id, fields: fields.join(','), test_mode: 1 }, function(r2) {
					if (r2 !== undefined && r2.response !== undefined) {
						response = r2.response[0]
						$.post('/auth', {user: response}, function() { window.location.reload() });
					}
				})
			}
		})
	})
}

function init(auth_url) {
	VK.init(function() {
		$('#oversight_text').smart_input({ emptyCss: { color: "#A0A0A0" }, element_class: 'active'})
	})	
}
