Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C602C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/YzQm3P;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DrZ+0Dbq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wYErie+YgFKgwdokQKPH5aMCl4CIj8MWz6Gs+KkWE4Q=; b=q/YzQm3PzwdGDg
	L0zZys522XRoPn5ChbZY3fwlC96iRLBSPjuFtUceuDjfkr8aztw57yGFbdjzWRHcX1uAD2NTYAaWc
	hltCXJQ2ZeEdBn7pEyCOJz0oekCGzDo6Z1XtOVly+g/WZg8CAP6Dk4t6fG6JWmhBBqlRaOo+i9CNy
	oI41NJVpA65W26leZgDZfJuC1jEUWK0NHh+rKBMcLkce7fOBMFHiDzRTwDzC3Ml4pPF00PbINAhUg
	inrhWLg64cC32V5BICXzTxozY26hTvRSq8+lZ2oeBkwEXbl+TNs8aK+W+TS0alzcXJUfoxvTL8L3R
	Z8JgklKQqYCSwqADNISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAYt-00000001N5A-2miK;
	Sun, 22 Nov 2026 16:37:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAYq-00000001N4l-491Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:37:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 243001A1786;
	Sun, 22 Nov 2026 16:37:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E43DB60512;
	Sun, 22 Nov 2026 16:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BB5111E6256E;
	Sun, 22 Nov 2026 17:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795365420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wYErie+YgFKgwdokQKPH5aMCl4CIj8MWz6Gs+KkWE4Q=;
	b=DrZ+0Dbqt9RADd8Bw0JW46aL8a4DDFcS/lCIDEsCpAuPVGKx2tkyuNCj4BgEpxH5fTPYu7
	DiQAl7hy+njY2Vwjw2kr04u0Pl5iCuvGYr71O5Gk8/wSnKLYFcotjGB/BaHOuYxV7urOar
	LGsljGLFaLpqnnOuHXPjpHMn8HuiPnVTvYAqKXwp1anE/mzPSuKdKBtKLPG8V5POd5BUEF
	U6fgFL00bBiz81vNc9l3qyuXfwo/W1nrP9w2SzHnmDt1prfFSfCPq3AjGpbOe5uNG/2NDQ
	M9evLcT0oe20zcH9OX4txkjLA7q4C0hJAHD/XQg+5EkD/h1Qb5gM2E6rRN8qkA==
Message-ID: <3459ab2c-e35e-4fb1-80d0-b79991b5bc2f@bootlin.com>
Date: Sun, 22 Nov 2026 17:36:43 +0100
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
X-CRM114-CacheID: sfid-20261122_083705_172967_AA8E2250 
X-CRM114-Status: GOOD (  10.56  )
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

It's likely a synopsys core, but with some wrapper around the register accesses,
hard to tell how much of the actual dwmac is in there ._.

> Maxime, could you try MTU 2019-2021 on your boards?

It'll be tested in the nightly runs, I've setup some local MTU sweep tests
following the previous version of that patch :)

wonder what else will come out of it, I'll report in the morning.

Maxime

