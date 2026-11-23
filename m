Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qm9/S2t6;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gPwZ6LVs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8d9e+YMOidi5LL2xCdgLdHHyKqQI1BilnlId8h90LJM=; b=qm9/S2t6Pve0ng/1PDa3pMZ+nl
	GyB2fplh6Q6AaxxLcOSKWtwtId6XrffYUCUk9yCaJ+Xeh4kAysE7jNkvKL5kMT6Oj1hvGXzTF9UOI
	4uiNmrFyG5+ct8/qV+SQ8RfFzOythdj94HHT0ZV0YQh6uKXXqc39a2zXVGkNk+BcLC0EBs+riWeMF
	BE25ngGGlFcPibTnuHiurheXhB8SuD3RMg9AWSslMOp5ay+4vTimx/vYQ7lomKgDnA3C7xsUhWWtl
	wd1BhDZZ25NHphN5N/u5Obgmo6cIsdQuHyhAg7GwvlGdVC26BInLfNDJPQV1vrQGBDHF9+rTcSAtW
	ykb56ZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcCy-000000053Cc-0Dye;
	Mon, 23 Nov 2026 22:08:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcCt-000000053CD-3ZW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:08:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A48614E41724;
	Mon, 23 Nov 2026 22:08:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 55E7C604E9;
	Mon, 23 Nov 2026 22:08:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C324411E6AA51;
	Mon, 23 Nov 2026 23:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795471687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=8d9e+YMOidi5LL2xCdgLdHHyKqQI1BilnlId8h90LJM=;
	b=gPwZ6LVsEXxNep/JPL+zIVG3xBj9ljumiCBc3iK3Exa5TwW0IT6uCSkaEQaT/fPUz8if/o
	va8LGpot2hbC6Z9zVrRaE3qG81yGiHNUYXQo+5Nhq3mccRPYc6Ya4vPu1+qM/DGJ8rNqoM
	luwTI1yrAgHoL3pOqqLhlI6zMyelOdpi6fvtS12rQERX7SlXnpnJHfPZjVC7vU3SqBuqlN
	mHmKLEtH0jcBiLbajAGjijg54L08qrRZMVTciAl8bTHDBPjDxF8YI64vUdJROJIGAIp2ZZ
	DTwUMk/FGx1C0tXturzJY3r8I0rReizsoCHpmh/JEqRl472Zm+PZVUzzxGXTVg==
Date: Mon, 23 Nov 2026 23:08:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Message-ID: <20261123220804bcab0f99@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
 <179547125963.75567.6386430167092445665@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179547125963.75567.6386430167092445665@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_140816_436956_37E6BD4D 
X-CRM114-Status: GOOD (  16.62  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 01:00:59+0300, Fil Dunsky wrote:
> Thanks for the review. I have sent v3:
> 
> https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.com/
> 
> Probe now leaves the enable/reset state alone. read_time returns EINVAL
> when RTCEN is clear or CLKRST is set, and only set_time enables the clock
> and clears its reset state after programming a known time. I removed
> the redundant rtc_valid_tm call, the two probe messages and the ALARM
> feature clearing.
> 
> I also checked the year field and the calendar on Almond+. The vendor
> register definition gives BCDYEAR bits 15:0 to year data, with bits 31:16
> reserved. Using a separate RAM-only range fixture, the hardware passed
> 2099 to 2100, February 28 to March 1 in both 2100 and 2200, and February
> 28 to February 29 in 2400. Century carries into 2200 and 2400 passed too.
> The 1970 and 2038 first-second/boundary checks, year 2000 leap day, and
> 9999-12-31 23:59:58 to 23:59:59 also passed. I therefore changed the
> advertised range to 1970-9999. These are specific boundary tests, not a
> hardware sweep of every year.

So why not 0 to 9999?

> 
> An exact-driver RAM run separately checked reprobe with RTCEN disabled
> and CLKRST set: probe preserved control, reads returned EINVAL, and
> setting current UTC enabled the RTC and resumed counting. Each run
> restored current UTC before returning to installed OpenWrt, then I
> verified restoration again from fresh host UTC. Firmware was not flashed.
> Full independent ARM built-in/module builds and source tests passed.
> 
> Thanks,
> Fil

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

