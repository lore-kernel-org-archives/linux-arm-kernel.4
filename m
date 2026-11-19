Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MEdoQW1H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HmUe4j2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s4cvZp5AvfgYLV2auk5QpJzzeS5J6/LvcVBr+ffVl4c=; b=MEdoQW1HMWKd1I
	dYyZkgOOyJWvCEKNxvm//hkoumiTVm4QGAJqcnTGQTO2xfFVJTNgN9fnsjxRxgmsNufnnZX3q+2PK
	uFuwr977A4789HcpVyCzurknhul1C3uTdG0dGtYM26tszUwYXyAFjGbt9Sewo3Rh4znKYNtFOPiZU
	4ZC1td0AxbR41XIg1tEODQNkat703Y6tZ2oPAgvK6z3OHn0Ci6YV0RebxXXD6r3YGrM0c4brqv0s4
	lbFqC4G3ZZc2KRq7XcYW2n+ecWRJG7S8vqPsVRhIpJpZAfQfKjwUW19oGLgCfWy1bii4fJt+6Y0OE
	f0nULZp5Rr3WnC5njhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTziR-0000000BbME-3qfy;
	Thu, 19 Nov 2026 10:50:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTziQ-0000000BbLt-2wTz;
	Thu, 19 Nov 2026 10:50:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 293EE47075;
	Thu, 19 Nov 2026 10:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B9B1F000C4;
	Thu, 19 Nov 2026 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795085406;
	bh=s4cvZp5AvfgYLV2auk5QpJzzeS5J6/LvcVBr+ffVl4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HmUe4j2yxQ2oTG5s3dCpl9cKQqmsi8aXFlSZf0aKdCdb9hkDH+VtEQfkB1Cuka+Vr
	 Cn02+Yoj3ihwV5cN6K6BlQvByc1z1VA2JNp+RcMauZyuAHZ0hlJfwtk1iwMxrHwDSo
	 ZRKNKmcyYGbKxC3u5eGRQEUZlYR94gZ3rVVEyz8gFE3gtu0HjlMdThPATxq47uAoCd
	 RAe7DRW4VJcW/AhbQZx/SPst251mFJ913kfwOqafR1fvnEpiUP+cS2E+hBQ7ty3ZUc
	 SX1SLXNoEuPucrnM1KpZWNDv/0BO0Xh2C2qgKLX/iq7j3Kt2tWZJ36EccIMovx/4wT
	 tkb3pGAJx6kqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14BE3808210;
	Thu, 19 Nov 2026 10:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179508540478.3012506.10510829402469868625.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 10:50:04 +0000
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
In-Reply-To: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
To: Igor Velkov <iav@iav.lv>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 17 Nov 2026 00:54:06 +0000 you wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: mdio: mux-meson-g12a: keep the MAC data path when switching MDIO
    https://git.kernel.org/netdev/net-next/c/cf0dd134a16e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



