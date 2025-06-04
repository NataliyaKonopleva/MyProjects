package ru.nkonopleva.ballofwishes;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.se.omapi.Reader;
import android.view.View;
import android.view.ViewDebug;
import android.widget.TextView;
import java.util.Random;

public class MainActivity extends AppCompatActivity {
 private Random sl = new Random();
 private MediaPlayer sound;
 String str [] = {"да","очень вероятно","безусловно","без сомнений","должно быть так","абсолютно точно",
         "мне кажется да","духи говорят да","похоже, что да","нет","звезды говорят,нет","и не надейтесь",
         "спросите снова","не могу сказать","ответ не ясен","вряд ли","спросите позже","мало шансов","не похоже"
 };
 private TextView mHelloTextView;
 private  final  static  String  PROPS_FILE = "email.properties";
 @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mHelloTextView = findViewById(R.id.textView);
        sound = MediaPlayer.create(this,R.raw.zvuk);
        //Integer i = sl.nextInt(10);
        //str = String.valueOf(sl.nextInt(10));
        //mHelloTextView.setText("Задай вопрос и жми!");
    }

    public void onClick(View view) {
     mHelloTextView.setText(str[sl.nextInt(18)]);
     sound.start();
    }
}
