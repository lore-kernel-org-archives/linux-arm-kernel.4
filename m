Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jfKydFZP;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SLb0PxfJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=; b=jfKydFZPfByhQG
	YWaihWANpaTFRvx2Ij/RCqndy2jmstuDMXNhUhAv2a9tiaTRxPCxOYFKH4qttyEuQgitp8QbDazQc
	q+Iu/vQoeyfbzNTmSdPFKp6FNmK+bKkfmyM0SpmcjHY5K+sRlx0fxHn/0B8JW53bnHWAS+xITrgRM
	SZyu7NDu7rQyoIfma/08J+0y8Ke6hdWup/t000PJcKqfZRtuUeidWqXLD6HWLgSwJTmWGNq2xFfOA
	ydiSPpCbcyf9VzN2pH3TF2xnKnUlOidEL8RfMiMkpbV6pn1N9nqt+DqHI5ikQQsRsq1eoCbQYwptT
	fJVCPx2LGuSCQhii80bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp1i-00000006QDr-2kD5;
	Tue, 24 Nov 2026 11:49:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp1T-00000006Q81-3sXZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:49:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso48120795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 03:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795520958; x=1796125758; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
        b=SLb0PxfJaSEehDCG29EP87znubKzT8rU1Jh+I65GQAtPUbY9zq3vhfhoq30n/zr9PZ
         IAQO6GdSX+1wOYky0j7KakgQQiTO7Sa/ZQvBt3/8OtkLG4j9OHgcKwCxGKvKg9I7SC/W
         mTj2CwH8N2IVBSeQ6rZp5/NoE4Y+wa+dTEq1W9bIEjws60LJzTPy4YHR5CvQAsm8Qsht
         Y1AkcM1eYM1eXhueLM/7cMMMIYEXdxcQfJQZXQcaxMeBXfSPcjLr3ql3eVjMBs3pUggA
         5LyxqnkftHCHGK+kAO6vi4B+CX/lcta4qg07BBFzRyNRf83SzHVgzNgpxCWTWjrk8/LG
         Gn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520958; x=1796125758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
        b=0hOZn1NJIomhZNU4RHqOmZ+zrD8pyeWXx6waDiFsjPPbEM1wPtDHOprVN2fhNb03Or
         Jm4p08wcJ3I9MUuY5x6N6qPdSNGGYdr0/ABDRy72fuAsiKvY0ewQcJe6Ii4FswKpXnmV
         E6TlS4Oirc6faQPTFf5Y9zm0OsfrP8ZRI60WlVvGTAK1f3cGI9dg802RlBaDm26lsQJL
         mB3YWV9l7rndaTR8zNg++Fnb8aOodgU2syEMVF5TM8kLwLYzPlUzcXP1lAZEImXg5E5I
         v+d3rWPMRR6u2lz51O0CfeHAvqEMb3BR8n9BCCEjPBtjzSC8UmSJmtJpeehKqs8WiBy5
         x0Fg==
X-Forwarded-Encrypted: i=1; AL+hErES7VLihoJRZCZYWq4dbgIrFKnuO0cp9JDmQIpVgrInoGCUnZZiS4Bl+VMti5L+WgtSkiP6QUzGyVeCMkSkLFLC@lists.infradead.org
X-Gm-Message-State: APuU4Z8ryLWUG5kxisS++AQeXpQXC4NhwxSr2oD7nx+gpwxIW56pvIQ6
	TXVaffFLqpM/+TVp/41gJU4PGm+b3AaX597X3IhlbrtZ+c+nhwwoMjWRIKozCr/bP3NAM4ncHqh
	dTdyF0jE=
X-Gm-Gg: AZFdTZdpWIbtHwbKco4kCz1UFkjuN4//OJYIrtHZ0MmnRPVTfyhvosKgvuHaj+okw1/
	r7cQ6U9mrdnw4huqWvsazXXJOb3YxG0o8PRI78Raj7QY+LJkzvuElkzB3+jsQ0sNKEesFUVdb7m
	HmjWLYoFuWm8JBlwEQw4NP08hq9ybjetls23+rwd+AwhI4stQiLZ4Ri7+um9J46ZnbSWnZuqmwV
	lMny9sp2mrwqf+Zn/YaqO//eji/qTv/luTv/QU6xqYc5rWLFnkpXTa/3+hkGb0Vg0t3kTuCx6QZ
	TnzMI56KqLUBOS0XwV7sIY29zTfwUcDe/0x+7HZSbYxGbhBDGezPik2LL4hcOHKfqbZj+WNThrf
	cUg3QGt6r5isccNThDzSD6k8PE90Ha6vf8qJRn9HEkMBJfXLyd/3S/NPvcLzx4TrSTTaw1Xohwi
	TMyssXIHtnt3qqf/5YSjcizrzGhVdbr05LsuJWWLaBBVaR1sgeTS+2le5UgTny3L5USv2etVtEk
	nbh/MyDaG1X0G6pNpDOxWeebQo0J2/wWraRGjh6EW3050oPnS2360KVJocXuts5FgxVuc+fi6R/
	3Wbs3ACPT4UzKIvPWFd1laUjDuFietqsNOiovDNWwwzAvDWbW7DnKctFhj+ku+ZFGXAOtz2VIhk
	jaEQcFVd20/5MMM4eXsJc9Pc=
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr290637705e9.16.1795520957605;
        Tue, 24 Nov 2026 03:49:17 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm416542295e9.10.2026.11.24.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:49:17 -0800 (PST)
Message-ID: <99f6fa65-33f1-4865-9745-c092fff2e032@baylibre.com>
Date: Tue, 24 Nov 2026 11:49:14 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 7/8] arm64: dts: rockchip: add NPU (RKNN) nodes to
 rk3576
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_034920_817943_C3C7072E 
X-CRM114-Status: GOOD (  11.13  )
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

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add the two NPU cores and their IOMMUs, disabled by default. Core 0 is
> in PD_NPU0, core 1 in PD_NPU1. Label PD_NPU so that boards can give it
> the NPU supply.
> 
> Set CLK_RKNN_DSU0 to 594 MHz. Nothing scales the NPU clock or voltage in
> mainline, and the boot rate of 786 MHz at the boot voltage of 750 mV is
> outside the vendor OPP table and gives wrong results; that table runs
> up to 600 MHz at 725 mV.

I still struggled to understand this (particularly the choice of 594
MHz) even with your notes, but I think I got it now. Suggested rewrite
that will hopefully make it easier for others:

---
Set the DSU0 clock to 594 MHz for now. Radxa ROCK 4D boots with the DSU0
clock at 786 MHz with a voltage of 750 mV, however this gives wrong
results and the vendor OPP table suggests this voltage is only workable
up to 700 MHz. The rocket driver does not control the voltage yet, so
594 MHz (GPLL/2) is selected as the highest rate that we can select for
this operating point. Voltage and frequency scaling could be implemented
in future to more closely match the vendor driver behaviour.
---

Please tweak something along those lines, you can add my reviewed-by.


