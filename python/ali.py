import requests
import json
import time
import pyautogui
import pyperclip
import re
from selenium import webdriver
from tkinter import messagebox
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException


SERVER_URL = 'https://aliexqoo10.com'
# SERVER_URL = 'http://localhost:8000'

def get_user_id():
    with open('account.ini', 'r') as file:
        return file.read()
USER_ID = get_user_id()
print(f"USER_ID _____ _____ _____ {USER_ID}")


def get_setting_value():
    try:
        setting_api_url = f'{SERVER_URL}/api/v1/get_setting_value'
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


def save_product(product):
    save_api_url = f'{SERVER_URL}/api/v1/save_products'
    headers = {
        'Content-Type': 'application/json'
    }
    response = requests.post(save_api_url, headers=headers, json=product)
    print(response.text)
    return


def scraping():
    SETTING_VALUE = get_setting_value()
    if SETTING_VALUE == None:
        messagebox.showwarning("警告", "出品設定情報がありません。\nまずは出品設定情報を設定ください。")
        return
    
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get('https://ja.aliexpress.com/')
    time.sleep(3)
    
    target_url = SETTING_VALUE['ali_smallcategory']
    driver.get(target_url)
    time.sleep(3)
    
    root_div = driver.find_element(By.ID, 'root')
    
    fee_free_span = root_div.find_element(By.XPATH, '//span[contains(text(), "送料無料")]')
    fee_free_span.click()
    time.sleep(3)

    products_url = []
    try:
        pagination_ul = root_div.find_element(By.CLASS_NAME, 'comet-pagination')

        if pagination_ul:

            for i in range(1):
                
                pyautogui.hotkey('ctrl', 'f')
                time.sleep(2)
                pyperclip.copy('確認する')
                time.sleep(2)
                # pyperclip.paste()
                pyautogui.hotkey('ctrl', 'v')
                time.sleep(2)
                pyautogui.press('enter')
                time.sleep(2)
                pyautogui.press('esc')
                time.sleep(2)

                page_number = 'comet-pagination-item-' + str(i + 1)
                try:
                    pagination_li = pagination_ul.find_element(By.CLASS_NAME, page_number)
                    pagination_li.click()
                    time.sleep(5)

                    product_divs = root_div.find_elements(By.CLASS_NAME, 'list--gallery--C2f2tvm')

                    for p_div in product_divs:
                        p_url = p_div.find_element(By.TAG_NAME, 'a').get_attribute('href')
                        products_url.append(p_url)
                except:
                    pass                
    except NoSuchElementException:
        print('No pagination found')
        
        product_divs = root_div.find_elements(By.CLASS_NAME, 'list--gallery--C2f2tvm')

        for p_div in product_divs:
            p_url = p_div.find_element(By.TAG_NAME, 'a').get_attribute('href')
            products_url.append(p_url)
        time.sleep(1)

    index = 1
    
    for p_url in products_url:
        try:            
            driver.get(p_url)
            time.sleep(30)
            
            product_info = {}
            
            # -------------------------
            # shipping 
            # ------------------------- 
            product_info['shipping'] = driver.find_element(By.CSS_SELECTOR, 'div.dynamic-shipping').text
            print(f'shipping _____ _____ _____ {product_info["shipping"]}')
            
            if ('で送料無料' in product_info['shipping']):
                print('conditional free _____ _____ _____ exit')
                continue
            
            # -------------------------
            # quantity 
            # ------------------------- 
            qty_str = driver.find_element(By.CSS_SELECTOR, 'div[class*="quantity--info"]').text
            product_info['quantity'] = int(re.findall(r'\d+', qty_str.replace(',', ''))[0])
            print(f'quantity _____ _____ _____ {product_info["quantity"]}')
            
            # -------------------------
            # url 
            # ------------------------- 
            product_info['url'] = driver.find_element(By.XPATH, '//meta[@property="og:url"]').get_attribute('content')
            print(f'url _____ _____ _____ {product_info["url"]}')
            
            # -------------------------
            # title 
            # ------------------------- 
            product_info['title'] = driver.find_element(By.XPATH, '//meta[@property="og:title"]').get_attribute('content')
            print(f'title _____ _____ _____ {product_info["title"]}')
            
            # -------------------------
            # img_url_main 
            # ------------------------- 
            product_info['img_url_main'] = driver.find_element(By.XPATH, '//meta[@property="og:image"]').get_attribute('content')
            print(f'img_url_main _____ _____ _____ {product_info["img_url_main"]}')
            
            # -------------------------
            # img_url_thumb 
            # ------------------------- 
            info_div = driver.find_element(By.CSS_SELECTOR, 'div.pdp-info')
            img_div = info_div.find_elements(By.CSS_SELECTOR, 'div[class*="slider--item"]')
            
            product_info['img_url_thumb'] = []
            for i_div in img_div:
                img_url = i_div.find_element(By.TAG_NAME, 'img').get_attribute('src')
                product_info['img_url_thumb'].append(img_url)
                print(f'img_url_thumb _____ _____ _____ {product_info["img_url_thumb"]}')
                
            # -------------------------
            # price 
            # ------------------------- 
            try:
                price_str = info_div.find_element(By.CSS_SELECTOR, 'span[class*="price--originalText"]').text
                product_info['r_price'] = int(re.findall(r'\d+', price_str.replace(',', ''))[0])
                product_info['price'] = product_info['r_price']
                print(f'price _____ _____ _____ {product_info["price"]}')
            except:
                print('price _____ _____ _____ error!!!')
                continue
            
            # -------------------------
            # category 
            # ------------------------- 
            product_info['category'] = SETTING_VALUE['qoo_smallcategory']
            print(f'category _____ _____ _____ {product_info["category"]}')
            
            # -------------------------
            # description 
            # ------------------------- 
            nav_div = driver.find_element(By.XPATH, '//div[@id="nav-description"]')
            try:
                load_more_btn = nav_div.find_element(By.XPATH, "//span[text()='さらに表示']")
                load_more_btn.click()
            except:
                print('There is no さらに表示 button')
                
            spec_div = driver.find_element(By.ID, 'nav-specification')
            try:
                load_more_btn = spec_div.find_element(By.XPATH, "//span[text()='さらに表示']")
                load_more_btn.click()
            except:
                print('There is no さらに表示 button')
                
            product_info['description'] = nav_div.find_element(By.XPATH, './div[2]').text
            print(f'description _____ _____ _____ {product_info["description"]}')
            
            # -------------------------
            # extra 
            # ------------------------- 
            def reFunc(key, pattern1, pattern2):
                product_info[key] = ''
                try:
                    product_info[key] = re.findall(pattern1, product_info['description'])[0][1]
                    print(f'{key} _____ _____ _____ {product_info[key]}')
                except:
                    print(f'{key} _____ _____ _____ There is no {key} information in description.')
                    
                if product_info[key] == '':
                    try:
                        keyword = re.findall(pattern2, spec_div.text)[0]
                        print(f'{key}_word', keyword)
                        if keyword:
                            keyspan = spec_div.find_element(By.XPATH, f"//span[text()='{keyword}']")
                            keydiv = keyspan.find_element(By.XPATH, '../..')
                            product_info[key] = keydiv.find_element(By.XPATH, './div[2]/span').text
                            print(f'{key} _____ _____ _____ {product_info[key]}')
                    except:
                        print(f'{key} _____ _____ _____ There is no {key} information in description.')
            
            reFunc('color', r"(色|カラー|color):\s*(.*)", r".*色.*|.*カラー.*|.*color.*")
            reFunc('size', r"(サイズ|size):\s*(.*)", r".*サイズ.*|.*size.*")
            reFunc('weight', r"(重量|重さ|weight):\s*(.*)", r".*重量.*|.*重さ.*|.*weight.*")
            reFunc('material', r"(素材|材料|material):\s*(.*)", r".*素材.*|.*材料.*|.*material.*")
            reFunc('origin', r"(起源|origin):\s*(.+)", r".*起源.*|.*origin.*")
            
            product_info['user_id'] = USER_ID
            product_info['exhibit'] = 1
            product_info['reason'] = ''
            product_info['id'] = index
            index += 1
            
            time.sleep(3)                
            
            save_product(product_info)
        except:
            pass
            
    driver.quit()
    
    messagebox.showinfo("OK", "スクレイピング完了しました。")
    
    
