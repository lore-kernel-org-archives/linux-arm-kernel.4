Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3n2GJ5PP;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UUIRQxp4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=; b=3n2GJ5PPUMVMvi
	EDYQcvOGC/6kEJ+H+jbLY+nZ+26E43VRGOE0mXmN4bQmKi25POW6UpxzIXdWcHkn06CiQOWyxyGTf
	VOutZo9u7IXAyMsL60mlz6cvV7DxkllnaP4KvUKH4K69EQNa3t2NIglGaxrxCRxNcUXrzwUYvNeYz
	fonuUTQv0a5JczyW745emLelDiYMJQHgxeZFG3zi40AEyfbcSHpXTSqTGipcPulQ9QLzR7mB/36DL
	o7gcyVbvFofoOAEt5gLcDk6kd2ET/EJBEiULoYMihTnGgmHtCixhTFaJY+/JHc2pho3fgSpPcJTyp
	0MZQQfg3cn8/wcy6rnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVb-00000001s7D-0Abf;
	Mon, 16 Nov 2026 10:00:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVX-00000001s5f-2CtT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:00:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-491aaed7565so1450525f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794823213; x=1795428013; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=UUIRQxp4Zv+5tbg5tuD+1Mr9A60KkRseQZgIuzbIrz8UqgWUbZBJBH+a5UZThVy7TA
         /euHm5DMQjLtP7A2MdA9uLU1Y6bIzfrWPvbPZQAx9xlGbd+dTHZVyAGTDPKye8UgM4tG
         VvA1osgb/auqwOIJz8/OuR0+2UVZc2ywH14Gg772NrM6mKeI13i0l6R9pLr8WoU6xxzW
         dupvL0e/NXG047B1ABryUEIpJl0JhfAcGj1pB29HcVRxdmkzqQAUHr7HYqydcv8n3ZJY
         WuMzV3OvBX6zhgAtMctiJS6oOsmYs55vcJQdqHNUvKnhqwdDwXfSnwRdyCISQfFdYsBm
         TR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823213; x=1795428013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2QG11mcJBEDMvu/QuPkL2NoETjOTlYzjaGlnujMsbc=;
        b=oa8XN2EIHMfRU8JtvJT4MmCKmQfQjLu07LHvaywHM9+NE4fquu+VQyARQQpVtGf3CZ
         5LF4pwYUPg5fmcAPby/y4ERodVDQvClPW8YF+h3v6FF9EAnADCNlVyhlDWEFle4VZ658
         Eh5YjdNxvU/jdCNx02eTUNrS1bzmM5siILIm+rZfu2RwZiWjorbKwH2oMk3ElaYp4LoO
         cPBZYz1472Kg06OVFSbFae99eueM9hQeuBLq6qPf0YCuvg0mHIYGMgW6hc4aM4cAmzI9
         0KUqP7yNv0ETJS0SmzbbQBz1xii39Stkv5RySd6Bv13orEhgvlJZ5qMRQ5X7b2xfHmF8
         ibIg==
X-Forwarded-Encrypted: i=1; AL+hErGHHqyV8PJb2V+0klqC1W8DHoebmCRH5M0hF6ivAbkOeb+GBSqzM1ewa4VGNyp/tN+YCMWu6oaM31KMXiRq3+Vx@lists.infradead.org
X-Gm-Message-State: APuU4Z87lyMu4gW8PjCj5sbPZZk1ZNRhy4jXgnecLQbBD6tLcdxeoVf4
	88yEXWyjz7Ben6PAmKPjJya3IBI22LlLy90irVKh0fbs1zmgnIODYv+1A16Msy/ZBmQfaEyoKxz
	toLlO
X-Gm-Gg: AZFdTZci1WiC9ucidO0uqWqHTnyOvGOI6LRNCf6suikLV+RxcfWHDpCOg5LKOxLD1q0
	rQrStrFOTuxHJRkSC7Vdi2VQktiRWKEKltjMU/d4v+5aHt3GkOvah1/y29+nKApVOB5ecojmOtu
	3HVM16soPdbe0S+dnPeYwEp+skhRBgnzaWFwTbQXHGKAcDzQjInND34aQmjbwPmNGMMYNqDI1rC
	6pLQTpskc2g9CAmhOZUwgCtHucGlLYFjB06vFUK4UJq7QbzoHn7lGQBBdMYELx+2dlCvm0326JX
	JwrQSNhdp1HbGyONT3AegxdboZEMxYf4q2oWE9Y+BJL1erycA2mXZm3rgrnYnoQ7gP771UDZr0U
	Z3kXOrryclVw5MykYoTf+rFEyknJT4kFoSTAjtH2BRyy3CtJTpKa/zjdM8Bt8KPyiunL8Dj4mIx
	qbo/dYsyN9ZOqTH8ddKs07jURgltUhFufT3DiCibhtDEolEUIwTttKsq/8SV8CXenERaI0/ufeG
	nMdpUIiQc+pirX2eOt0d0P8fgSAPJlNVk3IOpKXA9/xy3wsJ41YbTjuEHoEU3cfbG78gF3i99w9
	+xEk2fiSQpC0YA7YERPxmfJEpr7OIQgdtQ==
X-Received: by 2002:adf:e008:0:20b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-49c71e3e1c0mr15349062f8f.9.1794823212810;
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Received: from [10.48.2.141] ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20247717f8f.37.2026.11.16.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:12 -0800 (PST)
Message-ID: <ce463c97-8fde-44b3-b3bd-c21a69ee61b9@baylibre.com>
Date: Mon, 16 Nov 2026 11:00:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
 <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
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
In-Reply-To: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020015_803533_AD991673 
X-CRM114-Status: UNSURE (   9.93  )
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

Hi Linus,

On 11/13/26 11:11 AM, Linus Walleij wrote:
> On Fri, Oct 30, 2026 at 4:58 PM Clément Le Goffic
> <clegoffic@baylibre.com> wrote:
> 
>> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
>> driver registered them as groups. Register pin-only functions without
>> groups.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> 
> 
> Patch applied for fixes.
v2 went out after your mail, please skip its patches 1 to 3.
Its patch 4 does not apply on the patch 1 from v1 (a line join Andy asked for), and its patches 5 and 6 carry the arm_scmi to arm/scmi move from linux-next.

Should I send the fixes of v3, patch 6 included, on your fixes branch, and the rest as a separate series on linux-next?

Best regards,
Clément

