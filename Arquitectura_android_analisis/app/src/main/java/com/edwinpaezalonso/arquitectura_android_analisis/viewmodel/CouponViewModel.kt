package com.edwinpaezalonso.arquitectura_android_analisis.viewmodel

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.edwinpaezalonso.arquitectura_android_analisis.R
import com.edwinpaezalonso.arquitectura_android_analisis.model.Coupon
import com.edwinpaezalonso.arquitectura_android_analisis.model.CouponObservable
import com.edwinpaezalonso.arquitectura_android_analisis.view.RecyclerCouponsAdapter

class CouponViewModel : ViewModel() {
    private var couponObservable: CouponObservable = CouponObservable()
    private var recyclerCouponsAdapter:RecyclerCouponsAdapter?=null
        fun callCoupons() {
            couponObservable.callCoupons()
        }
    fun getCoupons():MutableLiveData<List<Coupon>>{
        return couponObservable.getCoupons()
    }
    fun setCouponsInRecyclerAdapter(coupons:List<Coupon>){
        recyclerCouponsAdapter?.setCouponsList(coupons)
        recyclerCouponsAdapter?.notifyDataSetChanged()
    }
    fun getRecyclerCouponsAdapter():RecyclerCouponsAdapter?{
        recyclerCouponsAdapter=RecyclerCouponsAdapter(this, R.layout.card_coupon)
        return recyclerCouponsAdapter

    }
    fun getCouponAt(position:Int):Coupon?{
        var coupons: List<Coupon>?=couponObservable.getCoupons().value
        return coupons?.get(position)
    }
    }
