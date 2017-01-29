public with sharing virtual class LineBase {
	public static String LINE_OAUTH_ACCESSTOKEN = 'https://api.line.me/v2/oauth/accessToken';
	public static String LINE_GET_PROFILE_URI = 'https://api.line.me/v2/profile';
	// LINE LoginのBasic InfoのChannel ID
	public static String CLIEN_ID = 'XXXXXXXX';
	// LINE LoginのBasic InfoのChannel Secret
	public static String CLIEN_SECRET ='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
	// LINE LoginのTechnical configurationのCallback URLをURLエンコードしたもの
	public static String REDIRECT_URL = 'https%3A%2F%2FXXXXXXXXXX-developer-edition.ap4.force.com%2FLinePage';
}