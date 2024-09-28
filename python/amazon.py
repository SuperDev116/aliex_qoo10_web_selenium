import requests
import json
import time
from selenium import webdriver
from tkinter import messagebox
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
import mysql.connector
from mysql.connector import Error
from datetime import datetime


BASE_URL = 'https://www.amazon.co.jp/-/ja/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.co.jp%2Fref%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=jpflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0'
PRODUCT_URL = 'https://www.amazon.co.jp/dp/'

def get_user_id():
    with open('account.ini', 'r') as file:
        return file.read()
USER_ID = get_user_id()
print(f"USER_ID _____ _____ _____ {USER_ID}")


def get_setting_value():
    try:
        setting_api_url = f'https://amazonqoo10main.com/api/v1/get_setting_value'
        # setting_api_url = f'http://localhost:8000/api/v1/get_setting_value'
        payload = {
            'user_id': USER_ID
        }
        headers = {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
        
        response = requests.post(setting_api_url, headers=headers, data=payload)
        
        return json.loads(response.text)[0]
    except:
        messagebox.showwarning("警告", "出品設定情報がありません。\nまずは出品設定情報を設定ください。")
        
SETTING_VALUE = get_setting_value()
    
print(f"SETTING_VALUE _____ _____ _____ {SETTING_VALUE}")


def save_product(product):
    setting_api_url = f'https://amazonqoo10main.com/api/v1/save_products'
    # setting_api_url = f'http://localhost:8000/api/v1/save_products'
    payload = {
        'user_id': USER_ID,
        'product': product,
    }
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
    }
    
    response = requests.post(setting_api_url, headers=headers, data=payload)
    return json.loads(response.text)[0]


