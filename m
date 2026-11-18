Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455DF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKtgIhuD;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cYrRc01Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/v0NAGB4VnBF6v0XxG5lhUKzrvvsFu4Apq5hfrdz+f4=; b=IKtgIhuDI/+ZAs
	3Y8am26+vhvdD9t7hwrG6n9npyjWoUavSj/l156vR2eSGSH2izU5BT64ev5q/ab37qBhFRpTIDVIp
	t31swox8J6Dme/zj34/gawHQK6mDe44ybB5SzreLUXJkGvqgjC77cliiW04FDnGCdZRvATp4RDKXO
	fo2v0P8MgLgMjPrBRkXsp9077HkFvCi/EamW5mghDnd0EXYv3LzxrQOWRTkiGrAydXPk2kxNfKgla
	JzjYj8uovA6yj6Lffyxh1i4ksgdsj39zrOVKsD47yMWaRoytkjrstJs9RFFQ3zB8m9cTJpEfGIX84
	7McibhRrjXqRI1t8R+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkWS-00000009ztH-10jG;
	Wed, 18 Nov 2026 18:36:44 +0000
Received: from mail-oi1-x264.google.com ([2607:f8b0:4864:20::264])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkWP-00000009zsl-2mSt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:36:43 +0000
Received: by mail-oi1-x264.google.com with SMTP id 5614622812f47-563a0462094so609918b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027000; x=1795631800;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/v0NAGB4VnBF6v0XxG5lhUKzrvvsFu4Apq5hfrdz+f4=;
        b=Pj2vfpz+1xOQWN7F0/gbFMIn6YtxHp9Gy6tVWhu1WIw1Pw3jJS6suN5W3BLD8cP5LY
         DYGO6qA6fcYv00KbC4YMcuVeUCXY62yHP4Ca6Rmnri0GwbL71sWTFneQsPp8lsJNLtBR
         9BJNI5Trx9eixpurJeCOviEYn4jsZo5jpWBaExtr+bdDvrwHzCFQjjxlD1IiRmtMPYkX
         BUpf8uVuNHazgX8B6IMvG///XomGSyxmwFC1D6r2Y/jmDLV53lNmyJ1UnPHAkZ3d76Tk
         LGhfh42TqGbOh0jXkffkDiM1CyJBgPrQol7cJu8FYoQXJdZpEaTQaKHJzeVypkgSJ9nB
         h3cg==
X-Forwarded-Encrypted: i=1; AL+hErGIptsyYoYwZPiGmQCc52p6ZejTfXtJ2d8BiK0rjwKYqlzmBNs/NtFcKQ41r/q4dN4phSpR1Pk1X/xNmaHx8B5t@lists.infradead.org
X-Gm-Message-State: APuU4Z95gacdvUIJ30RBwc3qGTjOMN5osAjSSGuMUpuDrrySjj3gqrhd
	JbBLB1z8ejlNrq5J5OKCNyS/0xrOQwrWdQkbu8SqumGrtl3QG7Rz29Be6YTsFx9ekKLNg/lVxuB
	s96srOgsXrRpGXGGQe8EFVhXB+SLznOJK9EC9qcpFAC3U/i/R6Hg/Ek00nyJBn7JUlJZjc2Bpbq
	MuHuMRj1QUkWkVKPSbQ3Hx4S5y7Ndhj7uQIpNthL4S4H0BjMZLiwB8GqVdC0/yzNqyiMIch9jWK
	fciL8cri5XxDs382KhJy+LN9nnE8zTOYhs=
X-Gm-Gg: AYBFou18XMk9zhACP7KzP412DKlK6MTpBip2C8zedO6UTZ2ddFsnYfpMqdbsIhT9P3A
	H9/xAEfyT3wfqq8szsbsro64+SIZsTO3MA+llhqpRlVditce8lxJH8+EZEpG6M80S9pzX8EJ8Xl
	e+4MXfZmdhf4g5eyL3l37D1xcOGjkDHzRVVFsGxIqngrjfTle++/oLTdE98jhw/uL1cjsz6a9ze
	Qt8CGUw1Xx5X4b3riViLTOulJVqRthHL/sN2T9PEgG1Dn76gX5vX0TaAalHW81Dmz658faZw+fW
	gIkvvx6X3ZdyqPYcLPanFQyveO8lzg1Dwk19SlrHH6IkqTt6qAG7xe434JKfQnx1Rcy2g2HtXZm
	O5ybVkw63LFE4zrYb41SV59PdZj2aQXg5TzL1+41WC6G5wP+se9Hmyb03I5z/k/8Ag7S8xxLQdX
	S0zKWiCPi/NFpuXZduyVZ9QXsZPZlsDEhZvt1oR6lw
