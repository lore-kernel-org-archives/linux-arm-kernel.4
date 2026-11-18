Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3773606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GufC1u0i;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XJpCTgCD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=; b=GufC1u0iDszJgv
	VJyiW1YRkqkZQweBwg0D8iThICgqvuVOodkkB4OAY3X/nfObvdu9FZ+FZpO7Nfbsu5ary3+9SQ6d1
	5iH/4nLyh3PHLBYu3dtxHU1k5tb2NCXJgde1i0NG3CtQ1r9Pt4wJghbDncGPRToejpEpuAyQGjKRF
	it0PklZKll+e+tuijVxqMkV5U7a2JSGVCH6PxNTGFnKMAatDpVx17RQkM8mDOmSNrUfThHiy7X0js
	MEjOaBbdGxQGW1MHNoyTd5XZT1vfjBimv8tYyAewMMq+WLM878vu68SVKGOgyl/0FRrxd9QOhn3za
	vbW+obngYZoBw7k6awWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh5o-00000009B6h-2SBI;
	Wed, 18 Nov 2026 14:57:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh5f-00000009B3B-35Dj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 14:56:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10477045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795013809; x=1795618609; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
        b=XJpCTgCDXoxxmj+Z0HJoDAZ5DnWRfKKhIG+pvwuiOH0UcyYKGzJHIx+BA4zauVbOM0
         MMC6NKsRC5+wbexnYUssU0KFf9r2+qXs3ez2We6c4yZ4et8QwY5oUjpaHWB35vhIF8wY
         DZ8vuGOjGKKAfgOyFdw1c/8LiFSz8jsJpRbwIhJOEltLXulhnXfeRvg0DvzTtAHrC74w
         nDbfobkH7KNWCAPJtaXXU6C87aqztylhF22pQOjYifh/JYy7pAckOS+0v+57ajtQ3apF
         eeN9fy0vVQD0LmsmqUhLrMx934Ntlbgb0uXY/TNAIQwTbA2UsRNOJXUKdHLy4qyfIx+J
         3FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013809; x=1795618609;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP66JK+9IZWV70ief0dIKlL0g1lFT7CpEkSpmNESw+A=;
        b=BIbD9iuajHyZeBvjU9lzs3Jg7aqsc2UgomvMSdZmwKV0mvrqpOzbDEvWiRnW4h3S6I
         vQayTwWSUpUUrqx4JPlJK9aUpE3tHL4mMB2wa0SCMTXID6iusyFIxBwbj1TS81GLXc5t
         B4QckIRQCIzdAbk+H6AlS8xHeAKGuKrIE+LGfc423inIwL1vCdREWdGLUMQKzN4cikN8
         X7iRntP/d1pFhdGuciMp8pKTiaNJKYwQOgms0zaiY97RSAyitcvO4S4bgOJEuyUxP1sL
         6aC3gQJKz4R4/+QETueRDmWbmst87I96rE+WaOO6+W3nLVFZE0ipuU2h6C5xZkWVorxJ
         yTow==
X-Forwarded-Encrypted: i=1; AL+hErH83qoF5Z3/hcNBfz4qFWIFslZfM3fnADKmvt7FzKZVNuVX+sPTy8VleWATGe5e9HtwcmQiIOhXGAn49gWaHk7e@lists.infradead.org
X-Gm-Message-State: APuU4Z/pb2AsFN6AYfGRVPttQSJM5PNI38JlYKw+qWxA0TIZbUtztbHS
	DK1Rks/DF6j92P48qvmv9uclfbH0sbgVQmxWkAOhpy0VoR4sQ0XIEATIElL5MIpKQgumT/OTDrs
	JLoTQOag=
