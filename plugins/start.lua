local function do_keyboard_chgp()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = '🔮کانال های مافیا', callback_data = '!ch'},
    					},
    					{
{text = 'لیست گروه ها📦', callback_data = '!gp'},
	    },
	    {
	    {text = '🔙بازگشت', callback_data = '!home'}
        }

    return keyboard
end
local function do_keyboard_mods()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'پابلیک 1🔄', callback_data = '!p1'},
	    },
	{
    		    		{text = 'پابلیک 2🔄', callback_data = '!p2'},
	    },
	{
    		    		{text = 'پابلیک 3🔄', callback_data = '!p3'},
	    },
	{
    		    		{text = 'نایف🔄', callback_data = '!knife'},
	    },
	{
    		    		{text = 'ایم و ای دبل🔄', callback_data = '!awp'},
	    },
	{
    		    		{text = 'جیل🔄', callback_data = '!jail'},
	    },
	
	    {
	    {text = '🔙بازگشت', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    {
	        {text = '🔱لیست سرور ها', callback_data = '!server'},
        },
  {
	        {text = 'ℹ️لیست مادراتور ها', callback_data = '!mods'},
        },
 {
	        {text = '🔰کانال و گروه', callback_data = '!chgp'},
        },
		{
				{text = '⚒آغاز چت با ادمین', url = '/chat'},
	    },
	{
				{text = '➖صفحه دوم➖', url = '!2page'},
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
local function do_keyboard_server()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
	    {text = '🔙Home', callback_data = '!home'},
        }
    
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[📍به ربات رسمی مافیا خوش آمدید.
			صفحه 1 از 2]]
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
        if query == 'server' then
            local text = [[*✅ ایپی سرور های  کانتر استرایک 1.6 مافیا 👇🏻

🔹 با تایپ server/ درون هر یک از سرور های مافیا میتوانید به  سرور مورد نظر متصل شوید.


✔️MAFIA | Public #1 Server
📍IP : 10.48.9.70:27001

✔️MAFIA | Public #2 Server
📍IP : 10.48.9.70:27002

✔️MAFIA | Public #3 Server
📍IP : 10.48.9.71:27000

✔️MAFIA | Pro AwperS
📍IP : 10.48.9.70:27005

✔️MAFIA | Knife Server
📍IP : 10.48.9.70:27004

✔️MAFIA | jail break #1 Server
📍IP : 10.48.9.70:27013

✔️ MAFIA | Jail break #2 Server
 📍 IP : 10.48.9.71:27008

✅ ایپی سرور سمپ ( جی تی ای آنلاین ) مافیا:

✔️MAFIA-GAME RPG Server
📍IP : 10.201.72.21:7777
*
*
🗣 MAFIA Team Speak
📍IP : 10.48.9.75:2000
✔️ @MAFIA_CS
✔️ @MAFIA_SAMP
✔️  WWW.CS-MAFIA.IR*]]
            local keyboard = do_keyboard_server()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'mods' then
            local text = [[در این قسمت میتوانید مادراتور های هر سرور را مشاهده بفرمایید.☑️ ]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'chgp' then
            local text = [[لیست کانال و گروه های مافیا📢]]
            local keyboard = do_keyboard_buygroup()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[*به صفحه اول خوش برگشتید.
			صفحه 1 از 2*]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if db:get("share:"..msg.chat.id) then
    local wtf = db:ttl("share:"..msg.chat.id)
 api.sendMessage(msg.chat.id, 'شما به تازگی شماره دریافت کرده اید\n*'..wtf..'* ثانیه دیگر امتحان کنید.', true)
else
db:setex("share:"..msg.chat.id, 60, 'true')
        if query == 'share' then
     api.sendContact(msg.from.id, '+989305656691', '🔸پشتیبانی مافیا')
end
			end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)$',
	    '^/(start)$',
	   -- '^/(help)$',
	    '^###cb:!(home)',
'^###cb:!(buygroup)',
	   '^###cb:!(channel)',
	    '^###cb:!(robot)',
	'^###cb:!(date)',
	    '^###cb:!(share)',

    }
}
