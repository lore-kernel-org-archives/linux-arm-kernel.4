Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807AE606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P83l/dQx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zczQURdkD0wwkwD7Y44TgccHjIB8bGM2wiIzQ/0bd2s=; b=P83l/dQxXGzNd5
	WTODYoThmU9hxvzwX+ZbxlAYzCU2BI5g5h6pYHHmxFuMV+H97XtOAv8g9SbPNmlzvm/9NiKzLDZfA
	hPChnKPRfailHDFGzP3+f8jhDp8OSqaqyrKQSjPRQvgpk1nlrSny+xn4el7H1Zw8qsG60vx0RREiU
	U/PD6K6JYeKIBd1cjk0kWKVF/WBrqLQJrmyDuL67byPmglF7cqbFCpXda0ZGtHYHAz1bCMK1OoGj6
	uOhsTUOeFhRc8ByNLnZrPq6hJuZ+6X7d+N3n7oNvQSqAlCR32OpNkbW0v/KOxT4qydbV3s/h1ZDVd
	CI7NTdHRHNLFAgN5PzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2OY-0000000C5sC-3Q2O;
	Thu, 19 Nov 2026 13:41:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2O8-0000000C5X0-2pmL;
	Thu, 19 Nov 2026 13:41:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2074162397;
	Thu, 19 Nov 2026 13:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C381F00932;
	Thu, 19 Nov 2026 13:41:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul@pwsan.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] [RFC] pmdomain: renesas: r8a78000: Convert to dev_clk_get_from_provider()
Date: Thu, 19 Nov 2026 14:40:39 +0100
Message-ID: <81de8a7aadf587377916763d24181c44b5d13775.1795094688.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The R-Car X5H clock domain callback uses of_clk_get_from_provider() to
obtain clocks used for power management, so the latter show up as
"deviceless" in the consumer column of the clk_summary file in debugfs.

Fix this by using dev_clk_get_from_provider() instead, letting us pass
the consumer device, too.

Sample clk_summary change snippet on R-Car X5H Ironhide:
    - hscif0 1 1 0 0 0 0 50000 Y deviceless      dev_clk_get_from_provider
    + hscif0 1 1 0 0 0 0 50000 Y c0710000.serial dev_clk_get_from_provider

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v5 14/15] pmdomain: renesas: r8a78000: Add SCMI
remapping support"
https://lore.kernel.org/e6816327da51f9fbeef67f13aac723b891e5042f.1795029012.git.geert+renesas@glider.be/
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index 79f6f1a9ae95d245..bb8c9f2b68fbf746 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -232,7 +232,7 @@ static struct clk *scmi_get_clk(struct device *dev, struct device_node *np,
 	if (fw_id < 0)
 		return NULL;
 
-	clk = of_clk_get_from_provider(&scmi_spec);
+	clk = dev_clk_get_from_provider(dev, &scmi_spec);
 	if (IS_ERR(clk))
 		dev_err(dev, "Cannot get SCMI clock %d: %pe\n", fw_id, clk);
 	else
-- 
2.43.0


