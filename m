Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50744606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fnD9Rlay;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K16kuF6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=; b=fnD9Rlay43yjLQ
	5V8Loo5d1qcLp703/k+M27QJqJOMVQbVl0pkoCxWslfkaMrnDNQGgjAtwnCBWM5SwwzmeQg0C2rNj
	+qwTOsXeTg0U6KgzN19MfddZv+Sw7TbQxZIBPc1VQAmCnjjIRv0rZNIrlC2PVeLBjky6rYFs0t3wl
	50r7vtCvVHYVjg56l8Ema1e54KytSjfvYMPNaFNHSIZyE0fEuGQ5+Awj1oDAUxqkUYi6bdamRI1B7
	XRS2xlN91gAVGJJcHkzt+q423r+2HfiY0Bm8+EjjhidVCXb7qyNz8KxXIUZs5c87yvFhXrwHuwLF0
	/SZDt54KRs/qx/e/6H3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4cM-0000000FIfI-2U5g;
	Sat, 14 Nov 2026 03:39:54 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4cH-0000000FIdw-2l9Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:39:53 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cc147d86bebso887070a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627589; x=1795232389;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=LkSn+lPMXSGwCZKhiqtuII5sPylvVtqk4WV9EW+vpT6gxR2OML2HQu5rZZHDu3KlH4
         sCalsYPuTbKIJ49CX+rSTXgW5Q2jkX8TnhuUGoGjtYi1pn6W4MTgq+yeCaDx7MxGz0jo
         8yvXExQeFzPFKXkE1EPGyow3SIgnC1O8x+U8WjdGzQ+dGaCGysC2xc1MI13kBFS6VUoE
         7OLU69osOJikRDqhcInqYJGM605xC4X3HAFta3ybmA0R/07Ixr4gRlYy+51HDAbv4R1t
         hkiVMpLKJLdnsRMpJHGXF1iTjxUjMW8qE+A+w+YitoP6ud/kjrqbBV9KIKfg4A3UUa6y
         y1GA==
X-Forwarded-Encrypted: i=1; AL+hErHmtbpLpKwSSC44HoufiZ4n5J442kgjUMM2YGqBAAhQsVi4t0JIB5Fj8oNGlOl2HjNNm0L4Ps1yeTFS+KNAgE7H@lists.infradead.org
X-Gm-Message-State: APuU4Z9DjkRi+MMrIZx9UOi4RCHFODEuCaRtcMY/EZtrNhSEXYbM1jyM
	AUQhYLi6zksWT2K8yu/TyuXLr8mM7wyWD/vISQa7ht2XUbKxhM8ZtO3Ev31aDNeiSzYb0v3fbRK
	cbq2FuP+OgzJhF7Ol3RqOIZuLgHYM9rxAFGGfpF/c6LWLpugGv6aSdmwG6F2HRGeDSE8dVv3n4/
	oluH+oW5j2N0e/w/1Ufdec/vkUYBRTCBCrwUvjyEBiNLXVoEZHULrTUlAjjeHuPX1+LwdWWQbY3
	whBbQxMJZ/eZhaO6OQSTLdAFBgUKI+OOqI=
X-Gm-Gg: AYBFou3mjJCkOLzzOeM0KPH8EyhK5Zi+PmDBRBJYGdZb316/gMJB38o7PZZ/yNNcTa3
	XCMr9dkv5n5vQAReCNukgQxpRqDxvJ6X3blTdcsGWANg06iOFTY26LYBM6TIwlBBf6Rk08Vtny1
	k/6AXsDn5XE1GfF0U5rhYyQstC61lZIgSHC66sSaj+78HByHq/2QKWB7VK6Y4OORxKunTK28njE
	OeDSFmpYyevShJ+HyNfwk8YhDx1A2q6/hV27qvNKJIl2c0CLi7xFTiqQiM+WIMPVUMPsc571StR
	AL7lSievJ3KmE6BPYtXfOUM4s5endkZ4UcIUXvnEaQV54nOuSQTRsgdXagwrvAHyH85/QNTZdF+
	KJcgUnflSxeR8DUu9sIKQI8drlA/YmgrhSUBK1nSNiRstF2GAfzHfcUhBkTZq641aryuF5qWxd+
	rWZgWrkJ4gylubkg8q1OyPTKtKI9qqbYE2pBubVpsWCUA=
X-Received: by 2002:a17:90b:4c8b:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b1b0d07d05mr2874899a91.35.1794627588650;
        Fri, 13 Nov 2026 19:39:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdf4dbsm9242396a91.8.2026.11.13.19.39.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so1221563eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627586; x=1795232386; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=K16kuF6U1ZM6krnG4GHWRs9ivsVT9X71VSEaHZgD1wKX/2AwyzBiHytYknysw/JG4n
         k8YRDXrKAkzFoeYTHqIn8K0xXEH+Ves5TWtlXSVz/3zo5iFDFQI0Sjs0NDMwuGaBVsTe
         E6n76I7VTpmQ9pdcCqdtjTOPHoIUR7Gx7iyaM=
X-Forwarded-Encrypted: i=1; AL+hErEtHZodzy7MCw1TIyRGpMm7lfS+oAbWt+9IN0Byyk5xGgSjcgqU1QkO3LSnzDhK66WTiH7wT6epEBzx00y6j4UX@lists.infradead.org
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720462eec.12.1794627585807;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720422eec.12.1794627585050;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm12603206eec.23.2026.11.13.19.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:44 -0800 (PST)
Message-ID: <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
Date: Fri, 13 Nov 2026 19:39:42 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
To: Brian Masney <masneyb@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
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
In-Reply-To: <179358503716.355577.9187303706042543606.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193952_537223_EB140237 
X-CRM114-Status: GOOD (  10.47  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/1/2026 6:03 PM, Brian Masney wrote:
> 
> On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
>> clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
>>
>> The timestamped MDIO write series [1] needs the reference clock the
>> GENET MDIO controller divides its MDC from. On BCM2711 that clock is
>> not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
>> a compatible match, and mdio-bcm-unimac's clock-frequency handling
>> assumes the 250 MHz of the STB chips.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/af7994af5228
> [2/3] clk: bcm2835: register the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/ab94dbf30233

Brian, can you also take patch #3, or you would have create an immutable 
branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB 
constant being defined.

Thanks!
-- 
Florian


