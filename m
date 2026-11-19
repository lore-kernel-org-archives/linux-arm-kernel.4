Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD316606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GGJiad3m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RQWsE6Ui5nt1SCyNlkHl613h7zDcFjwnMDjLWUyQUDg=; b=GGJiad3mgPttpB
	b1iyOytYrgg8BdJ1iUgd2KPMNPf+xo0HbSH5I8a936Y+q6K0ZztIAF8B7uOnK2pEBJ07sMvf2mlcM
	kb5RNfRxgjJhdjzdaMZwPvprTYic9q/hgORCNc5KKPW9ilfKPKRF/YnzLQU2piby3+HzSIQ8z2FHW
	9b38TdYV7YoA1uhnCzKl2quXnsK8AJw5cKQH5go0U/ujD/Vv7vr3NPAe2U1s4JNGMGfu59/tw9Zzf
	03hDeD8W7LuLSNYL+xRYXDi3UgMbEfxcfdVlfmWqa7zmiBMbTxX1CgdKgF3wlOxqnvQwK+KvQXLoc
	W0GYgcaLAm6qRqUq/XQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2OI-0000000C5eE-14OF;
	Thu, 19 Nov 2026 13:41:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2O3-0000000C5SN-2fUL;
	Thu, 19 Nov 2026 13:41:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62B5F47916;
	Thu, 19 Nov 2026 13:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3067D1F00925;
	Thu, 19 Nov 2026 13:41:11 +0000 (UTC)
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
Subject: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to dev_clk_get_from_provider()
Date: Thu, 19 Nov 2026 14:40:38 +0100
Message-ID: <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
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

OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
used for power management, so the latter show up as "deviceless" in the
consumer column of the clk_summary file in debugfs.

Fix this by using dev_clk_get_from_provider() instead, letting us pass
the consumer device, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

The first change is probably OK.  The second change may fail if anything
in the oh->od->pdev->dev chain is not available yet at this point.
---
 arch/arm/mach-omap2/omap_device.c | 2 +-
 arch/arm/mach-omap2/omap_hwmod.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index 77a75b0b9ae69c85..5695e0c8f2392eca 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -73,7 +73,7 @@ static void _add_clkdev(struct omap_device *od, const char *clk_alias,
 
 		clkspec.np = of_find_node_by_name(NULL, clk_name);
 
-		r = of_clk_get_from_provider(&clkspec);
+		r = dev_clk_get_from_provider(&od->pdev->dev, &clkspec);
 
 		rc = clk_register_clkdev(r, clk_alias,
 					 dev_name(&od->pdev->dev));
diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 03cd523dff874bb0..5e4123014909d4ac 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -147,6 +147,7 @@
 #include <asm/system_misc.h>
 
 #include "clock.h"
+#include "omap_device.h"
 #include "omap_hwmod.h"
 
 #include "soc.h"
@@ -796,7 +797,7 @@ static struct clk *_lookup_clkctrl_clk(struct omap_hwmod *oh)
 				clkspec.args[0] = addr - provider->addr[0];
 				clkspec.args[1] = 0;
 
-				clk = of_clk_get_from_provider(&clkspec);
+				clk = dev_clk_get_from_provider(&oh->od->pdev->dev, &clkspec);
 
 				pr_debug("%s: %s got %p (offset=%x, provider=%pOF)\n",
 					 __func__, oh->name, clk,
-- 
2.43.0


