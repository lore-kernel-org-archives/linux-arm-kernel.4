Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550A606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+V0yOYN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFxmBl5E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9TBfIy+kK+77B0isGngbw1NGhsBOgn/ifky86nGhGbc=; b=N+V0yOYNo1Ijuw
	uaNJnX/bGeMckenOrNQ0HcOru8u90foBc/VAMcR7NijlsdPrtqGjv7gt/Qu6vojWIzKJu8bWDY8ZU
	ygwVxvV5lbc78a9TM5f8LqJUp1R1RDUXMmvIbgOB6jWS0MKMLyCGj5NrjQs02QhkSJSODrj/+Yb6p
	WbfRhJgmBQE4XMeLjlYaPvIQ1s7a15H2kH2gsDQGIwYNXu6pmJPgwSQ1xV2KAJ8ZcoHjoZJ0eIN62
	qb4j6gdzaAuJyF+wP4vs4gxVUId5aqTKTGOIqCCFjyGNQcUun7EBpmsoP69oEm0YYlUaY3vbPkw38
	YLKlbPW+L/oekhkjvtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoy-00000007Eh9-3S7n;
	Tue, 24 Nov 2026 16:56:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoU-00000007Eae-1dLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:56:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29C4E42434;
	Tue, 24 Nov 2026 16:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC3A1F000EF;
	Tue, 24 Nov 2026 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539374;
	bh=9TBfIy+kK+77B0isGngbw1NGhsBOgn/ifky86nGhGbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YFxmBl5EzV89wJN6vncSzrsEoO9kIktr6wbeWkTriaKC2xxeWJNCzKPwAFH7wO623
	 gXNzM91BblG/vsRtofynr3Si4G2ecE7qyUVkjH5d/DAfarInZLv8Cb3J6p0CQysu+N
	 aA39U4QVly5DLpBkyYxD2Mg5UeKQl6VPCAl1AXLNm4EUdDXCxb8bu39YYdz+s1LgPk
	 pXTzrJVAzZGx8UHFlMys5zAujkkx6fNWK3Jst3o+3HgAbqx59YUD72jnm/5NI8gWRP
	 q9TZp3WZlkQwON3OQARNjU/RxC4mt2a6vtBTsnqYe7b97zl8i4eOL51eEDM0ayt7er
	 3peqoLwd5MCZA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
 Daniel Drake <ddrake@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
References: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
Subject: Re: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Add PHY
 enable delay
Message-Id: <179553937193.1403078.13673574694751006977.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:11 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 15:42:39 +0000, Daniel Drake wrote:
> The Motorcomm YT8531 Ethernet PHY on the Orange Pi 4A was not being
> detected: its ID was reading back as zero and preventing ethernet from
> working:
> 
>   dwmac-sun55i 4510000.ethernet eth0: cannot attach to PHY (error: -EINVAL)
> 
> Add an enable delay to the PHY supply regulator, as was done for the
> same reason on the Radxa Cubie A5E in commit 7076938d20d2 ("arm64: dts:
> allwinner: a527: cubie-a5e: Enable second Ethernet port").
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: t527: orangepi-4a: Add PHY enable delay
      https://git.kernel.org/sunxi/linux/c/dd889887f868

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