X-Received: by 2002:a05:6808:5394:b0:573:b33c:1e5f with SMTP id 5614622812f47-57741d18f2dmr3562228b6e.12.1795026999921;
        Wed, 18 Nov 2026 10:36:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4b7473d2c27sm32774fac.32.2026.11.18.10.36.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:36:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c950b47ffso24393751cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795026998; x=1795631798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/v0NAGB4VnBF6v0XxG5lhUKzrvvsFu4Apq5hfrdz+f4=;
        b=cYrRc01Q1o2zRSyBOAWclaIg4Rh0cr5g+2eG7YUdJgbZqK223gwiM99sVVXYrdP7FR
         COkUf+8lNizV0nM4MjY/N8EmY3AMYEZmfGvDIw32TnX0sJyFaVS7BEOLWvA6ZGZn2Bt6
         C2FtVffXJhR15cl+SbhxoEDsouaewod/xZ/7w=
X-Forwarded-Encrypted: i=1; AL+hErFU6kHKiRIceI1PUmn7N8ZsYo2CIZjplYi5E0xSx10NneG3fvJVpZ/k/gM/52XKEeg6WEdCf0PfIHhQf3ZfBMan@lists.infradead.org
X-Received: by 2002:a05:622a:1b8f:b0:535:fa15:554b with SMTP id d75a77b69052e-55d5a544be7mr53848591cf.14.1795026997946;
        Wed, 18 Nov 2026 10:36:37 -0800 (PST)
X-Received: by 2002:a05:622a:1b8f:b0:535:fa15:554b with SMTP id d75a77b69052e-55d5a544be7mr53848211cf.14.1795026997348;
        Wed, 18 Nov 2026 10:36:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c72sm28241246d6.33.2026.11.18.10.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:36:36 -0800 (PST)
Message-ID: <a97169fe-b537-4f1f-aa48-4e74f7e7195a@broadcom.com>
Date: Wed, 18 Nov 2026 10:36:34 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] ARM: dts: BCM5301X: describe switches and use gmac2
 as the CPU port
To: Rosen Penev <rosenp@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261118054758.132233-1-rosenp@gmail.com>
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
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103641_715927_1F71BC88 
X-CRM114-Status: GOOD (  20.01  )
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

On 11/17/26 21:47, Rosen Penev wrote:
> This series describes the switch on six more BCM5301X boards, makes
> switch port 8 / gmac2 the CPU port on every board that has a single CPU
> port, and disables the GMACs that a board does not use.
> 
> Patches 1-8 describe the switch ports on the RT-AC56U, RT-AC68U, RT-N18U,
> R7000, EA6300 and Phicomm K3. They also set the WAN MAC address from
> nvram, so userspace doesn't have to. The EA6300 and K3 get an nvram node
> for that. The port mappings come from OpenWrt.
> 
> Patches 9-16 move the CPU port from port 5 (gmac0), or port 7 (gmac1) on
> the RT-AC87U, to port 8 (gmac2). Port 8 is the switch's IMP port, and
> gmac2 is present on all Northstar SoCs. The nvram MAC address moves to
> gmac2 as well. Patch 11 is a fix: on the DIR-885L the MAC address has been
> on gmac0 since port 8 became its only CPU port.
> 
> Patch 17 disables all GMACs in bcm-ns.dtsi and enables only the ones each
> board uses. Boards with a switch node enable the GMACs behind their CPU
> ports. Boards without one enable gmac2. Boards with several CPU ports
> (RT-AC3100, RT-AC3200, RT-AC5300, RT-AC88U, WXR-1750DHP) keep them all.
> 
> Compile-tested only. Every patch builds, and dtbs_check output for all
> BCM5301X boards is unchanged by the series.
> 
> An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
> the series, write patches 11-16 and parts of 17, check the board
> descriptions against OpenWrt, and draft the commit messages and this
> cover letter.

Thanks for doing that work, I reviewed it and it looks good to me, I do 
wonder whether we don't want to just switch all of the devices into a 
single commit because there is not much point to do it on a board by 
board basis, it's easier for review, but not necessarily to manage a as 
a prerequisite for additional work (e.g.: flow accelerator support, or 
preferred CPU port election with b53).
-- 
Florian

