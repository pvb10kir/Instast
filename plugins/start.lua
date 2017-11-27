local function do_keyboard_page()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = '➖ شرایط تبادل', callback_data = '!tab'},
    					},
    					{
{text = '➖ تبلیغات شما', callback_data = '!ads'},
	    },
	{
{text = '➖ کانال ما', url = 'https://t.me/Insta_St'},{text = '➖ گروه ما', url = 'https://t.me/joinchat/DzfXhkSvDr2wf7bF1AhTaA'}
	    },
	{
    		    		{text = '➖ شماره ادمین کانال', callback_data = '!share'},
	    },
	    {
	    {text = '🔙صفحه اول', callback_data = '!home'}
        }
}
    return keyboard
end
local function do_keyboard_ta()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		   {text = '➖ موافقم', callback_data = '/chat'},
	    },
{
	    {text = '🔙', callback_data = '!home'}
        }
}
   return keyboard
end
local function do_keyboard_ads()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
	    {text = '🔙', callback_data = '!page'}
        }
}
   return keyboard
end
local function do_keyboard_tab()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = '➖ شرایط', callback_data = '!ta'},
	    },
	    {
	    {text = '🔙', callback_data = '!page'}
        }
    }
    return keyboard
end
local function do_keyboard_sacc()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = '➖ شرایط', callback_data = '!sac'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_sac()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = '➖ موافقم', callback_data = '/chat'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_flwer()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = '➖ شرایط', callback_data = '!flwe'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_flwe()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = '➖ موافقم', callback_data = '/chat'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_off()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = '➖ خرید 3،6 و 10 کا', callback_data = '!of'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_of()
    local keyboard = {}
    keyboard.inline_keyboard = {
	    {
	    {text = '🔙', callback_data = '!off'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    {
	        {text = '➖ چت با ادمین', callback_data = '/chat'},
        },
  {
	        {text = '➖ خرید فالوور', callback_data = '!flwer'},
        },
 {
	        {text = '➖ فروش اکانت شما', callback_data = '!sacc'},
        },
		{
				{text = '➖ آفر های ویژه', callback_data = '!off'},
	    },
	{
				{text = 'صفحه دوم🔜', callback_data = '!page'},
	    },
	}		
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '📥click', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end


local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[➖ سلام خدمت شما دوست عزیز، به ربات رسمی اینستا استور خوش امدید
			صفحه *1* از *2*]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, '_Hi _*Send Me Start To Private Message*' ,do_keyboard_startme(), true)
        end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'off' then
            local text = [[لیست آفر های ویژه🌟]]
            local keyboard = do_keyboard_off()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'of' then
            local text = [[برای خرید های 3، 6 و 10 کا : (مزایای ویژه)
500 لایک رایگان از سوی ما دریافت میکنید
و آدرس یک سایت خارجی برای دریافت فالوور (هر نیم ساعت یک بار بین 4 - 50 فالوور به صورت شانسی به اکانتتون واریز میکنه)]]
            local keyboard = do_keyboard_of()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'sacc' then
            local text = [[شرایط فروش اکانت شما🌟]]
            local keyboard = do_keyboard_sacc()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'sac' then
            local text = [[به نام خدا، 
			شرایط گذاشتن بنر فروش اکانت اینستاگرام شما در کانال اینستا استور
➖ ابتدا ما به شما یک بنر میدیم شما باید برای اون بنر 150 سین بزنید
➖ اکانت های سیاسی و پورن پذیرفته نمیشوند
➖ 10 درصد پورسانت برای تبلیغی که برای شما میکنیم برداشته میشود و بقیه ی پول اکانت به حساب شما واریز میشود
➖ قیمت اکانت بر اساس لایک و تعداد فالوور توسط کارشناس ما محاسبه میشود و به صورت پیشنهادی به شما قیمت مناسب را برای فروش پیشنهاد میکند (مشاوره)
➖ بنر شما تا زمان فروش در کانال ما باقی خواهد ماند
اگر با این شرایط مخالفتی ندارید بر روی دکمه `"موافقم"` کلیک کنید سپس شما به چت مستقیم با ادمین انتقال داده میشوید و میتوانید با ادمین ربات صحبت کنید
			((توجه : اگر برای شوخی یا هر چیز دیگه ای روی دکمه موافقم بزنید برای همیشه از ربات بلاک خواهید شد.))]]
            local keyboard = do_keyboard_sac()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'flwer' then
            local text = [[تعرفه و قیمت خرید فالوور از ما🌟]]
            local keyboard = do_keyboard_flwer()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'flwe' then
            local text = [[قیمت ها :

100 فالوور > 2 ت
500 فالوور > 5 ت
1 کا فالوور > 9 ت 
3 کا فالوور > 25 ت 
6 کا فالوور > 46 ت
10 کا فالوور > 87 ت
—----------------------------
توجه کنید که زمان واریز فالوور به صورت تدریجی1-2 روز میباشد. (بر اساس تعداد متفاوت هست معمولا سفارشای بین 0 - 2 کا بین 1 الی 2 ساعت انجام میشن.)
برای کسب اطمینان ابتدا 70 فالوور به صورت رایگان به شما داده میشود.
فالوور ها کاملا ایرانی بوده و فعال هستند.
			((توجه : اگر برای شوخی یا هر چیز دیگه ای روی دکمه موافقم بزنید برای همیشه از ربات بلاک خواهید شد.))]]
            local keyboard = do_keyboard_flwe()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[با سلامی دوباره، به صفحه اول بازگشتید
			صفحه *1* از *2*]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'tab' then
            local text = [[شرایط تبادل با ما🌟]]
            local keyboard = do_keyboard_tab()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'ta' then
            local text = [[به نام خدا، 
			شرایط تبادل با کانال اینستا استور
➖ کانال در ارتباط با موضوع کانال ما یا حداقل نزدیک به آن باشد
➖ بنر های غیر اخلاقی و کانال های غیراخلاقی برای تبادل پذیرفته نمیشوند.
➖ سین کانال شما باید تقریبا هم رده و هم سطح با کانال ما باشد نه کمتر نه بیشتر
➖ اختلاف تعداد ممبر کانال ها با کانال ما حداکثر 100 ممبر باشد
➖ بنر ها در ساعات تایین شده به صورت پست آخر گذاشته و سپس پاک میشوند
اگر با این شرایط مخالفتی ندارید بر روی دکمه `"موافقم"` کلیک کنید سپس شما به چت مستقیم با ادمین انتقال داده میشوید و میتوانید با ادمین ربات صحبت کنید
			((توجه : اگر برای شوخی یا هر چیز دیگه ای روی دکمه موافقم بزنید برای همیشه از ربات بلاک خواهید شد.))]]
            local keyboard = do_keyboard_ta()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'ads' then
            local text = [[تا اطلاع ثانوی تبلیغاتی انجام نمیشود!]]
            local keyboard = do_keyboard_ads()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'page' then
            local text = [[➖ سلام خدمت شما دوست عزیز، به ربات رسمی اینستا استور خوش امدید
			صفحه *2* از *2*]]
            local keyboard = do_keyboard_page()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+989309649221', '🔸G3N!U5')
			end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)$',
	    '^/(start)$',
	   -- '^/(help)$',
	    	'^###cb:!(ads)',
	    	'^###cb:!(page)',
		'^###cb:!(sacc)',
		'^###cb:!(sac)',
		'^###cb:!(tab)',
		'^###cb:!(ta)',
		'^###cb:!(off)',
	   	'^###cb:!(of)',
	    	'^###cb:!(flwer)',
		'^###cb:!(home)',
		'^###cb:!(flwe)',
		'^###cb:!(share)',

    }
}
