import tkinter as tk
import threading
from datetime import datetime
from tkinter import messagebox
from amazon import scraping, checking_price_stock


status = {}
    
def run_scraping_in_thread():
    threading.Thread(target=scraping).start()
    
def run_checking_price_stock_in_thread():
    threading.Thread(target=checking_price_stock).start()
    
def draw_main_window():
    setting_window = tk.Tk()
    setting_window.title('Amazon→Qoo10出品ツール')
    setting_window.geometry('500x300')

    lbl_title = tk.Label(
        text='Amazon→Qoo10出品ツール',
        font=('Arial', 24)
    )
    lbl_title.pack()
    lbl_title.place(x=50, y=50)
    
    # Amazonスクレイピング
    btn_combined_sale = tk.Button(
        setting_window,
        text='AMAZON\nスクレイピング',
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
    
    
if __name__ == '__main__':
    specific_date = datetime(2024, 9, 30)
    current_date = datetime.now()

    if specific_date < current_date:
        print('>>> expired <<<')
    else:
        draw_main_window()