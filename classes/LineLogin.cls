public with sharing class LineLogin extends LineBase {
	public String redirectUrl { get ; set; }
	public String userId { get; set; }
	public String displayName { get; set; }

	public LineLogin() {
		redirectUrl = REDIRECT_URL;
		userId = null;
		displayName = null;
		if( ApexPages.currentPage().getParameters().get('code') != null ){
			String codeStr = ApexPages.currentPage().getParameters().get('code');
			exGetAccessToken(codeStr);
		}
	}

	public void exGetAccessToken(String codeStr){
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setEndpoint(LINE_OAUTH_ACCESSTOKEN);
        req.setMethod('POST');

        String bodyStr = 'grant_type=authorization_code';
        bodyStr += '&code='+ codeStr;
        bodyStr += '&client_id='+ CLIEN_ID;
        bodyStr += '&client_secret='+ CLIEN_SECRET;
        bodyStr += '&redirect_uri='+ REDIRECT_URL;
        req.setBody(bodyStr);
		Http http = new Http();
		HTTPResponse res = http.send(req);
        Map<String, Object> accessTokenParams = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        String accessToken = (String)accessTokenParams.get('access_token');

        HttpRequest profileReq = new HttpRequest();
        profileReq.setEndpoint(LINE_GET_PROFILE_URI);
        profileReq.setHeader('Authorization', 'Bearer '+ accessToken);
        profileReq.setMethod('GET');
		http = new Http();
		HTTPResponse profileRes = http.send(profileReq);
        Map<String, Object> profileParams = (Map<String, Object>)JSON.deserializeUntyped(profileRes.getBody());
        userId = (String)profileParams.get('userId');
        displayName = (String)profileParams.get('displayName');
	}
}