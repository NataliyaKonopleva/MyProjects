package ru.nkonopleva.privetkot;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private TextView mHelloTextView;
    private EditText mNameEditText;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mHelloTextView = findViewById(R.id.textView);
        mNameEditText = findViewById(R.id.editTextTextPersonName2);
    }

    public void onClick(View view) {
        //mHelloTextView.setText("Hello Kitty!");
        if (mNameEditText.getText().length() == 0) {
            mHelloTextView.setText("Привет, Кот!");
        } else {
            mHelloTextView.setText("Привет, " + mNameEditText.getText()+"!");
        }
    }
}