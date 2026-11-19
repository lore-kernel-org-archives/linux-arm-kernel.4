Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BkV0Wbk4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pz0k4VxU3eBfCv8WD0OJkm6FuTK73OMGKkDamVlmtKA=; b=BkV0Wbk4BQdWda
	OEpDoCDUFjNvqvT/nyrnnZ3qdfErsvxYQXkOKDRPQPhr4ydLfP4INB5dCEqHX10QrpUqUsDv8LPZr
	IQyjJpJPF4cCeAFAuzU8QueoVntUPA/rbrdb/bEvDbSkTjaduMf/OCTGjbqxmi2C0U/U5OHNTP5ur
	JM3xgZtIrRc4sFEPPi6FezWUDUgZSAkX1gS+FzfoWrXout6El/vqu6y/kFKbcU/1KXZNkWPAc9B7p
	PGHNhywubIGOU/ugVnKQe551QwW0nlgtd3Pa6yPdfL6yWlQ0vSOz5iHDQ+Z7Ia2mZG6EllMTAUw4r
	pMYLGd49jmvuL0MDmENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26i-0000000C163-2jCP;
	Thu, 19 Nov 2026 13:23:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26b-0000000C14D-0CwO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:23:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 393386123C;
	Thu, 19 Nov 2026 13:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1071F000C4;
	Thu, 19 Nov 2026 13:23:09 +0000 (UTC)
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
Subject: [PATCH 1/3] pmdomain: ti: omap_prm: Use pm_clk_no_clocks()
Date: Thu, 19 Nov 2026 14:22:57 +0100
Message-ID: <8c0bccb0d90d55d70b85e021979b0728893905c7.1795094118.git.geert+renesas@glider.be>
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

The TI OMAP2+ PRM driver uses a flag to keep track if any device clocks
were registered for power management.  Replace this custom logic by use
of the existing pm_clk_no_clocks() helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/ti/omap_prm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
index 671b028e367eb9de..9515420da890cb31 100644
--- a/drivers/pmdomain/ti/omap_prm.c
+++ b/drivers/pmdomain/ti/omap_prm.c
@@ -44,7 +44,6 @@ struct omap_prm_domain {
 	u16 pwrstst;
 	const struct omap_prm_domain_map *cap;
 	u32 pwrstctrl_saved;
-	unsigned int uses_pm_clk:1;
 };
 
 struct omap_rst_map {
@@ -630,8 +629,6 @@ static int omap_prm_domain_attach_clock(struct device *dev,
 		return error;
 	}
 
-	prmd->uses_pm_clk = 1;
-
 	return 0;
 }
 
@@ -671,10 +668,8 @@ static void omap_prm_domain_detach_dev(struct generic_pm_domain *domain,
 				       struct device *dev)
 {
 	struct generic_pm_domain_data *genpd_data;
-	struct omap_prm_domain *prmd;
 
-	prmd = genpd_to_prm_domain(domain);
-	if (prmd->uses_pm_clk)
+	if (!pm_clk_no_clocks(dev))
 		pm_clk_destroy(dev);
 	genpd_data = dev_gpd_data(dev);
 	genpd_data->data = NULL;
-- 
2.43.0


