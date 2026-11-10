Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4460A3823
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tMnv4J4Q;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JdLJ0BAc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=; b=tMnv4J4QftI0vv
	vLy1ccnIBV+s/gr2RUwsR1qpn19r7gBmoZdnOJzrEJZ0yZiwQQXQ9syi8izo+VZZjTBknN+ESplW0
	2tIKpTHEzzVzKzT5bZJS8VeHwwJDZgLClKcdilH9eKg77PHuZtOoDuClFl4/QAXU7zEVMwgQsm+oy
	BY07Hva15zsMrqv7W2eftABnGkuBUX+oaXEzKwuHe9ch7RyFtgv4fRNMGgcY7C9bYKoSSzm304o8A
	ngqWoXzBvzzuuqJyzDNXvD6ZUU/U9PI7wgiTVquRvhaZHVLjbbIvo3nS/q+nPq1BSaxaqZ5YD19gc
	zWjXYq9RCOsi7rNbx0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn6c-00000004G7E-1jeO;
	Tue, 10 Nov 2026 14:45:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn6a-00000004G6b-1lRf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:45:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4919a880834so1314767f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794321946; x=1794926746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=JdLJ0BAcjMxMWBtygU5LBNuxXgWeuXo61kOH/oEKkyT8mZiYRFvyYsxbls+KwlVazB
         +nOKv0J07YZVV+BJ80SmTDQHs6WhiTXJdTXEIn7vXqsJnRT9u29bpBxLR/c1bAqtRUQT
         Pnc1i35rgXdh0Zsl7m25lKXNxT1FLXhGhXhPbGps3cvBg/J/Mw/X46QSWQ7MUE/bQVNE
         Ahk4Vaq3NvpAQDH03gjPJH+cscrqgbmvHACMOWDvYLAwDdGp6S7oCcJ+MipEr92mpWlJ
         Dsx/hVUjNkH6+KAv8xbxoNRvPd86QBlIQhwuvtnPnY8uPPLT0OeZgYdJQVsgRdV7Cet7
         RQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321946; x=1794926746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=EkMydpOdKADS5kgHYJE5l+2Y1dg7m60HQC/yM1MpRIm9BvCExa8/btlbJyC9ujjLuM
         0K+tDnxN5QElwDPNqDPw6z2Ks1pY6py6MKc108fVsDTy2q6RATkxJhnZPV/kpt+clOyn
         FY+htzTdoEmDtNHa9b6hZbm0v6DOZFro0h6RpSEd/Z8qwpwHLonzANNWah3Zsed9RQCd
         Kysfbt9Wp5rsgMGXOoZsD3WNRvw4RdatbZ/rpeJojXJ7P9zDdjjUbNS5sCrWwVG8Q1qR
         y1d8DTE/UXpkw4LrMv2+53CmtVf7WIX9bKlb90hcwOpThh5SF8M5d3uen7qH9JFwtpu3
         FyWg==
X-Forwarded-Encrypted: i=1; AL+hErEbInASgekr0oHqIwkm68EHeC5v056bk0yNA86pZ9EyOX1tujj8ZSQRtIitUmYCRsKokyBQleWDb9pca7NXeH0i@lists.infradead.org
X-Gm-Message-State: APuU4Z+6Zy24qjm7CgS/y8LpIWJNZ28DkhL/Uu+DxB7u0RE2AteBRaBF
	eJcs61253xrW/ctKJHjOt7F6FQriyPzlGTEFVF4KgYsmR08rjiSSns70XPdr0Dlg68FvYA+7Pv4
	KErCM6L8=
X-Gm-Gg: AYBFou02o9cAu0Ta3TOx+k/vF2xUTKMn7Ch3e4tiA3rjfyxtadOOIPcjMcYJ3hvc/OS
	Ubd3mYYjlHdLCKo4ClEinGUqall3b4lsSpSn0fCw8d1fI28Ch1/G5zQ4e01YDLBn6E5P+/6WVWp
	cHrSTB4RMxbo4rJ966z/8xkbIuJAimP/dd29H2d/J83c9OcZQi6QUNbesHhjNjDqmUbcdb1NB6O
	kxx3uQ/k64Fr1JeA8teP3cqrdsQAWNHBurtlzxmZTwysjWAC9ChA75PPG4A3yZj91daN4o2Wj7o
	NgB9hDTRV0vSs8sFkrTYHiSArrQbv0ncqT3hxCc1Mx9OJe/V/1rNyAaf9yHfBhaE2I5lYCr3tOZ
	1yRHlY1stgW6XK8gsJTACxGb+ZOz3hV01wKQaSrVyIQRU8rjyHffBxnZZaqg9DZcCCXtCqHfejS
	orM/segPyTybh/aGoqxBtdmkpQT3ZouVsdWK20rLqEFFb+6P9pbwV65XTH8c/2Ge7M+YikAckvS
	4+F9YT8jsgXP8j+xF7Uq1kZIQBSvUrHwDDscGrbPZNz7P61iAJYFW3bZ5DlayCbtzLUgy/nMbu9
	HYa9EBnLfpdduoZ9bHmHzgilkCsXR2KFu5TQ8Oj3tMjCZuv4ig88B/kpsRyXkmTwVeXd2V/3nMG
	9/S8=
X-Received: by 2002:a05:6000:46c6:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-4982e82c2d8mr3373380f8f.16.1794321946400;
        Tue, 10 Nov 2026 06:45:46 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm3848234f8f.14.2026.11.10.06.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:45:45 -0800 (PST)
Message-ID: <1300fdd4-b4b3-4a89-a37b-ea0d18e3c055@baylibre.com>
Date: Tue, 10 Nov 2026 15:45:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <avMg5XmU8uSzPR4s@pluto> <avMlrXeemXOSR3ng@ashevche-desk.local>
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
In-Reply-To: <avMlrXeemXOSR3ng@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_064548_500984_6DD5A8D9 
X-CRM114-Status: GOOD (  14.22  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andy,

On 11/10/26 3:09 PM, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 01:49:25PM +0000, Cristian Marussi wrote:
>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
>>> +{
>>> +	const unsigned int *elems, *pins;
>>> +	unsigned int nr_elems, nr_pins, i;
>>> +	bool pin_only, gpio;
>>> +	int nr_functions, func, ret;
> 
>> Beside nr_functions, cannot all of these variable definitions be moved
>> inside the scope in which they are exclusively used, i.e. down inside
>> the for-loop ?
> 
> While it can be done, it's not most recommended style. Is it already in use in
> this driver elsewhere? If not, don't do it in a single function. Same if it's
> used in like one or two out of dozens of cases. TL;DR: be consistent in the
> first place.

I'll try to be consistent in the v2

Best regards,
Clément