X-Gm-Gg: AYBFou3nbI5P0qAhAEYxr72Q+JwAj/yH0W3RP5O4mgeLkusaEB7MAucNLHFZjGr18OA
	wpf/XT6uGP1yubCPTdLdmb5mbJJ8J0LwKc5yYqKD4/XdHJ6Fc+ShdqqjxJtqliCiVyk2/eNsXNP
	tvmte4UVsTlx9+lCe6qzJ3ESWOU3AUvjAIQJftC5dCR03KJ18y8Y5gkJLZNHbqFSqYBe9rAEvOo
	y4jLYTHHSdUZ1RfgF+S7YAw5dxIJgkb9AZPLOsHzXy5e0Vxr/bEUGH9NNabqD3ss5HPxpNZojIP
	8RziBdlMqn48sHorugB30ybD/N9zqBqRZqA6J/ybL27SS+FAkaiOdbVvSE42Tqg4WKS80q5RImo
	656oKG18Nqh6tosRC4qbdTi5otqjls01wSYRD/d11pAdgk9BMu5Yf36Z+8wE+ugaXAL47s8srAi
	h/6Lse+EYo4eoqRY1D0FkVLiXSoCjq1fW4ttbzA+CwtxdbMUMlvx1IVpKGC3lOzKqcgooVgjrZD
	WY37vqBLT3skz7SiHBx7EF/AXSsvWubd96zDTeG7i/RmMQW3tCZiXXfIbZRGy/Wz/kmVvvBuNBW
	CRPjI2dOvyjgRNGPyN3hlq/B5Si/PzXPu4CzUNQV4RsriVoVNX72Awqgm0FhewBHiycKAXROdww
	VllaqGs42N4/jpXUsJlpVxVfpzG3zR4eqrIz6C5WVJoICz+DO6hGH7T9FwOrWTcXeFT83jp2CpL
	0dwmaA1QsCyZN+pg==
X-Received: by 2002:a05:600c:3e07:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb7da44cbdmr52983185e9.31.1795013808498;
        Wed, 18 Nov 2026 06:56:48 -0800 (PST)
Received: from ?IPV6:2a02:8440:7506:415f:b2ff:e89f:45f0:164b? (2a02-8440-7506-415f-b2ff-e89f-45f0-164b.rev.sfr.net. [2a02:8440:7506:415f:b2ff:e89f:45f0:164b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm5131667f8f.33.2026.11.18.06.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:56:48 -0800 (PST)
Message-ID: <f837a7b5-7fce-4571-96b2-f3d307d203c2@baylibre.com>
Date: Wed, 18 Nov 2026 15:56:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in
 microamperes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
 <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
 <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_065651_822658_69055F82 
X-CRM114-Status: GOOD (  19.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Geert,

On 11/17/26 3:35 PM, Geert Uytterhoeven wrote:
> Hi Clément,
>
> On Fri, 13 Nov 2026 at 16:02, Clément Le Goffic <clegoffic@baylibre.com> wrote:
>> SCMI gives the drive strength in microamperes, but
>> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
>> Convert it on set and on get. It is the only unit that differs: the
>> debounce is in microseconds and the pull resistances in ohms on both
>> sides, and every other value is a flag or implementation defined.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>
> Thanks for your patch, which is now commit cc2f90768e971bcc ("pinctrl:
> scmi: send the drive strength in microamperes") in pinctrl/for-next.

Yes, Linus took it 1h before my v2 and I didn't see it.

[...]

>> +static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
>> +{
>> +       if (param == PIN_CONFIG_DRIVE_STRENGTH)
>> +               return value / MILLI;
>
> Does this need rounding?

Rounding does not help I think: SCMI only talks µA, and 10800 µA has no exact mA form.
I will send a fix that returns -EINVAL on get when the value is not a whole mA.
PIN_CONFIG_DRIVE_STRENGTH_UA still gives the exact value.

> While MILLI = 1000UL is correct from a numerical point of view,
> it is not correct from a semantical point of view.
>
> <linux/units.h> has:
>
>     #define MICROWATT_PER_MILLIWATT 1000UL
>
> In the absence of a generic conversion value, "(MICRO / MILLI)" might
> be better.

Agreed, I will send a follow-up once Linus answers my question on v1 patch 7 about where to base v3 [1].

[...]

>> +               *arg *= MILLI;
>
> What happens if the result differs from the original value in µA,
> due to truncation or rounding?
>
> Likewise about the use of MILLI.

Multiplying a whole mA by 1000 gives an exact µA value, so it never differs, unless it overflows the u32.
The same fix will return -EINVAL for that case.
The platform refuses a value it does not support and the set fails with -EINVAL.

[1] https://lore.kernel.org/all/ce463c97-8fde-44b3-b3bd-c21a69ee61b9@baylibre.com/

Best regards,
Clément


