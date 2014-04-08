package com.example.buttoncallback;

import com.example.buttoncallback.R.string;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;


public class MainActivity extends Activity {
	EditText editText01;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		editText01 = (EditText)findViewById(R.id.EditText01);
		
		Button button01 = (Button) findViewById(R.id.Button01);
		button01.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				editText01.setText(string.first);
			}
		});
		
		Button button02 = (Button) findViewById(R.id.Button02);
		button02.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				editText01.setText(string.second);
			}
		});
		
		Button button03 = (Button) findViewById(R.id.Button03);
		button03.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				editText01.setText(string.third);
			}
		});
		
		Button button04 = (Button) findViewById(R.id.Button04);
		button04.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				editText01.setText(string.fourth);
			}
		});
		
		Button button05 = (Button) findViewById(R.id.Button05);
		button05.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				editText01.setText(string.fifth);
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
