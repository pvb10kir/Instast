local function do_keyboard_endchat()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🔚پایان چت', callback_data = '/end'}
	    }
    }
    return keyboard
end
local function do_keyboard_chatwith()
 local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🔚پایان چت', callback_data = '/end'}
	    }
    }
    return keyboard
end

local action = function(msg,blocks, ln)
local msg_id = msg.message_id
local user_id = msg.chat.id
local hash = 'pm:user'
local chat_info = db:hget(hash,user_id)
if blocks[1] == 'chat' then
if chat_info == 'block' then 
 api.sendMessage(msg.chat.id, '`شما بلاک هستید و قابلیت ارسال پیام ندارید.`', true) 
else
db:hset(hash, user_id, 'true')
 api.sendMessage(msg.chat.id, '`چت اغاز شد`\nتا پایان چت از کیبوردی استفاده نکنید\nهر پیامی که بفرستید برای ادمین ارسال میشود \nاز فرستادن استیکر و اسپم کردن خودداری کنید.\nاگر برای تبادل یا قرار دادن اکانت یا خرید فالوور امده اید در قالب یک پیام اقدام کنید', true)
 api.sendMessage(255317894, '`کاربر '..user_id..' چت را آغاز کرد.`', true)
 end
end
local hash = 'pm:user'
local user_id = msg.chat.id
if blocks[1] == 'chat' and db:hget(hash, user_id) then
api.sendMessage(255317894, '`ابتدا باید چت قبلی را ببندید`', true)
end
if blocks[1] == 'chatwith' then
	db:hset(hash, blocks[2], 'true')
	api.sendKeyboard(blocks[2], '`چت اغاز شد`\n`به دستور ادمین ربات چتی با شما آغاز شد برای ادامه چت پیام خود را تایپ کنید و برای خروج روی دکمه زیر بزنید.`'  ,do_keyboard_chatwith(), true)
 api.sendMessage(255317894, 'چت با '..blocks[2]..' .آغاز شد', true)
 end	
if blocks[1] == 'endwith' then
	db:hset(hash, blocks[2], 'false')
	api.sendMessage(blocks[2], 'چت با شما به دستور مدیر ربات بسته شد.' , true)
 api.sendMessage(255317894, 'چت با '..blocks[2]..' بسته شد', true)
 end	
if blocks[1] == 'end' then
if chat_info == 'block' or chat_info == 'false' then 
return nil 
else
 db:hset(hash, user_id, 'false')
api.sendMessage(msg.chat.id, '`چت تمام شد!`', true) 
api.sendMessage(255317894, '`کاربر '..user_id..' چت را پایان داد.`', true)
end
end
if msg.chat.type == 'private' and chat_info == 'true' then
if blocks[1] == 'end' or blocks[1] == 'chat' then return nil end
api.forwardMessage(255317894, msg.chat.id, msg_id) 
api.sendKeyboard(msg.chat.id, '`پیامت رسید`\n`منتظر جواب باش`'  ,do_keyboard_endchat(), true)
end
if blocks[1] == 'send' then
local msg = blocks[2]
local user_id = blocks[3]
api.sendMessage(user_id, 'پیام  : '..blocks[2]..'', true)
api.sendMessage(255317894, 'ارسال شد!', true)
end
if blocks[1] == 'help' and msg.chat.type == 'private' and msg.chat.id == 255317894 then
local text = [[Hi 
		*** Bot Admins Help ***
*/block reply|userid
بلاک کردن فرد مورد نظر
----------------------
/unblock reply|userid
خارج کردن از بلاک
----------------------
/chatwith userid
اغاز چت با فرد مورد نظر
----------------------
/endwith userid
پایان چت با فرد مورد نظر
----------------------
/send pm userid
فرستادن یک پیام به شخص مورد نظر
----------------------
GOODLUCK*]]
api.sendMessage(msg.chat.id, text, true)
end
if blocks[1] == 'block' then
if msg.reply and msg.reply.forward_from and msg.chat.type == 'private' and msg.chat.id == 255317894 and not blocks[2] then
msg = msg.reply
local user_id = msg.forward_from.id
 db:hset(hash, user_id, 'block')
api.sendMessage(msg.chat.id, '`بلاک شد. '..user_id..' کاربر!`', true) 
api.sendMessage(user_id, '`- متاسفم`\n`داخل این بات بلاک شدی`\n`چت تمام شد!`', true) 
else
 if msg.chat.type == 'private' and msg.chat.id == 255317894 then
 if msg.reply then return nil end
local user_id = blocks[2]
 db:hset(hash, user_id, 'block')
api.sendMessage(msg.chat.id, '`بلاک شد '..user_id..' کاربر`', true) 
api.sendMessage(user_id, '`- متاسفم`\n`شما بلاک شدید`\n`چت تمام شد!`', true) 
end 
end
end
if blocks[1] == 'unblock' then
if msg.reply and msg.reply.forward_from and msg.chat.type == 'private' and msg.chat.id == 255317894 and not blocks[2] then
msg = msg.reply
local user_id = msg.forward_from.id
 db:hset(hash, user_id, 'false')
api.sendMessage(msg.chat.id, '`از بلاک خارج شد. '..user_id..' کاربر`', true) 
api.sendMessage(user_id, '`شما انبلاک شدید و قابلیت چت کردن دارید`', true) 
else
 if msg.chat.type == 'private' and msg.chat.id == 255317894 then
  if msg.reply then return nil end
local user_id = blocks[2]
 db:hset(hash, user_id, 'false')
api.sendMessage(msg.chat.id, '`از بلاک خارج شد '..user_id..' کاربر`', true) 
api.sendMessage(user_id, '`شما انبلاک شدید و قابلیت چت کردن دارید`', true) 
end 
end
end
    if msg.reply and msg.reply.forward_from and msg.chat.type == 'private' and msg.chat.id == 255317894 then
   msg = msg.reply_to_message
    local receiver = msg.forward_from.id
    local input = blocks[1]
      api.sendMessage(receiver, 'جواب: '..input, false)
end
end
return {
  action = action,
triggers = {
    '^/(unblock) (%d+)$',
    '^/(block) (%d+)$',
    '^/(unblock)$',
    '^/(block)$',
    '^/(chat)$',
	'^/(help)$',
    '^/(end)$',
    '^/(send) (.*) (%d+)$',
	'^/(chatwith) (%d+)$',
	'^/(endwith) (%d+)$',
	'^###cb:/(chat)',
	'^###cb:/(chat)',
	'^###cb:/(end)',
    '^(.*)$',
    }
}
