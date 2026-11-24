Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A761C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I/sYiT29;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Jzg3QENG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ULSJeJaQRalsTqoU5W1rSuYhUrpQTwSQEQPfYYy36zk=; b=I/sYiT29YgnWzE
	iOHtqAe++nXhTErhLc0WIM9XHWVjOJaMS+BPmBA6mNEp4gSmD6Ty+JsONxnTBs1oO7xxVJ70xgsCk
	GK623aMJz1o5DbFyFcAmYOG52UTBlg7RUfRnoTvyUIZMiaQpqg06OQ3sAGxq8a2MoqBRhE9H3YWVo
	1KP3PkdyDyTlbvxzxtpczxHVseL8ITx8iETtGgDARsryE+VjOwB/fagb0Nn6S2RWkLaHR6xdVYYHT
	1i3j+g0a4Ha+kpNyrqnsRuFE5js7ZjgdaUO3tgmt4uK36YqWOg8AL7Uv5wzzsn0vEjGCzwU69BwRl
	ITUGqidF8vBuVuy1Hoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrsA-00000006oqz-1snH;
	Tue, 24 Nov 2026 14:51:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrs5-00000006ope-3bGV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:51:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 758F44E41762;
	Tue, 24 Nov 2026 14:51:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45162601E1;
	Tue, 24 Nov 2026 14:51:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FCCE11E698C3;
	Tue, 24 Nov 2026 15:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ULSJeJaQRalsTqoU5W1rSuYhUrpQTwSQEQPfYYy36zk=;
	b=Jzg3QENGVlhk4j/SENqmtOZebmGfYqsEyLpCNZMOV9RWteUNWbt9h7o5HLWm2gZ6UlACu9
	Iz3GhKtkvPZU0gNvccDbmmZeYo63x1kb1z7kPU0wFk0t/hCn3II/U/3dia72VeQgXsZscw
	Zi1TaVrwWsdn2+Rg7yIR8wT1DUNJc7qY5CuIjkCUjZ4T0n92DsYJNRL/QEMQNrjAUOI/m6
	DqrOe8D5SwORGMVaXLAwj0+X8sWjyaBW4VRjsZZse5qJWyDPctLkPRbLS8s4DxFOEA0qHK
	Ik/pYTwLm2pGLZ7Y7ZP+sxFxgNao51qbMd96bpcDXMpgGumI2jHaiqOpm6lW3Q==
Message-ID: <73996d83-47bc-495d-ac5f-539c32b5147f@bootlin.com>
Date: Tue, 24 Nov 2026 15:51:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-sun8i: Limit the MTU to
 2018
To: Nicolai Buchwitz <nb@tipi-net.de>, wens@kernel.org
Cc: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Russell King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
 <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
 <5e09c85c2c33885fecbdf81cd0b9209b@tipi-net.de>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <5e09c85c2c33885fecbdf81cd0b9209b@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_065150_048919_4584038F 
X-CRM114-Status: GOOD (  11.61  )
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

Hi,

On 11/22/26 17:31, Nicolai Buchwitz wrote:
> On 22.11.2026 12:39, Chen-Yu Tsai wrote:
>> [...]
> 
>> FWIW I think this applies to all DWMAC cores.
> 
>> [...]
> 
>> So for normal descriptors the buffer size is bound to (2KB - bus width).
>> Not tested, but I think there is more evidence supporting a cross-platform
>> limit.
> 
> The sun8i EMAC isn't a Synopsys core, so this needs a test on one.
> Maxime, could you try MTU 2019-2021 on your boards?

Sorry for the delay, I'm back with numbers :)

So on net-next, w/o this patch, I see:

 - dwmac-sunxi (Allwinner A20), the first MTU that fails is 2029 (so frame size is 2046 incl. FCS)
 - dwmac 3.70a (meson-g12a), first failing MTU is 2031
 - dwmac-sun8i (H2+), first failing MTU is 2025

The first two are ring mode, the last is chain mode.

This was all untagged traffic.

Maxime

