Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E9606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLfy9fxO;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QcqBKzQH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=; b=gLfy9fxOjWYTPW
	ATtLFjfoVO4iTyWHVy9WVNHlQTNvH/s0gIK6LmkvxdgJSHk11IVOYJ8qE7LGmX72UHEerW4U0iLFP
	aXFNqIvPgOVyfcQpZoGWq4G4fIZt39f456dCM1+ROqe2meoN5XIC1+APGKobqVH7qtcHQ0VfUMH3W
	sC/AA1PHPBFfUZ0GwhdGfET0L3SBgPRn1yAbZ27ofZspsKl6NHsSjOxr266FJGlVtja7/GQ/h8jCr
	71chSo8QZrF+qjHZZVs3y+zQIsolFQDwq03pNLaqtvHgDkYZF9kpeg+Qy5FHPSvBEAybOliYA+s3Z
	DDVKxyExbrAVV6ypjnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqOb-00000004lpj-0nSn;
	Tue, 10 Nov 2026 18:16:37 +0000
Received: from mail-vs1-xe63.google.com ([2607:f8b0:4864:20::e63])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqOV-00000004lnS-2got
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:16:33 +0000
Received: by mail-vs1-xe63.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso1267936137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334590; x=1794939390;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
        b=wdvBHG5437GKbGbvfWaKfdxvT5ugyteR7GiQPYFX6VD1yH/rH3dK+8KAhfIb8BYLdU
         ZJZp779GSwncGjGn6tQQbro15nTyXktZNK45FcDlw/2aMJ/+EW/d8vk4Fab7E8inNfSW
         O8RAO3j+QkcyQ0M6Eiy58MxPRQmXu2Q3AU6S2RBrvbYuKsi9EH7Kqf+4BAU6UBgqtTM/
         s1MnNeQS1GT3Wm3r+DdQerb89McBRlg3K0jlhlKCx7AgzTR1LCRSdCyAGrN6JxJVMcoA
         WpXVBj5WqctePPtSKEE/IHSOP+Xul2dj6ZXIeEPyzE8VwhnVRTcvmsNpz8HAVtNLFkj2
         B/7A==
X-Forwarded-Encrypted: i=1; AL+hErENBWFb+HgYBMhHlcFjB6/3/u3jnO7t7KGV5DCBIrMKN27KwJijYjLctViKVP/7fCHw/8zhTj+kIFVaQn/s9+Yx@lists.infradead.org
X-Gm-Message-State: APuU4Z/O2OdtAskrwC9PKkjxS2HVx395ttOyeigZZ5qwvRUl8mPNAd+M
	6SkDBtkL5p3ZecNYwTg1+xGs66LjxYNP0ru7xMIn7GmdDrq/jqS5KquY1ptm3XwVfbLwk/6WWnR
	EZyUjNna7CcuOpXyo2rFe9tl7HR5TiTDzDBRICYabPQPTgE8ye5InmpzpPefJYA7guClp9F3tdG
	bpH2RWtxrdzLg/L0xMaNqlPNXPqINqBcRDVgReHVPiPe3SSCFZMC06FWnc8clAaeFLsrYlfdxq+
	rwmIhDmfvpdmaMt2JRPR+TL8fqnP3KJSKM=
X-Gm-Gg: AYBFou3PT9NAud6UGl8HkOurKS0btjUhBpg4SBQPwj2+NfSkpvUlituQPXm2EobsTKL
	8yjNtVhxCMnCrktDtwW5nM0aZoMSPXAQ45PmBTFwmVPJKz+/+zVu1xnynyrLqST2a7NnXsiS2dl
	DbVyjQXHoQO7qHQW0BHB9GsCvr5SmVetTjZxBS2RSfMYWd1G3sIjrfnE+9w14aYgBBLnJAHPOTl
	5/XU7aA/hAn49olh6Ayg7ZLU3s4zhCLmw2zRWCxkpVWeEhJ4g4acDMgel3Y7HzWdL3eENsWmCCo
	bND7ZJsJjB47RwoGiWXnjJ1Nor8dN4M+gyBuTw1niWkWrYwqsK6qq7tLPppjcOac+IE1TDlVYcF
	9tOeZLAckgtPGQiGP9z2CErAMan24QgQQhzWMPCeYXH3stbNagh/iozVBxPGW7s3vVAEd5vz7cX
	+ZBEjVGDxeKe0ciJNdMl/QWu5UPsAFoUtqN4Ju+NSu
X-Received: by 2002:a05:6102:83d9:b0:7c1:7ca9:94bf with SMTP id ada2fe7eead31-7d301c2b817mr1286961137.19.1794334590150;
        Tue, 10 Nov 2026 10:16:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d302241fbdsm24183137.3.2026.11.10.10.16.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:16:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ebc622dc8so62207976d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794334589; x=1794939389; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
        b=QcqBKzQHGifpie21BDnI4unxtBXhxvMf6JaD/7qa7HmyNGJF7ztd913j12rAMxtazz
         w8Js3v4Epv1sFsWBGoLmtE66a04xKe+HbXK3p7mL3WTZPy99wzHRc5ZYrpWOZJ5FQC8Z
         8KJBvLpitEbj/bxA65Lx+hqIo9LcMz/Rt6xC8=
X-Forwarded-Encrypted: i=1; AL+hErFcxJp7TrdQ1kkrNWGsAhXqBxNjWRFF/wEkOLYExb14fgP9L/VV4JHZe/2bZPrhRj3cTiYKW7FV11imTzT43tUE@lists.infradead.org
X-Received: by 2002:a05:620a:46a7:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-9479f387c90mr537591585a.47.1794332957037;
        Tue, 10 Nov 2026 09:49:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-9479f387c90mr537587785a.47.1794332956564;
        Tue, 10 Nov 2026 09:49:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm277453885a.37.2026.11.10.09.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:49:15 -0800 (PST)
Message-ID: <d18fe81c-8762-4886-b3d8-d2b7d9898ed0@broadcom.com>
Date: Tue, 10 Nov 2026 09:49:13 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 brcmstb
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Bell <jonathan@raspberrypi.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_101631_698813_1C55FEF4 
X-CRM114-Status: UNSURE (   9.06  )
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

On 11/5/26 23:06, Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> pairs the callback with the pinconf_generic_dt_node_to_map_all()
> already used for dt_node_to_map.
> 
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Similar thing to patch #2, this should have:

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

