Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B5B60A262C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SiYFD3TV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+3mziW4OTR0bVGWOCf4uOQHEgv/QROyf9E3+q1WrjGw=; b=SiYFD3TVevX6w/532Zwqt3ioef
	d1Z7YE6xjeqg5sDHc6mnYHrOxY/BPsPXJgVWNEZXQnNtcBAcYFsfqU+UHwoy6Rmmwo08/gofRlfTC
	YiPgBphdWxt/uFY1G46MYKQ8ixWUDkM0I2Xf+23Q/5h0SS1OVvuPY3ZQ0LOy8wBU6NpeyoRuyVljk
	n/X9YGvcyPVWXBymR3Kjn3OTXVXpNUz9k3Ws1foTuBIS1hP5ZiYRkaROQHpjez8fyvAyWsm6Csy9V
	dUlMvsnrjrP2Vn3/ORTF58k4EjV8u9EejkcQHeb4nqyarICOgeF0olEC8CQqxDzpLIrrtcmfSVCRO
	WU7bq2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26Z-0000000C13r-2NGH;
	Thu, 19 Nov 2026 13:23:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26Y-0000000C13k-3vv3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:23:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9752460051;
	Thu, 19 Nov 2026 13:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E41A1F000C5;
	Thu, 19 Nov 2026 13:23:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pmdomain: ti/core: Miscellaneous cleanups
Date: Thu, 19 Nov 2026 14:22:56 +0100
Message-ID: <cover.1795094118.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

	Hi all,

This patch series contains two cleanups for the TI OMAP2+ PRM driver,
and removes a now-unused generic_pm_domain_data member.

This has been tested on BeagleBone Black.

Thanks for your comments!

Geert Uytterhoeven (3):
  pmdomain: ti: omap_prm: Use pm_clk_no_clocks()
  pmdomain: ti: omap_prm: Remove dummy generic_pm_domain_data handling
  pmdomain: core: Remove unused generic_pm_domain_data.data

 drivers/pmdomain/ti/omap_prm.c | 15 +--------------
 include/linux/pm_domain.h      |  1 -
 2 files changed, 1 insertion(+), 15 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

