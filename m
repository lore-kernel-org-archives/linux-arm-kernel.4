Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853DF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tMWpG7+K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPjsVoOv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UNYBiOhAD+30znGjPejLZJPRdYr6/sqO+OtQ52jw+6k=; b=tMWpG7+Knllrib
	hHyXpAM/dIv3d6bc/aVjCuk5E9Oi4MLpoV68TRFI7eICCJrouuMl2Fw/7I/19eTX1Y7r3JVyFXmGq
	/xKsbfB7nNN89rfP+JQtsimH/M2mKGflBbKEwyuUbj0yOkfr+4yWHP/5BvbkBsJwRTUPWc/RAbuoe
	XcvcjLBsxfXhVBcKYOTbGX5ruHFou3G3t8P/TJPjG+GH0grHxenZzn1l1NIdq32QEb7D7qLY491r2
	2XFXQ9QvfOVOH+/+21rVb0MY6wF5TvjzV73Q22HQpUPzLE835QSm0LaGNERME8e6wj2tJ7GO3zzDl
	uaDR5GBIdHhCENr6Hzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDch-0000000Dqvc-2eKd;
	Fri, 20 Nov 2026 01:41:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDcR-0000000DqnA-1tGY;
	Fri, 20 Nov 2026 01:40:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8496160D9F;
	Fri, 20 Nov 2026 01:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48EC1F000C6;
	Fri, 20 Nov 2026 01:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795138850;
	bh=UNYBiOhAD+30znGjPejLZJPRdYr6/sqO+OtQ52jw+6k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mPjsVoOv+gyomx2nkUJ4gfXTECNpfs5wubWv4LBWT7r0aOiMaRqYeG5ZVChyVtO2K
	 bLpyRDUr98Io9WqgybKFqsLehTGnCTwWSPELRLnqacSzqL4Z5NLDlEzTrGl9iATzxh
	 jN4Nh7bMMmbylRorj69iyvun/dpZc95nam8RKhXUnBOnG9x1/udORrrynW+j2WJ9Tf
	 EiTZZCI8I3jWTlFiPonHcW+KngD34tcF6LtLGpxm+6gcw2xEwi2wuhVm3PRhMDrCZq
	 jj9fkEs31b9b01QNqei7QmfcSZZIjZRGbwLYjATdDFDixrc3/gpTtpMuTWjqdXcUcM
	 vxI05YqsG3JCQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/6] [RFT] drm/rockchip: dw_hdmi: Convert to
 dev_clk_get_from_provider()
From: Brian Masney <masneyb@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <313d11bdd1dd46e895e34236191e7a3b175d0382.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <313d11bdd1dd46e895e34236191e7a3b175d0382.1795094688.git.geert+renesas@glider.be>
Date: Thu, 19 Nov 2026 20:40:22 -0500
Message-Id: <179513882273.284394.4331892287524393422.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=479; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=JGsrsWKRl0kw3WUwGSIprP/RenP+nQQZD7u3j9iJt1I=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGr/pROgWlEsgnn4T7idnP8BIUXK0HiWzQz/5qMUdPDmhjFmD
 Ih1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmr/pRMACgkQt9LdJ11+wIeTyAEAnOnn
 uWf5C9UfZlObjo+Lo59Bat1yoayzzvNH9NdY1qwBAOswW+07L4AHYLwWodYFTqnZ7ppxIcEV09w
 V46KoATMJ
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The Rockchip Designware HDMI driver uses of_clk_get_from_provider() to
> obtain the clock for the HDMI PHY, so the latter shows up as
> "deviceless" in the consumer column of the clk_summary file in debugfs.
> 
> Fix this by using dev_clk_get_from_provider() instead, letting us pass
> the consumer device, too.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>

