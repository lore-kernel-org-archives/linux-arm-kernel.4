Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7860A2637
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FPeBApFX;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Jv4swbfv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=; b=FPeBApFXRciaOW
	7QT0QMa3q+TBg6roJicdZ2YcfoYcpoxLHVOWql9oSksUmJtCiS/i8E1Gv+7+kSfGVXtZlVNLCDBD4
	SJvF8Y2VW1x2ObjkYf5WRBlenBl/wD3LhCvLV6MSJxa9GGqwN3NeLKDZFgLVu4TxbO6u4yYtJMto4
	LDKGY/8ZsQm3iFaU2jg70jdy4rjUQuFqo68MgxN8Y+a5848uN+ohTwNhGnmL+oOGrAdmbI9omVwAt
	85f7JDnFwkNj6oCZEjP4e5WeYqdXs4q6AkfAq493tqc2KrOxidHlORtpqf2J3VylU/ZF4uK5iVfSG
	Z0U7vWa6QcGNW6gGA/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn8M-00000004GQQ-2mFg;
	Tue, 10 Nov 2026 14:47:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn8K-00000004GPr-1FLO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:47:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1396145f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794322054; x=1794926854; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=Jv4swbfvY/62LthGSwmqTnI1ETfs34ZgF9dbiiwBKGTil+0X+GyQG52oEet+aaxH+X
         +XQrNAp71JRE2VTv2wspb855BnoEG+okhmaT4miYb5HMwIGzvzi3pbIfG+wMSkeUEeGJ
         0ILVbhABbdrLX6ySE1njRnaK6cxphfjBErfQIY/l3zL/WQFppvmu459f6nU7WZV1phRk
         OicelNB2GyKXr4ZmrsZjRbOJSGspifED2oK4zPaA/eWcxLxSfAuFZnmLvD9phIi6gmos
         HqXWB0aefTPfSvhJSqt/EjAN6Nak6WA1N6UOfcRx4tK7+Gdb1rhUu5dVw2pu+sjVYZsV
         39jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322054; x=1794926854;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=uXxMJoLAmKBhyiAF8AzBOlakYjU5yGucnn9wmmlVU+eOssHcdS3hUdciCzlwqpWIph
         /5/wzfXbN+IQRwsUas7lW4awc2emCz4lxWDg71JBA42DAHN/vXEajcW1yUHasJuApNcR
         ZBLh6+1Xngo32rQNrk8rENKA2q8QvD2xN7vkh9bVhkXYXP0LjK8G9j8FSp5c+A1Vn7lQ
         AXCe2Z2YqMhDUkkvPpsrZ/Rav1boxAuGszKYJEWxw6XRv4NGnHtAr0DMOK9NWLvQ6iMT
         KLRYRTmXBhcGb/aaaAiYIvYdsMIAANPX3ml6S6Qvot6wrXaDIoX6SWICBoOd0L30nHqJ
         TITw==
X-Forwarded-Encrypted: i=1; AL+hErGbqa2Ro5GFU2mQZhwWgn0Ce/FQtDyKUxCCmEgFwbebDD46cr6NdYm4rk0h11X2W1bBM68AD+0Xhwzh08IoiSiV@lists.infradead.org
X-Gm-Message-State: APuU4Z+SBX5wQJGdiLo71Va2q+kgJBoi42Q2RjEfb1PZrMFl6L/QFH6f
	N2sGqMIAADgO5Xs8CAPsB90PHsv7no1cu3CNQwZe1JkIigrd46AKdKQ0jK6SrE4Z5ig=
X-Gm-Gg: AYBFou1YZc/+GunHEyW14niKZM/1zS7np72nKEzWu9qBMGW4jnutFswE6aIhnLLwN5U
	ALHve4h7DZCYfBoEl0rHJ3j+RNKHz1Qz7o8007+NnFOQgKIlCVbhrF+tYKOnngnwZtRvaYmxVR9
	HbJrIMhBlgBSOJ03k7Nzh2a43D82Blg8T0XuKlBSM4b/jj9a6LDJk7HLGwB+7nRhQ9qI7DHVWZ4
	Mrizq/qOjCnEc1p/EpT6B6mkQwIDRVAqpnTSj6xKBdrZ5/vyursQ7TivyGS7RSClinMeClTRSEi
	ClsgdH3nO3f3ubrTYNMdu/va0NxeYR47rM3IQ6UVOz6aUx65rkiqH2kYAzy9f+IR5kLAp/LGIpR
	tiaIYRbjCj6HPspE4NSM52IoaLd8hj1U/xJVJ2BJRi3gASCi5pls5HRFCdmpHfG+p35ns0pyXPo
	vEqZ6yUwUCZE9id0ydSQCq0zYH5wKGy5H6YYS/4O+zsZ0Z4y5b+zjkH3IogZtCok/HlLs9eNjZy
	nPdEBBO+QH7gTf34UrfDO1eWbap8H5eoPCQFc+1sjbFqs2tT3pbDoa5nqLj+b8htq9wDxJQpn7D
	3Iv5oIRV7XjjprfAGiqEDSgwKkLI2fYJB/fTdTgd5JPXCWkZVIM5jgY39g==
X-Received: by 2002:a05:6000:29cd:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-4982e82c642mr3775637f8f.13.1794322054505;
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm5253059f8f.55.2026.11.10.06.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Message-ID: <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>
Date: Tue, 10 Nov 2026 15:47:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <avL-4lquUqW9lUNh@pluto>
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
In-Reply-To: <avL-4lquUqW9lUNh@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_064736_349699_E96D8D1A 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Hi Cristian,

On 11/10/26 12:24 PM, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>> ---
> 
> LGTM.
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

I'll apply Andy remarks. Can I keep your Reviewed-by with those fixes?

Best regards,
Clément


