Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46493606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JFXAocxY;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=2yGVPMCs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jaSKFlCu54zHESqkKubj1+NuHGdKJrU2G8EmITP6xpw=; b=JFXAocxY56Jf9w
	AYOPFcayLDBPgFps0EYMN2pEAPhnfkTO8rd80NT0eD4mzv8wVYnLh0yxPUbMxmPrcDNlJ0lReuiSW
	CNw5lHIHkAKVLCr8zlDeCoN0Fn9OKBYpisyxmAQfqlXQouwE3p8QEF4TkHoiGbDjCz6IxOJRlp34w
	U/tPuZGVnWTHeJaaL3OmxrzgVM5RCGdusvS2TywZprsUC3fIGxe0vM0sJ/g2TBdTOCZoG9kiqA2/1
	OQA7VwH5I/SO5yXZi9gv5pwN7h5S+XE4p7FNVRCHbVfEJCH3fneARuwz3ECGGVchHAllkUZGNH8bg
	vHMU1E4UywnxJgzrgXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAbv-00000001NH7-0j3l;
	Sun, 22 Nov 2026 16:40:19 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAbr-00000001NGO-1vAr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:40:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F341BA023C;
	Sun, 22 Nov 2026 17:40:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795365609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jaSKFlCu54zHESqkKubj1+NuHGdKJrU2G8EmITP6xpw=;
	b=2yGVPMCsKB3mt0D1EmjrbYxsJH5uCeek02v4QJQBgHuca6yxEp3cPBxTqiuhbjp+hcD1JT
	qWhCCU3Db1/ZeHtjVZ0KUsjfo784QkArs/MesO7Tp1bywtjxJIb4D/uw5+kYlbCWJa+5U+
	9qHtDaipoqGplt0zmmk3wGl/FJS84OmLJdYpfKYu2I+lp595UR2ukxDaAWovWK/Tv9QDEU
	Am0kA1Ppi4cJd/pz6za22JNtpx/tsnufFctYmMXIGntJVcJEym3h+o4CjqT/onWnDSe5wp
	cKJ7GXEDELKLFaYYUoUu1mFGgmS39jyehxTunpFReo557C9Wdl/AwbyGnqtC0w==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:40:07 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: wens@kernel.org, aiyengar1990@gmail.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, LABBE Corentin
 <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Russell
 King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-sun8i: Limit the MTU to
 2018
In-Reply-To: <3459ab2c-e35e-4fb1-80d0-b79991b5bc2f@bootlin.com>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
 <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
 <5e09c85c2c33885fecbdf81cd0b9209b@tipi-net.de>
 <3459ab2c-e35e-4fb1-80d0-b79991b5bc2f@bootlin.com>
Message-ID: <8a11d9e72123b68d89a0422dd9211e88@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_084011_660095_0627398C 
X-CRM114-Status: GOOD (  10.63  )
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

On 22.11.2026 17:36, Maxime Chevallier wrote:
> [...]

>> The sun8i EMAC isn't a Synopsys core, so this needs a test on one.
> 
> It's likely a synopsys core, but with some wrapper around the register 
> accesses,
> hard to tell how much of the actual dwmac is in there ._.

Someone really needs to draw fancy cheat sheet with a stmmac family
tree - lots of weird uncles and stepmothers :-)

> 
>> Maxime, could you try MTU 2019-2021 on your boards?
> 
> It'll be tested in the nightly runs, I've setup some local MTU sweep 
> tests
> following the previous version of that patch :)

Thanks!

> 
> wonder what else will come out of it, I'll report in the morning.
> 
> Maxime

Nicolai

