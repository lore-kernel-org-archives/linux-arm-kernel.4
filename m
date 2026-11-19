Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8DA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dzmCHrUW;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jxne70m6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xOFGCuOuftk7Jm+H2Fz+MNE7pDCNEdYzVrRVgRwRnqA=; b=dzmCHrUWzupOd2
	DTA9+Io95UUTARJIIGTHmZJ2fR5FTL3r+chrcX2XZcq/rSh4axcCGecxOERxDVJj1TEyxBOQpuU8B
	esJX6whxOlEwLY0x8XW9csKHfeAs+rwgZJ+zw1kI9R7sAANk9y/bAzpkAMdCX/I2QpwWTtlDD/vWX
	+eMHNMk/UZLEIc1YKZAGkFfN9C3/o7BgKDix7I+r/jztaaIvURbdvvk+YYuB+cAk0jA7w+WahYjb1
	WNAdKlVNrxywL+yiicgOxVWAZx9tEFGW5GfCjas2RKgw2ajgzY/TNa/qHOQB1M6ddFPeH+kDXu4Xw
	AyL4KKrQHeTcpB2/keDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUB5Y-0000000Dcpf-2qhF;
	Thu, 19 Nov 2026 22:58:44 +0000
Received: from mail-oo1-xc61.google.com ([2607:f8b0:4864:20::c61])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUB5W-0000000Dcot-1eud
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 22:58:44 +0000
Received: by mail-oo1-xc61.google.com with SMTP id 006d021491bc7-716d052dc23so143364eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 14:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795129119; x=1795733919;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xOFGCuOuftk7Jm+H2Fz+MNE7pDCNEdYzVrRVgRwRnqA=;
        b=oLcDvSyB2xd86s/5im7dbZwuwd9Ee8sT0ki5+m3ChnyuQioPqiWIdaKe0qkLJaM/vG
         yqOMN3PSPph/sjwRv16G6IUVtRQIgooQQ6nQVpyYUcGio+AuzOMNUJX2t3rsQHmk/1sz
         tXqgvFPAj4LeNKeT4enr9k5U3inYkh5U7rCcbtcFALUxqI7OvPP2Pk1Fca8P2yTux7+v
         tO/oxYKfZRd6XCLCWmAd6QFxDdJmrv5G8IpnWMUHHvmGe3WJWB1wR27tAgmMim7S1jaG
         FhdPghqrkXpo+QtzxyzWoz7u6ONLv4mEsLtvl+5oGezqkHUEgGtQQJx1HedznIX4GhEi
         HhCQ==
X-Forwarded-Encrypted: i=1; AL+hErFniXdMi6FX4HM40XyjLPywEfEPwxuEFahttmp9ynxSXJqkFYqJkmQT5h7gSh3N4HesnJ12BkWzWPX7aqJldakO@lists.infradead.org
X-Gm-Message-State: APuU4Z+YsBIwrzOuy1Oi2h1w/qTFTJLjc1jFI+dH5rtzaB5IP2QwtoOy
	IFQG0U7iB/mW+zxllS3MM7D0j12AA96AyWj8MS/8EzI9+n0r+2okP6Nf4F0IeGKSdP6MKmfL1c2
	4uD467qHVMdTbzUu3p97TY2J1zpB+1vzwDXs9C7zC2XqEdEVHDZecNWKW6fDQ8moxmQV1FzVHvq
	uxvnfJce1tEf1bIl9DQUiTuoBm3VsKtBHKQVW1/DCXaijR9WVZ9SmTyNHzkCbOK3VjibC+oM9Y7
	Ju0orjFO9dOgL4qNUm7ZBvqQkOMZkZi5xs=
X-Gm-Gg: AYBFou27VHKQmqCNMJkZKWpYyAm2aCvHdgnEsSzXc1gLwwtgz9YGJU6PC/KOyL6lMPR
	gw8muWZUXUuEtsqhJFEJL2tyey7TgdrAl+y7k7IefbgYzbq0ADGDuDFWPfYjlLMpIMKrSq34i5i
	Xo33eSdMPBa814Iz13w8pG9nLgsHK1QydOtCULE7CMDpvjt6H7A2PBbC1FsdtLoQEyUWpIgnmt5
	AGJUR0dZkSlSV4Trx6tbqPw9dKcG2Kk7lIwbAs964KZNBFIVa7n3d0A1Cufx7WGEV/6JdlMh9P1
	+ouSrBj5h6080BNf+GSNnuZIahNBRQyfDD+cj7W0Fy+580uOo+SQn6Se6tH3x0zJzTd6M6IgLne
	fQ0uJ3hHGrwfif8PAR98x/Y3w1R79ddMXXmTDXQFwYcDIy4ZhPAxppMsvahQxxETrdofIBWdkQg
	WoyJ8CgOjKn5JOYe8uSY4ZLRulXF3Ez6ofBrVBdm4ZQBg=
X-Received: by 2002:a05:6820:a65b:10b0:716:e855:5002 with SMTP id 006d021491bc7-71b39501d8amr839595eaf.55.1795129119456;
        Thu, 19 Nov 2026 14:58:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71b37ee35e4sm8897eaf.1.2026.11.19.14.58.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:58:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so61948285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 14:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795129118; x=1795733918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOFGCuOuftk7Jm+H2Fz+MNE7pDCNEdYzVrRVgRwRnqA=;
        b=Jxne70m6JEz6UlbnUZpAH/i+sFqh3JW22zOOEcJCf0bz6MWuCPFZLhMfnbIol9SfWY
         RVOdQ/v53a7RsCO+hJRFPZFlcH4tFT/ugp/ZbXBdr/hPMApbeHAyvN5xw3cPVS4zQsKK
         ZsBY29Ut3PL6DBwRgL2v12bUm5zFf3ToNjy6g=
X-Forwarded-Encrypted: i=1; AL+hErFKt8WxQVnxGMeWkKp7bmsMNemMNwjL7Zmt3yZ7JlTxBrQR9zNGG3uNQqHi+/hbjOF2IoMAGTgKzKNb4Lvtb9L8@lists.infradead.org
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr196533985a.61.1795129118322;
        Thu, 19 Nov 2026 14:58:38 -0800 (PST)
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr196529585a.61.1795129117603;
        Thu, 19 Nov 2026 14:58:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3c2abesm63934585a.26.2026.11.19.14.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:58:37 -0800 (PST)
Message-ID: <9b20b5f9-5568-4ea2-abf2-f609d134cb92@broadcom.com>
Date: Thu, 19 Nov 2026 14:58:35 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: brcmstb_gisb: Check required IRQ lookup results
To: Alex Guo <alexguo1023@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
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
In-Reply-To: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_145842_623144_1A5D5B04 
X-CRM114-Status: GOOD (  12.34  )
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

On 11/14/26 06:22, Alex Guo wrote:
> platform_get_irq() can return a negative error code for the timeout
> or target abort interrupt. Passing it to devm_request_irq() can
> replace the lookup error with -EINVAL.
> 
> Check both lookup results and return the original error before
> requesting either interrupt.
> 
> A similar issue was fixed in commit 47c3e06ed95a
> ("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").
> 
> Fixes: 44127b771d9c ("bus: add Broadcom GISB bus arbiter timeout/error handler")
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> ---
> Build-tested the affected driver object with Clang 18 for ARM
> (multi_v7_defconfig). No hardware test was performed.

The patch is correct but I am not sure which tree you applied this to 
because in my tree (drivers/next) we have not moved to 
devm_kzalloc_obj() yet.
-- 
Florian

