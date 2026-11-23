Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IMgznXN9;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JFv8N5ID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=; b=IMgznXN9xHitwW
	g9VQWvpXNmgLTgEdx64FxGgVHh7gKV/D/bbHsctmGYbKxA1qamK6EQddelZwSoR6KKrO/cTcZ6+8M
	yJmFT5yM89OLjFHIPH9VNKTYjDMYc5IC6fgINz74ZDCtV87RMZdPbS21BFaRPzK79eOICM3eoMzlR
	nHCiP7jD82/OTcEZR/pqS9whJNQEAGxd6O77bFZrbY5PkVu2wP/N3JWyeyA1rgamO5QHf93rUfLUm
	/MQ3hKTzfm7IqXBcknO9+Fm8uPVal4HtkO3U13dXLHqxLPvb4HNljT09PGOPgkqJWKKDOJk59ZwRN
	OebBZSrxi9q1X78N97Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWaT-000000048il-2v1c;
	Mon, 23 Nov 2026 16:08:13 +0000
Received: from mail-dy1-x1364.google.com ([2607:f8b0:4864:20::1364])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWaI-000000048eO-0mw4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:08:05 +0000
Received: by mail-dy1-x1364.google.com with SMTP id 5a478bee46e88-38699cf08dfso3376876eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450080; x=1796054880;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
        b=oPf5Ay83ISmGCHZEtZLE8ZTTHirMhM0OgEUbdTvdsKEEYSKgN8l83WbuRPu3PqNGdF
         2h/MPl1bzFisRTVibjmm5/aYxMjjzWT88gBAPIQGOzZ1yJUCWEFh+a13IpsqaEvS/h/1
         B+FS46sMJxAXkqGyUK8P0Cdk3tMsBg3RHRiNkJ/4pCNjPENbQ+a0lKWRkjnOK/UPJlz0
         nn3zFjsA7ZoUy2a+GFVd2CNtcbhJdeZcMiiZiNqvLWdXdJL7tHkUkbBwhUsesZ15yiUj
         WhrDwgYLZAIk1FqrR0mnBb2qMaXXCxQEVk/xtzdvv6bFZi/6FrfFvr5bEl2NlcmAbY0c
         xnaQ==
X-Forwarded-Encrypted: i=1; AL+hErHECPx++Utyk0fN+D1yqbiQL7FbmGcmnCFcX8uIKRaOHkpAQ0Y258KbvHrvngVMOdtfc0v572KUuwA2+6MKreqF@lists.infradead.org
X-Gm-Message-State: APuU4Z9NAjEyNQGCz03J8Kv9MvNSnEEkaMM54/are9QeNKmuItbw8AgD
	Y6jJv6E52lvpS5ArZJMl20Wa74C2Q27ylquXrwG0yuRyCRjZTnMzTJUkYq1Marc0BY52OKqgpnM
	s68BQshUuy+AzOpPXTpGuBlls29JMSvRjaEtm4Bl0pcQ/6xO7IyYVsuZFmUp0ZO9RaGV/TXs3OP
	r5z5MUa0JDbZzDKcSBJIWkW1qNJmor1C8Nv/X7/u1b+5ytLEkC2bPYF5VYhb/DLiI9ac2Qlke8K
	n0StyrA06PlPE9B6BeiQQYL7YVlh0GT5Bw=
X-Gm-Gg: AZFdTZdd6VmRN+QfXpoBc+8hWC4ELvaLvFyqEygkjDfEOcW6RAN5HKRMhGLqRDjB2iv
	KAoUXlZaf5gA+8Mlw/0gU0gufG4ITz9ujjjidlfhlkI8Z7A8Dxn3nlxj0OCJK6o+puRKJoGs6ma
	3EeaVjAPxHMhk31U1ym1mOJF2Krr0s1sNP3Mnea2slCG5Y0CXcYeIfhTG/FpD6cJDcp/tw3LN9u
	TXXVa8hdBvkjWQOhUggYDIugUdjk9P/epODedKob53Fft6TEFpbbXQbNNonpaUbafPe8a/P8DEx
	CHQ2IUVhOl/ZKNnvbNOTzTYko6PIBY4Agl12ixLZM1FRAd7zdBGITbiy6iBfJ7aD/PrjtNZPXwI
	Yz6SE2JEEu9A4HYdbrQbOMWX5mOIJEasEabLD1zmQ+Apy32NeD630WWd0vlmSkKoVKaqxgTbESs
	Y7ExRzFi/50S/QntUOoSUoDT98i3/WfDA341IKGEyp24k=
X-Received: by 2002:a05:7300:d083:b0:380:f112:3cc9 with SMTP id 5a478bee46e88-3857093f06cmr12576309eec.38.1795450080364;
        Mon, 23 Nov 2026 08:08:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385672cea3fsm1416265eec.14.2026.11.23.08.07.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:08:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a65fca25so2049563eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795450078; x=1796054878; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
        b=JFv8N5IDbbzJI1VmjZhZ6CxJhjlL03u4ggjmIo5sm5RcZRPxC8RyWMuOmVXMnoMniW
         ACixtrudXvDK8knBCFl6zTAzZXkIbZdI7+EcNcAtfwfaCvaaJAEEPu3mgQeve24BA44w
         VB2sjjde8/c+pcixeXPJYExR3xcQkjNNio6CE=
X-Forwarded-Encrypted: i=1; AL+hErH1FmbW8C2nLE3kGnUyYWh7PhHx4iaTlJS434hvPKWRbTPZJEMtaqGXH6bGYHbvwXIjd0S+Ytvv4pH8MeWnC87a@lists.infradead.org
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr19381599eec.27.1795450078308;
        Mon, 23 Nov 2026 08:07:58 -0800 (PST)
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr19381556eec.27.1795450077586;
        Mon, 23 Nov 2026 08:07:57 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm38560278eec.12.2026.11.23.08.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:07:56 -0800 (PST)
Message-ID: <c5e542c2-4d34-4ee2-8bd8-e3b5b5296f7e@broadcom.com>
Date: Mon, 23 Nov 2026 08:07:56 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v4 0/6] Fix SATA support for NSP SoCs
To: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <179544998187.275844.18441245364658646762.b4-ty@kernel.org>
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
In-Reply-To: <179544998187.275844.18441245364658646762.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_080802_393263_5852DC40 
X-CRM114-Status: GOOD (  13.06  )
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



On 11/23/2026 8:06 AM, Vinod Koul wrote:
> 
> On Thu, 29 Oct 2026 14:25:07 -0700, Florian Fainelli wrote:
>> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
>> which was broken due to a number of things:
>>
>> - the SATA PHY assumed separate PCB windows when a shared one is used
>>    for this generation of SoCs
>> - the clock/reset (IDM) was not being configured by the driver which
>>    meant that depending upon what the boot loader did, or did not, we
>>    could have had the AHCI controller still in reset by then
>> - on some reference boards, the AHCI controller is not DMA coherent,
>>    assuming so leads to all sorts of timeouts, data corruption, etc.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
>        commit: 2a27baf6e203af422db2d84f9f382153612679a9

Thank you, I took patches 4-6 through the Broadcom ARM SoC tree.
-- 
Florian


