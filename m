Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F512606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yeCAye2r;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=agCBCsXz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pWuXA9s+Ah2/QUEIZsjHDshjibf0ro9jISPMeIrZQcg=; b=yeCAye2rsFALen
	BQd3lauLzOWwGwzzMnMqsRvKi8g50mjTDFIFFysQMsOrn7N5oBN/grbsaFArmnZKlrJA54xvP/FxD
	/iAN8rK/zQVjLHhNTfh1sl5Dm+6lwAS1hOl+g+3vNHT0tJBwzxb0hM5TPtFA6SvUKiWSfZArSCF8d
	CBO3s3DDcDfwoUgwee3c0eENBT7KaMt+92HFql1xCwvcURUFzmXNFbw7AVZipZ2f2XGtUdZSohkrw
	yCqABpfZXOkAxXEk5iFJ8sAq1xuhE7aPltfCcWKDZ0iUiVDBOzJzMmczP6RGVnQFrxQljFhZSEzJ/
	ZoqOl/qkfEMuaZoFadaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5hV-000000045hR-1Uei;
	Mon, 16 Nov 2026 23:01:25 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5hK-000000045el-2igP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:01:20 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b18717a193so2248840a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870074; x=1795474874;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pWuXA9s+Ah2/QUEIZsjHDshjibf0ro9jISPMeIrZQcg=;
        b=nQCm4bDRaW7+hJG3sRjPvC2AqdG65G5VCCYHt7Q8jgHeHUIZ4gwE0jRTUPDzagOOYk
         6FYYgNme5BJoFfU/FQKsNCLIifFayz+QaI1VGOCjerVkNQ0kYJgPX1gRYJbfLNsKT9tS
         v4FvJrjB6H7uTn7jPNutj1ho7FwLt+Jcpl4K6gELv/x3qPcRnyceOqkI2Yg5pBLM33mF
         huK8VRtgK8SIAwkP6ubIVBKIs9348owhyhmcXtYQdior24mUHh6JPFckPGSqmiUshkUV
         zwqD+CM2bVSVlAPbjwV9IRkn6XoAREHV1sYRKwKrmn7iE+mP4O5CwD6ESpuaQ9qU9p3Q
         jg+A==
X-Forwarded-Encrypted: i=1; AL+hErE8hdGzGfW/3d3GPIBPHqURfyt9l+AbvQN3EwQabG1NGyqn0Lmt7ErA2URmGZyxZWSbzWohay2/z7C/bXon4+OJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/AC0dKnsH4c8kL+tISgiRiZPXdSEsFKgIYjBPf3/2HaEe5ZeWn
	XYou5q4IIkYts4m2TUYXonKwSUwYkTXKV+mukZlenViegMZ9b1tYwhXdDjdH/mG5gwytjkUe7DB
	5kIUIKi6NtAR1wjlO4C7pmZWRW3gf87Im5qn8qHwDSMqVaR+LKjQw1xXdjFaYieWM1T9Y5BJ48j
	pf6As8ff04T+Br1zb2O8w/ettRVHviOtx/9HVNTi7gk5GCd3yev++ogU2zi30rIciIqRxmnjwBC
	e40M8gjvK6Mwsu2ClARuNJp7Droub8lLYs=
X-Gm-Gg: AZFdTZdB/HrzYvXQlPQto5vWH55V2LLem+PTAs2I+ef5EYFCSsLNuwCiyeMQs0ozu/W
	aQgMU8br0gy8/g48UhIjNcXQdB4nU9dyv7Hrypkp0YDDC4DwQrviWkvzmAjpb1XnJuKjZkHZmK5
	1YnFmJ6B84pIn9UNCfK61DojmQXBRpVw1XqpyICCn5hOsgczHiYg693cMaOcnTAZQps8xXKWmjp
	enRPsnNA06XXO2yLQcRLGcvIlD0hzY36VYksODjhpf8MYa8kO0EbJBKso467aWowNWgOgXyW3R1
	DWb0ycic4Z/Vc6/7NRxuBRKcXYmTcXKNPO7HIoXAew2QtGY/sRyx5BknhNb19+4GHkzevNrZuoa
	lc+FVHlPBtJ/skvHVVqVMyS1w52wR7pVeR/Gs8wdwjFP1p4tH2XDVd5XAuVEozGxf+t7akAfOaI
	0iDAciE23AIpqOymFPH11SenSyjTWpT9QXSYEW5a7d/wY=
X-Received: by 2002:a17:90b:530b:b0:3b0:968f:fdee with SMTP id 98e67ed59e1d1-3b1b0b63d0emr12378477a91.55.1794870073546;
        Mon, 16 Nov 2026 15:01:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm547121a91.6.2026.11.16.15.01.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so3631780a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870070; x=1795474870; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWuXA9s+Ah2/QUEIZsjHDshjibf0ro9jISPMeIrZQcg=;
        b=agCBCsXzZ2Wr6pu/1zO+XRc2rxOctWCAbGzxA6B7xHNV0fgB8QoYHuHSEkKUUKi7Ot
         Zhbd4KHloZcCfHU/YJVhpYO8/J4WfGndCvL0p2zeURUqYxfws+G651YcUMOoG52ZfcX7
         NH4QQgFCHncuBwG2UUQxM6+leWdSieKWJDfhE=
X-Forwarded-Encrypted: i=1; AL+hErFPOUV7VjUWFAMacG/16UGxuAdnpvxLEqOM9c8zIo+yIUG6lCfcLaLztaV1umvhdghbtPoMePJBOP5Y9B4yHp/S@lists.infradead.org
X-Received: by 2002:a17:90b:4c49:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b1b0a3a7fbmr11705199a91.31.1794870070205;
        Mon, 16 Nov 2026 15:01:10 -0800 (PST)
X-Received: by 2002:a17:90b:4c49:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b1b0a3a7fbmr11705167a91.31.1794870069689;
        Mon, 16 Nov 2026 15:01:09 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1096089a91.0.2026.11.16.15.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:08 -0800 (PST)
Message-ID: <3f267167-02ab-484b-8b2b-b68eaa493e90@broadcom.com>
Date: Mon, 16 Nov 2026 15:01:06 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
 <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com> <avopEsR4AqMUUKBU@x1g10>
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
In-Reply-To: <avopEsR4AqMUUKBU@x1g10>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150119_171238_C383EF2B 
X-CRM114-Status: GOOD (  14.31  )
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

On 11/15/26 13:50, Brian Masney wrote:
> On Fri, Nov 13, 2026 at 07:39:42PM -0800, Florian Fainelli wrote:
>> On 11/1/2026 6:03 PM, Brian Masney wrote:
>>>
>>> On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
>>>> clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
>>>>
>>>> The timestamped MDIO write series [1] needs the reference clock the
>>>> GENET MDIO controller divides its MDC from. On BCM2711 that clock is
>>>> not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
>>>> a compatible match, and mdio-bcm-unimac's clock-frequency handling
>>>> assumes the 250 MHz of the STB chips.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
>>>         https://git.kernel.org/clk/linux/c/af7994af5228
>>> [2/3] clk: bcm2835: register the BCM2711 GISB clock
>>>         https://git.kernel.org/clk/linux/c/ab94dbf30233
>>
>> Brian, can you also take patch #3, or you would have create an immutable
>> branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB
>> constant being defined.
> 
> It's a bit late to do the immutable branch now and I don't want to have
> to rebase the clk trees.
> 
> Can you provide an Acked-by for patch 3 so I can take it?

Just did, thanks!
-- 
Florian