def get_past_products():
    product_api_url = f'{SERVER_URL}/api/v1/get_products'
    payload = {
        'user_id': USER_ID
    }
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
    }
    
    response = requests.post(product_api_url, headers=headers, data=payload)
    return json.loads(response.text)
    
    
def checking_price_stock():
    SETTING_VALUE = get_setting_value()
    if SETTING_VALUE == None:
        messagebox.showwarning("警告", "出品設定情報がありません。\nまずは出品設定情報を設定ください。")
        return
    
    exhibited_data = get_past_products()
    if not exhibited_data:
        messagebox.showwarning("警告", "出品されている商品がありません。")
        return
    
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get('https://ja.aliexpress.com/')
    time.sleep(3)
    
    for exhibited_datum in exhibited_data:
        try:
            driver.get(exhibited_datum['url'])
            time.sleep(3)
            
            # check price
            info_div = driver.find_element(By.CSS_SELECTOR, 'div.pdp-info')
            price_str = info_div.find_element(By.CSS_SELECTOR, 'span[class*="price--originalText"]').text
            price = int(re.findall(r'\d+', price_str.replace(',', ''))[0])
            print(f"price _____ _____ _____ {price}")
            
            r_price = exhibited_datum['r_price']
            
            if not r_price == price:
                print(f"There is a difference between original price _____ {r_price} and current price _____ {price}.")
                
                email = SETTING_VALUE['alert_email']
                url = "https://qoo10manageable.info/api/v1/alert_mail"
                
                payload = {
                    'to': email,
                    "product": exhibited_datum,
                    "price": price
                }
                headers = {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
                response = requests.post(url, headers=headers, data=payload)
                print(response.text)
                time.sleep(3)
                
            # check quantity
            quantity = driver.find_element(By.CSS_SELECTOR, 'div[class*="quantity--info"]').text
            print(f'quantity _____ _____ _____ {quantity}')
            
            if quantity == '在庫切れ' or quantity == '在庫なし':
                email = SETTING_VALUE['alert_email']
                url = "https://qoo10manageable.info/api/v1/alert_mail"
                
                payload = {
                    'to': email,
                    "product": exhibited_datum,
                    "price": price,
                    "quantity": 0
                }
                headers = {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
                response = requests.post(url, headers=headers, data=payload)
                print(response.text)
            time.sleep(3)
            continue
        except:
            pass
        
        messagebox.showinfo("OK", "価格在庫確認完了しました。")
        
        
if __name__ == "__main__":
    scraping()