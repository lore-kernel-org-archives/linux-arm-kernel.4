Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED09606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P3ADukch;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DAcUw3xM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OjFjDEv6r6cygeke1RGOx0xnQni07udazDvq2kGmw6Q=; b=P3ADukchbdiuzowSs0XtDoSLT7
	zYkeTSNjxuj3Ef0mdLgC+xzxim2xpyWtNtCGdqSe/WQrpjFMFSqnEa84gxYRAZA1836/ZkCmMQZau
	D9eOpnaPLUoo4BjegxFgeRah1cy0V7VvI2cg7DF8Kqt1kLaBYSDMvPxuQb9m93xoGmEeIBinw5t5i
	UPhWK518tau2B1K/f2XPnOUv1mHCJ6Vsr9MgTFdDm32uHcb3fM27RjnbvVEZDupM1p6O8cw1r9JxK
	cKGs7lnBl85G2RWu6PuiCeQsNzLd9tQDG1gpq+ZDIqDujwxsMSLjHjsen+Wj5sBWTNBZWAZScs2Kf
	hlm5piDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFKN-0000000H9Kq-2ASI;
	Mon, 09 Nov 2026 02:41:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFKL-0000000H9Jt-0wd2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794192096;
	bh=OjFjDEv6r6cygeke1RGOx0xnQni07udazDvq2kGmw6Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DAcUw3xMa4qeJC1vFRGVhhYj1tSb0WLQ9EQbRR5f/o0vdPPNqQcoYpE6ZxBhUNULY
	 5KF9zDQuoC3MtcxEayVxCfq1VRXVOQ0KjPMcz8+YhPW6Imo/0M8F4XV3irgDTvme+1
	 7rvC/x+hNTHcp27znFou+cqgG8H67smYgDZjU78Ru8Iwh+p66c9XP47tn7yTyJLsXG
	 Xfj1g+3owQrm6MHyrwM/9BvS7f1oqMQ/HtM7BsvyDNyNvcoxe8+rPZWIhzmwxhVxGH
	 H0qrLlvfZTgwu+4d1D/eAOv63vQNgL8gqIilCnN5c3r0j72WQrOlk+p+QZ3HxO/sUf
	 xHvau8a+rWNoQ==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F2FBE64952;
	Mon,  9 Nov 2026 10:41:32 +0800 (AWST)
Message-ID: <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and
 GPIO line names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	 <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 09 Nov 2026 13:11:31 +1030
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_184145_471229_DFA39A47 
X-CRM114-Status: GOOD (  12.70  )
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

On Fri, 2026-11-06 at 11:08 +0800, Kyle Hsieh wrote:
> This series is a follow-up to the Ventura2 devicetree.
>=20
> Patch 1 describes the three LTC2305 ADCs fitted on Ventura2 and exposes
> the valve voltages read by the bus 3 ADCs through iio-hwmon.
>=20
> The LTC2305 ADCs use their internal 4.096V reference, so no vref-supply
> is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
> ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
> dtbs_check reports a missing vref-supply for the LTC2305 nodes.

Can you provide a link to this patch? I am yet to find it on lore.

>=20
> Patch 2 names the presence detect GPIO of the optional COM Express
> module so userspace can determine whether the module is present.
>=20
> Patch 3 names the reset GPIOs of the three USB-to-UART bridges so
> userspace can reset the bridges.

This isn't so much a summary as something self-evident from looking at
the contained patches.

In my opinion what you write here should identify broad patterns across
the patch series (perhaps how you've grouped the patches and why, if
necessary) and not rehash the commit messages.

Andrew