def scraping():
    if SETTING_VALUE == None:
        messagebox.showwarning("警告", "出品設定情報がありません。\nまずは出品設定情報を設定ください。")
        return
    
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get(BASE_URL)
    
    id_bar = driver.find_element(By.ID, 'ap_email')
    id_bar.send_keys(SETTING_VALUE['amazon_email'])
    
    id_button = driver.find_element(By.ID, 'continue')
    id_button.click()
    
    password_bar = driver.find_element(By.ID, 'ap_password')
    password_bar.send_keys(SETTING_VALUE['amazon_password'])
    
    signin_button = driver.find_element(By.ID, 'signInSubmit')
    signin_button.click()
    time.sleep(60)
    
    exhi_asins = SETTING_VALUE['exhi_asins'].split('\r\n')
    if SETTING_VALUE['ng_asins']:
        ng_asins = SETTING_VALUE['ng_asins'].split('\r\n')
        
    if SETTING_VALUE['ng_words']:
        ng_words = SETTING_VALUE['ng_words'].split('\r\n')
    
    for asin in exhi_asins:
        if ng_asins and asin in ng_asins:
            continue
        # try:
        driver.get(PRODUCT_URL + asin)
        time.sleep(3)
        
        # -------------------------
        # asin validation
        # -------------------------
        try:
            driver.find_element(By.XPATH, "//b[contains(text(), '何かお探しですか？')]")
            print(f"{asin} _____ _____ _____ This is a valid asin!")
        except NoSuchElementException:
            print(f"{asin} _____ _____ _____ This is an invalid asin!")
            continue
        
        # -------------------------
        # prime eligible
        # -------------------------
        try:
            prime_elmnt = driver.find_element(By.XPATH, "//div[@id='shippingMessageInsideBuyBox_feature_div']")
            is_prime = prime_elmnt.find_element(By.CSS_SELECTOR, ".a-icon.a-icon-prime")
            print(f"{asin} _____ _____ _____ This product is prime eligible product.")
        except NoSuchElementException:
            print(f"{asin} _____ _____ _____ This product is not prime eligible product.")
            continue
        
        # -------------------------
        # free shipping information
        # -------------------------
        try:
            shipping_elmnt = driver.find_element(By.ID, "mir-layout-DELIVERY_BLOCK")
            free_shipping_span = shipping_elmnt.find_elements(By.XPATH, "//span[contains(text(),'無料配送')]")
            print(f"{asin} _____ _____ _____ This product is eligible for free shipping.")
        except NoSuchElementException:
            print(f"{asin} _____ _____ _____ This product is not eligible for free shipping.")
            continue
        
        # -------------------------
        # stock information
        # -------------------------
        try:
            stock_elmnt = driver.find_element(By.ID, "outOfStock")
            out_of_stock_span = stock_elmnt.find_element(By.XPATH, "//span[contains(text(),'現在在庫切れです。')]")
            print(f"{asin} _____ _____ _____ This product is out of stock.")
            continue
        except NoSuchElementException:
            print(f"{asin} _____ _____ _____ This product is in stock.")
        
        product_info = {}
        
        product_info['user_id'] = USER_ID
        product_info['asin'] = asin
        product_info['is_prime'] = 1
        product_info['url'] = PRODUCT_URL + asin
        
        print(f"url _____ _____ _____ {product_info['url']}")
        
        # -------------------------
        # quantity
        # -------------------------
        try:
            qty_elmnt = driver.find_element(By.ID, 'quantity')
            qty_options = qty_elmnt.find_elements(By.TAG_NAME, "option")
            product_info['quantity'] = len(qty_options)
        except NoSuchElementException:
            product_info['quantity'] = 1
        print(f"quantity _____ _____ _____ {product_info['quantity']}")
        
        # -------------------------
        # title
        # -------------------------
        title_text = driver.find_element(By.ID, 'productTitle').text
        product_info['title'] = title_text
        
        if ng_words:
            for ng_word in ng_words:
                if ng_word in title_text:
                    product_info['title'] = title_text.replace(ng_word, "")
                    
        print(f"title _____ _____ _____ {product_info['title']}")
        
        # -------------------------
        # main image url
        # -------------------------
        img_ul = driver.find_element(By.CSS_SELECTOR, ".a-unordered-list.a-nostyle.a-horizontal.list.maintain-height")
        image_main_li = img_ul.find_element(By.ID, "imgTagWrapperId")
        image_main_tag = image_main_li.find_element(By.TAG_NAME, 'img')
        product_info['img_url_main'] = image_main_tag.get_attribute('src')
        # product_info['img_url_main'] = image_main.replace("US40", "SL875")
        
        print(f"main image url _____ _____ _____ {product_info['img_url_main']}")
        
        # -------------------------
        # thumb image url
        # -------------------------
        image_li = driver.find_elements(By.CSS_SELECTOR, "li.imageThumbnail")
        image_li_count = len(image_li)
        image_other = []
        
        for x in range(image_li_count):
            image_other_li = driver.find_element(By.XPATH, f"//li[@data-csa-c-posy='{x+1}']")
            image_other_tag = image_other_li.find_element(By.TAG_NAME, 'img')
            image_other_src = image_other_tag.get_attribute('src').replace("US40", "SL875")
            image_other.append(image_other_src)
            
        product_info['img_url_thumb'] = image_other
        
        print(f"thumb image url _____ _____ _____ {product_info['img_url_thumb']}")
        
        # -------------------------
        # price
        # -------------------------
        try:
            price_el = driver.find_element(By.CSS_SELECTOR, 'span[class="a-offscreen"]')
            price_text = price_el.get_attribute('innerHTML')
            price_value = int(price_text.replace("￥","").replace(",",""))
            product_info['r_price'] = int(round(price_value, 2))
            product_info['price'] = int(round(price_value, 2))
            print(f"price _____ _____ _____ {product_info['price']}")
        except NoSuchElementException:
            print(f"{asin} _____ _____ _____ Cannot get the price information of this product.")
            continue
        
        # -------------------------
        # category
        # -------------------------
        product_info['category'] = SETTING_VALUE['qoo_smallcategory']
        print(f"category _____ _____ _____ {product_info['category']}")
        
        # -------------------------
        # description
        # -------------------------
        try:
            description_div = driver.find_element(By.ID, 'productDescription_feature_div')
            product_info['description'] = description_div.text.strip()
            if product_info['description'] == "":
                product_info['description'] = "商品の説明"
            try:
                a_note = description_div.find_element(By.TAG_NAME, 'a')
                text_note = a_note.text
                product_info['description'] = product_info['description'].replace(text_note, "")
            except NoSuchElementException:
                pass
        except NoSuchElementException:
            product_info['description'] = "商品の説明"
            
        print(f"description _____ _____ _____ {product_info['description']}")
        
        # -------------------------
        # origin
        # -------------------------
        try:
            product_info['origin'] = ""
            origin_el = driver.find_elements(By.XPATH, "//span[contains(text(),'原産国')]")
            origin_th = driver.find_elements(By.XPATH, "//th[contains(text(),'原産国')]")
            
            if len(origin_el) > 0:
                origin_el = driver.find_element(By.XPATH, "//span[contains(text(),'原産国')]")
                
                if ':' in origin_el.text:
                    origin = origin_el.text.split(':')[1].strip()
                    if origin == '':
                        next_span = origin_el.find_element(By.XPATH, "following-sibling::span[1]")
                        origin = next_span.text.strip()
                elif '：' in origin_el.text:
                    origin = origin_el.text.split('：')[1].strip()
                elif '】' in origin_el.text:
                    origin = origin_el.text.split('】')[1].strip()
                else:
                    ancestor_th_el = origin_el.find_element(By.XPATH, './ancestor::th[1]')
                    next_td = ancestor_th_el.find_element(By.XPATH, "following-sibling::td[1]")
                    origin = next_td.text
                product_info['origin'] = origin
            elif len(origin_th) > 0:
                origin_th = driver.find_element(By.XPATH, "//th[contains(text(),'原産国')]")
                td_text = origin_th.find_element(By.XPATH, "./following-sibling::td").text
                product_info['origin'] = td_text.strip()
            else:
                product_info['origin'] = "日本"
        except NoSuchElementException:
            product_info['origin'] = ""
            
        print(f"origin _____ _____ _____ {product_info['origin']}")
        
        # -------------------------
        # weight
        # -------------------------
        try:
            product_info['weight'] = ""
            productDetails_table=driver.find_element(By.ID, 'productDetails_techSpec_section_1')
            th_tags = productDetails_table.find_elements(By.TAG_NAME, "th")
            
            for th_tag in th_tags:
                if "梱包サイズ" or "製品サイズ" in th_tag.text:
                    td_text = th_tag.find_element(By.XPATH, "./following-sibling::td").text
                    
                    if ";" in td_text:
                        td_details = td_text.split(";")
                        packing_weight = td_details[1].strip()
                        
                        if 'kg' in packing_weight:
                            product_info['weight'] = packing_weight.replace("kg", "").strip()
                            product_info['weight'] = float(product_info['weight'])
                        else:
                            packing_weight = packing_weight.replace("g", "").strip()
                            
                            if '.' in packing_weight:
                                packing_weight = packing_weight.split('.')[0]
                                packing_weight = int(packing_weight)
                            else:
                                packing_weight = int(packing_weight)
                            product_info['weight'] = round(packing_weight / 1000, 2)
                            product_info['weight'] = float(product_info['weight'])
                    else:
                        packing_size = td_text
        except NoSuchElementException:
            product_info['weight'] = ""
        
        print(f"weight _____ _____ _____ {product_info['weight']}")
        
        # -------------------------
        # material
        # -------------------------
        try:
            material_el = driver.find_element(By.CSS_SELECTOR, ".po-material_feature")
            material_span = material_el.find_elements(By.TAG_NAME, 'span')
            product_info['material'] = material_span[1].text.strip()
        except NoSuchElementException:
            product_info['material'] = ""
            
        print(f"material _____ _____ _____ {product_info['material']}")
        
        # -------------------------
        # others
        # -------------------------
        product_info['exhibit'] = 1
        product_info['reason'] = ''
        
        # except:
        #     pass
        
        save_product(product_info)
        
    driver.quit()
    
    messagebox.showinfo("OK", "スクレイピング完了しました。")
    
    
