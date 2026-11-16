Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ePquZ7V;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Eu4LgIXc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=; b=1ePquZ7Vd8JMVu
	nT94OBmEjT4QRSn5Id1SngiZhUaL6LeM39EIr5yVimQdetzqPVaUZd6ObyLXuDO7/V+To8ds9qkI5
	FEQQtYFzDQih2axRQaoaxCaJoIbDgYF1rlTQS/gyit9F8lkOtTQXFRXtCFhizWeoQoKFFpW51Uc/r
	PjW1o3Rr5zC1tQzfTDe6CZASf2W4jI9O1mRwMKBp/v0N77uigKiZ1NAKYtpKaZfySiDBO+vnjFBLk
	jJKz6tpNpVBkpIDZ0MXyoXKZUpuYDBvmwGW5djmyRfrQpzx0HrqgDKCX/Y8NaRimwdowGaBG90/Bg
	UEEpt1oDk2L+4nCUwEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5hJ-000000045eV-0ZvG;
	Mon, 16 Nov 2026 23:01:13 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5hA-000000045dW-1YKW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:01:06 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso3279919a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870063; x=1795474863;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=znk2X46Ebb+yDAvenqosMqLQBgLRH56EI6DvA+mE21RL1DDRyKvf1PNTJW/d2hE3E3
         /ocDw8f8dAIc4rPUEUlvCyDI+706CzF3nMqCtRcb5JrrvNzzJezjFMLpwtvqugp8JYyg
         1lD0HOkOy/gBWB+kuAFErMP1XmM2fNGBzRn4Lv3PrDujnAQcxk3BjfwaMzw4ZcvqgidH
         vF2Z4Y3gEAMDb8j1lI+8MER5/U6VcV2meheSG7m5EMlmh6wsgAInJqShai8yM0hIMyrU
         iabZpbZuCVccRLd4psscoueA2qtFUvXWD8ood9rCa/XVi03k3J1fBujkredviIcPemU0
         FtsQ==
X-Forwarded-Encrypted: i=1; AL+hErGHzFNFA+HgtqCt/7uFnsavrEmIIWi+6sFft4uVqV7Ti8424Y47SALnBE/IOjRl06H0oP0YLQjirPy+pIps9uxW@lists.infradead.org
X-Gm-Message-State: APuU4Z9fbaQx/1OB64f0CB0mwgEl/5+EehfQ5C2E6gZq/h5oQxo7Iigy
	yoYH/yT0oyebHHWSfUI3BlPOAWPhGpyGj/UuQ/hHppppCljshHLis0FjfSefjNr45UJCiePQzif
	2NwtBvAIKDc7Ttnkz68IgrTDXmasc4CRd+PT1WzehJddFzWUW2D+5W7CxipC5YzQcgYqg+bLv5E
	3gmm8R9sOqfys7SvV5vlLnMC3Qju7fWrXCDzZ1DJRIAkpycCor2X9rDmK8UNQ3F4oSfo7ZkIy9c
	g7K11vl5nNW/nBMukowFG1GSAzCa1lVY14=
X-Gm-Gg: AZFdTZcUJTd72SFaTO1q0GikCYLjCRxVx+Is17V/V+OqACfayRrF+bhXtN+X1b0cgNE
	1gD+C0prayi1KCh3misungAV189Vti+Po8zddcoQJ6DnFaHS/kZzXKAeBtmbgQ/tJwcI0uvrPRW
	Qyfs2zVr7RykCJYr2cRnw0kCx75DROOrvpHkCQubSkCcSRfRb0nCmjuBw6y2dIrnsGHW4hjH8qs
	rlgl2xKTj1YIOgihPcDvMO3pAVP67j/sV1RP2oADRP4LqLz3iKNsJvKi12mwOr6sE3nYnVtL8CX
	/ugRADXY7mVR0okxBJBP51yT6lnvQVXMHbQpP+fM5VAihAeSn3WrAvYfxm6GG/PPGTnwyiR3zuw
	rAs3pFQKlQt06+6gEo+9XEFXZVl6f4xy85x8Km7UKq+APCZz7XqjA6A2DGlYhQiAjNHztB15Yni
	UQrErSR3Mw0WHeW1ZVa7mLWfgdP+Pd1qSpim4eo2fo
X-Received: by 2002:a17:90b:54cc:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b1b0816e18mr11866682a91.2.1794870063161;
        Mon, 16 Nov 2026 15:01:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b335bdacsm6282741a91.1.2026.11.16.15.01.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so5157536a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870061; x=1795474861; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=Eu4LgIXcuT9/K6EVjMMUU/LIHJKq5+8+f8dMcaVnBUZl4FXXEuucDzRF6pimg030tr
         Qs2jeGVOH/DtIblNkHKROWyP2PVjGIUEsckH3TyY4B//5HmIsqVVUayS8bDYfxVxPLrR
         GO063F84+TO7dZlhiPXa8DLTaFv+4VQw8cid8=
X-Forwarded-Encrypted: i=1; AL+hErHUuBmZv6G4gysGpSwl6+Pu5UvCbPb3pdxOAASsCmthTa+6rebT0j+8ZJneW8N9XJKra2yKOhnrC6jo2W/Q1WDF@lists.infradead.org
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853188a91.14.1794870060850;
        Mon, 16 Nov 2026 15:01:00 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853156a91.14.1794870060381;
        Mon, 16 Nov 2026 15:01:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1096089a91.0.2026.11.16.15.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:00:58 -0800 (PST)
Message-ID: <d2942f59-d421-4aec-80cf-4c6ac52bac0a@broadcom.com>
Date: Mon, 16 Nov 2026 15:00:55 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150104_409497_606D2CF4 
X-CRM114-Status: UNSURE (   9.26  )
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

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

