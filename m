Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ED3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=usXvM8g2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1HywxZj+ntCBxPb271XM3AEaJ1RvmUAp2KiCiKmlUJ4=; b=usXvM8g2my5qxI
	zpVplpOf//XieHRGHPFBIt40nXp1zpoJZbH7f9EEQUpMhAxzxWtyBr04+6Q4F56LP2udXrh3O7GI7
	2Rls/cefv7nRoKDh6vlc9EQyGTloZ9nFEVWZuItFxVE3ENCkzeSRJA+8Nc7SCmanXN4H23BRfSGwW
	C4OXqr6kF/plOiZg46FGO0SCDmSA1opetFz2b4FgrsTyTt//rknIYY+mc06k51pXRbIG6Ew22h7mL
	h9pFothQEJ419G1wMuDcTQmyrDhhZgLueH+c+BQd1bbKtaIqlZzQeTKFU397/iTlUyRp3q8MP7uqz
	OwVtsV63+8GvzxyiOuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26i-0000000C16u-3XU9;
	Thu, 19 Nov 2026 13:23:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26g-0000000C155-01ak
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:23:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73B2B61FAD;
	Thu, 19 Nov 2026 13:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DD71F000C4;
	Thu, 19 Nov 2026 13:23:14 +0000 (UTC)
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
Subject: [PATCH 3/3] pmdomain: core: Remove unused generic_pm_domain_data.data
Date: Thu, 19 Nov 2026 14:22:59 +0100
Message-ID: <244b1e6c2c1b52f8324b622e23b8af8adcef43b4.1795094118.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094118.git.geert+renesas@glider.be>
References: <cover.1795094118.git.geert+renesas@glider.be>
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

This reverts commit a5ea7a0fcbd7376b2c9fcb15fe59fec298c9ce9f.

The data pointer was added to the generic_pm_domain_data structure
specifically for use by the TI SCI Generic Power Domain Driver, but that
driver stopped using it in commit efa5c01cd7ee2042 ("soc: ti:
ti_sci_pm_domains: switch to use multiple genpds instead of one").
A new dummy user appeared in commit 58cbff023bfaeb9c ("soc: ti:
omap-prm: Add basic power domain support"), probably inspired by the
former, but it was removed, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/pm_domain.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index d65ee8b3725c1bcb..0f2a9bf48c3e388d 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -304,7 +304,6 @@ struct generic_pm_domain_data {
 	unsigned int opp_token;
 	bool hw_mode;
 	bool rpm_always_on;
-	void *data;
 };
 
 #ifdef CONFIG_PM_GENERIC_DOMAINS
-- 
2.43.0


