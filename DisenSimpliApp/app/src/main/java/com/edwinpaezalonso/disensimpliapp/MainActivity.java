package com.edwinpaezalonso.disensimpliapp;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.pdf.PdfDocument;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.text.DecimalFormat;
import java.util.Date;

public class MainActivity extends AppCompatActivity {
    // Write a message to the database
    FirebaseDatabase database = FirebaseDatabase.getInstance();
    DatabaseReference myRef = database.getReference("record");
    DataObj dataObj=new DataObj();
    Button saveAndPrintButton, printButton;
    EditText editTextName, editTextQty;
    Spinner spinner;
    String[] itemList;
    double[] itemPrice;
    ArrayAdapter<String> adapter;
    long invoiceNo=0;
    DecimalFormat decimalFormat=new DecimalFormat("0.0");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        callFindViewById();
        callOnclickListener();

        myRef.addValueEventListener(new ValueEventListener(){
            @Override
            public void onDataChange(DataSnapshot snapshot){
                invoiceNo=snapshot.getChildrenCount();

            }
            @Override
            public void onCancelled(DatabaseError error) {

            }

        });
    }

    private void callOnclickListener() {
        saveAndPrintButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dataObj.invoiceNo=invoiceNo+1;
                dataObj.customerName=String.valueOf(editTextName.getText());
                dataObj.date=new Date().getTime();
                dataObj.fuelType=spinner.getSelectedItem().toString();
                dataObj.fuelQty=Double.parseDouble(String.valueOf(editTextQty.getText()));
                dataObj.amount=Double.valueOf(decimalFormat.format(dataObj.getFuelQty()*itemPrice[spinner.getSelectedItemPosition()]));

                myRef.child(String.valueOf(invoiceNo+1)).setValue(dataObj);

                printPDF();



            }
        });
    }

    private void printPDF(){
        PdfDocument myPdfDocument=new PdfDocument();
        Paint paint=new Paint();
        PdfDocument.PageInfo myPageInfo=new PdfDocument.PageInfo.Builder(250, 350, 1).create();
        PdfDocument.Page myPage=myPdfDocument.startPage(myPageInfo);
        Canvas canvas=myPage.getCanvas();

        paint.setTextSize(15.5f);
        paint.setColor(Color.rgb(0, 50, 250));

        canvas.drawText("Diseño Eléctrico Simplificado", 20, 20, paint); //https://www.youtube.com/watch?v=hC43GVtPp5E&t=170s   4:30

    }

    private void callFindViewById() {
        saveAndPrintButton=findViewById(R.id.btnSaveAndPrint);
        printButton=findViewById(R.id.btnPrint);
        editTextName=findViewById(R.id.editTextName);
        editTextQty=findViewById(R.id.editTextQty);
        spinner=findViewById(R.id.spinner);

        itemList=new String[]{"Monofásico", "Trifásico"};
        itemPrice=new double[]{7.5, 4.2};
        adapter=new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item,itemList);
        spinner.setAdapter(adapter);


    }
}
