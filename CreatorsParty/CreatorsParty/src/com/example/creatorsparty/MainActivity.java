package com.example.creatorsparty;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.KeyEvent;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;


@SuppressLint("SetJavaScriptEnabled")
public class MainActivity extends Activity {

	WebView webView;
	String url = "http://1-dot-borderless-respect-526.appspot.com/";
	
	Activity activity;
	ProgressDialog dialog;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.layout_main);
		
		activity = this;
		
		webView = (WebView) findViewById(R.id.webView);
		
		webView.setWebViewClient(new WebBrowserClient());
		
		WebSettings settings = webView.getSettings();
		settings.setUseWideViewPort(false);
		settings.setSupportZoom(false);
		settings.setBuiltInZoomControls(false);
		settings.setJavaScriptEnabled(true);
		
		webView.loadUrl(url);
	}

	class WebBrowserClient extends WebViewClient {
		public boolean shouldOverrideUrlLoading(WebView view, String url){
			view.loadUrl(url);
			return true;
		}
		public void onPageStarted(WebView view, String url){
			if(dialog == null){
				dialog = new ProgressDialog(activity);
				dialog.setMessage("Loading");
				dialog.show();
			}
		}
		
		public void onPageFinished(WebView view, String url){
			if(dialog != null){
				dialog.dismiss();
				dialog = null;
			}
		}
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if(keyCode == KeyEvent.KEYCODE_BACK){
			if(webView.canGoBack()){
				webView.goBack();
				return false;
			}
			else{
				Toast.makeText(this, "더이상 뒤로 갈 수 없습니다.", Toast.LENGTH_SHORT).show();
				return false;
			}
		}
		return super.onKeyDown(keyCode, event);
	}
	
	
}
