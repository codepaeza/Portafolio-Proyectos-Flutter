package com.edwinpaezalonso.arquitectura_android_analisis.view

//import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import android.util.Log
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import com.edwinpaezalonso.arquitectura_android_analisis.R
import com.edwinpaezalonso.arquitectura_android_analisis.model.ApiAdapter
import com.edwinpaezalonso.arquitectura_android_analisis.model.Coupon
import com.edwinpaezalonso.arquitectura_android_analisis.viewmodel.CouponViewModel
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class MainActivity : AppCompatActivity(){
    private var couponViewModel: CouponViewModel?=null
    //private var rvCoupons:RecyclerView?=null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        supportActionBar?.hide()
        //VIEW
        setupBindings(savedInstanceState)
    }
    fun setupBindings(savedInstanceState: Bundle?){
        var activityMainBinding: com.edwinpaezalonso.arquitectura_android_analisis.databinding.ActivityMainBinding
        =DataBindingUtil.setContentView(this,R.layout.activity_main)

        couponViewModel=ViewModelProviders.of(this).get(CouponViewModel::class.java)
        activityMainBinding.setModel(couponViewModel)
        setupListUpdate()
    }
    fun setupListUpdate(){

        //call coupons
        couponViewModel?.callCoupons()
        //get copupons - Lista de cupones
        couponViewModel?.getCoupons()?.observe(this, Observer{
            coupons:List<Coupon>->
            Log.w("COUPON", coupons.get(0).title)
            couponViewModel?.setCouponsInRecyclerAdapter(coupons)
        })

    }

}