def get_past_products():
    product_api_url = f'https://amazonqoo10main.com/api/v1/get_products'
    # product_api_url = f'http://localhost:8000/api/v1/get_products'
    payload = {
        'user_id': USER_ID
    }
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
    }
    
    response = requests.post(product_api_url, headers=headers, data=payload)
    return json.loads(response.text)
    
    
def checking_price_stock():
    if SETTING_VALUE == None:
        messagebox.showwarning("警告", "出品設定情報がありません。\nまずは出品設定情報を設定ください。")
        return
    
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get('https://www.amazon.co.jp/-/ja/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.co.jp%2Fref%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=jpflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0')
    time.sleep(3)
    
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get(BASE_URL)
    
    id_bar = driver.find_element(By.ID, 'ap_email')
    id_bar.send_keys(SETTING_VALUE['amazon_email'])
    
    id_button = driver.find_element(By.ID, 'continue')
    id_button.click()
    
    password_bar = driver.find_element(By.ID, 'ap_password')
    password_bar.send_keys(SETTING_VALUE['amazon_password'])
    
    signin_button = driver.find_element(By.ID, 'signInSubmit')
    signin_button.click()
    time.sleep(60)
    
    exhibited_data = get_past_products()
    if not exhibited_data:
        messagebox.showwarning("警告", "出品されている商品がありません。")
        return
    
    for exhibited_datum in exhibited_data:
        try:
            driver.get(exhibited_datum['url'])
            time.sleep(3)
            
            try:
                price_el = driver.find_element(By.CSS_SELECTOR, 'span[class="a-offscreen"]')
                price_text = price_el.get_attribute('innerHTML')
                price_value = int(price_text.replace("￥","").replace(",",""))
                print(f"price _____ _____ _____ {price_value}")
                
                r_price = exhibited_datum['r_price']
                
                if not r_price == price_value:
                    print(f"There is a difference between original price _____ {r_price} and current price _____ {price_value}.")
                    
                    email = SETTING_VALUE['alert_email']
                    url = "https://qoo10manageable.info/api/v1/alert_mail"
                    
                    payload = {
                        'to': email,
                        "product": exhibited_datum,
                        "price": price_value
                    }
                    headers = {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                    response = requests.post(url, headers=headers, data=payload)
                    print(response.text)
                    time.sleep(3)
            except NoSuchElementException:
                print("This product has no price information.")
                continue
            
            try:
                stock_elmnt = driver.find_element(By.ID, "outOfStock")
                out_of_stock_span = stock_elmnt.find_element(By.XPATH, "//span[contains(text(),'現在在庫切れです。')]")
                print(f"This product is out of stock.")
                
                email = SETTING_VALUE['alert_email']
                url = "https://qoo10manageable.info/api/v1/alert_mail"
                
                payload = {
                    'to': email,
                    "product": exhibited_datum,
                    "price": price_value,
                    "quantity": 0
                }
                headers = {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
                response = requests.post(url, headers=headers, data=payload)
                print(response.text)
                time.sleep(3)
                continue
            except NoSuchElementException:
                print(f"This product is in stock.")
                
        except:
            pass
        
        messagebox.showinfo("OK", "価格在庫確認完了しました。")
        
        
if __name__ == "__main__":
    scraping()