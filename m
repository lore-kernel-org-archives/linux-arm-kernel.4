Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lgIYN2jy;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LWIvNOLn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=; b=lgIYN2jyAbyzts
	SmUjHqYNJw17yUfoRDfs18CwvrKWtU78ql+BgO2+pHDlkfXb6q1Q8OpBHh2liOHXZ8+KAWuqHicuH
	hXn/E3fZZnHnYlx4KRAnRB9as5mddJQs7+zFgDksxZnm7+nAMYyklicFpv0Gqb6LVVpNsrjUM915F
	lmOL0SlXtEL1VI3AbcX173gnR2/Hm1FafkmZJB8bPgt7mqKYyeYpoYwwsd4Y91+sKHOEjU0rTBild
	jxGMqHH4IU51EwDCF1TzgDdVk4AIY93By0YcJXbFNwGgdXr1mHZ4dKMJF1UCOLBXCzl5yveV9eNjX
	Js1yXLlfFhg201jLCz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4se-0000000FKKB-0FDi;
	Sat, 14 Nov 2026 03:56:44 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4sb-0000000FKJS-12NQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:56:42 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so650066a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628600; x=1795233400;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
        b=A5mc1iv13IyhH9W2XUPkGS1+GPdp0WUWon4360cJoomUhPMWSbpDK2zbItP8pva2DP
         v3n/vifo933FnaEduuWU3LT2lYKsrRsncwPM9eJjDeRwPWsK97f/YGHb6Nhpi3qXOZwE
         PsdtjADL+h7ChVIMDzUTR/EwEsQBxLUm+Vpj0zFI3ETuH/iRSSItJTRTLxzBAAqL+015
         jDQ9iBVnS8Dwh5q6CTIxxDpbSzBt+nFPbI/JmDuVTwDh+/ctkAsLMoKi+ANuSNXZwNuG
         BSPhnR8TVCiQedBfvZMRsKuWuu7gMWzKt1MglzNTz4GQo0NgpfuqegTI/TxkvuHFQt0u
         31pQ==
X-Forwarded-Encrypted: i=1; AL+hErHG3DN9K1B8wtPunCMKpC9bVJePeArpiCutF/KLSze7kZ5XXPY2AAUM4n36RVCuYpcT02kJ/AF7DjrvYtPcRHua@lists.infradead.org
X-Gm-Message-State: APuU4Z/r8+xEsMlEEp1sicX5OSweSpBbl3QSvv85os3iPEKDfjZ0X3Xd
	zlP0qsKXaYrupYU4zsApaWKifkFBPqb6pUcvRQJqbOhYevZovotWoJy13kgSo5zAOCaDZZT6cIr
	EeRcIGAPSdWfaEBIVHre8H4lD9l94KLzy58OCAAJ+NdqiD3TUXk48PAAYdq+U2XK/l4tCxWG376
	o/K7uBheY53tgZ5NOCt+hxIzQY32lcMz7FGVMH7zi4eW0CdyyGjne3ebzzDKFVnr/gkm7pySOCk
	38ub/Py4ZcUrE7cIxDig+MzCH1058EY878=
X-Gm-Gg: AYBFou3v9MCdPN/WjlhnlyZeghUkUGJnVFVdM1CD5OOvNNaBQOS/RoLDIiwlVrhnFQr
	ZiPjZLJdWKgzZy8K/Dsb5hENRJ0Xaq2oPVPkmcrh2nbKtvIyWrP8GSbIq6iF1DIAipPBq8yVvKW
	0/TP2vlFYgK4GFZhlG3JUIvVAn7HoQcaZTCUrZsCz9LnBP72NEYyfes7Lfg4h2am4MWpyPFRnoU
	W1JqO1m9IPCx0/OQxiZPeHpEonwWUxdqjiRmoU7RTD3g7kpbDs+x7QUBdY3dy6xLeIXTFvFbrmW
	BMoXeGfn6yzKsWENZlFxWN1ys6upuQRUtA4tjjN85Do5/BeiRvtATxM+ug8YnnKde64RISYoy2f
	KUlZNjfZgi+B5dTCHNkSNU6gPZszE1WvGiWcn8DW5PyUpgD/EEceRgQ2/ADlzPEGyVpORIyRd9/
	xoyR895eLtYwhEY4rb8tcN1Qg+W6dTt4HZ/h5E9PNi
X-Received: by 2002:a17:90a:c88b:b0:3ac:7449:40b4 with SMTP id 98e67ed59e1d1-3b1b0b5316cmr4572998a91.45.1794628600387;
        Fri, 13 Nov 2026 19:56:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c1352d3csm1269043a91.4.2026.11.13.19.56.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:56:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2022796eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628598; x=1795233398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
        b=LWIvNOLnk+/cIsgk+QG5CpbEvUcRNbQ2hpV+V0Nx4Ps1M1sYPVKPe9/so2d5Rt5Yqm
         vpPKHm6RzFGoQqXww12GsLESROmycUNBpp431C203LiplcQ7bWiAwlQxYL1pipCi234V
         uAiEB1pGQg25Mlc4I9XREb9RXvuHrVZMcDhhY=
X-Forwarded-Encrypted: i=1; AL+hErHIc5m0Jva6QHWLYLSvTjbPE8BadiHWkfGdY9tAcaHinRnM6c2gmOQr1y86KtYqYg21urYEm9aD5DG+85mzb669@lists.infradead.org
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr4008669eec.28.1794628598240;
        Fri, 13 Nov 2026 19:56:38 -0800 (PST)
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr4008634eec.28.1794628597487;
        Fri, 13 Nov 2026 19:56:37 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm12194066eec.1.2026.11.13.19.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:56:36 -0800 (PST)
Message-ID: <785b0ee1-a1e2-4f57-bc4f-3119615f8c63@broadcom.com>
Date: Fri, 13 Nov 2026 19:56:35 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC87U: specify switch
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260907195924.29510-1-rosenp@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20260907195924.29510-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_195641_293390_A48FED30 
X-CRM114-Status: UNSURE (   7.49  )
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



On 9/7/2026 12:59 PM, Rosen Penev wrote:
> Add labels to clarify which port is what.
>      
> Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
> having to handle this in userspace.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian


