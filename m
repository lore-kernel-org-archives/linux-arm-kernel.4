Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE9B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YLX9vkh6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zUgHiUxeai+462CgOJrAlgAIwv2ffSv36114dONT0IU=; b=YLX9vkh6z/igt/
	YvK8YeOkQj1ENRQXvgNe1Q7GIkRxcpe+lX+mIWRl96bDhkoKyqTy7hjj9Hqfq478iYSfoRE+9VAnW
	Q3Rhk+jxXRQAuGisSCy6kEsPjsaSyXC8xIumQpPrxqc43gvKo9e4oO65uO8cYz06fBsXcQ3H6CjfT
	Sz56fKXzpt1UDI5BbYOoi4TyvIihIhxQyqRhwudKtELqr1i6HopWQF1nnB32LHcjjGXuKoyjKMikx
	bzOmPfw8GFKZKE40MYrVFkcFcQBzT76n1VNB1R/XZjtSOXnNaJKPAwj29ov3AjP0On8ZfrJ32neEt
	HaXe50k+Mwe4iHlHx/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26i-0000000C16Q-353I;
	Thu, 19 Nov 2026 13:23:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU26e-0000000C14n-0Rsd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:23:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D045460051;
	Thu, 19 Nov 2026 13:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA141F000C4;
	Thu, 19 Nov 2026 13:23:12 +0000 (UTC)
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
Subject: [PATCH 2/3] pmdomain: ti: omap_prm: Remove dummy generic_pm_domain_data handling
Date: Thu, 19 Nov 2026 14:22:58 +0100
Message-ID: <05b6aee460879268c85c17035718f8c8787a2342.1795094118.git.geert+renesas@glider.be>
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

The TI OMAP2+ PRM driver clears generic_pm_domain_data.data in its
generic_pm_domain.attach_dev() and generic_pm_domain.detach() callbacks,
but never sets it to a non-NULL value.  Presumably this was part of
unfinished handling copied from the TI SCI Generic Power Domain Driver.

Remove the unused code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/ti/omap_prm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
index 9515420da890cb31..eb4ce7cf9c176936 100644
--- a/drivers/pmdomain/ti/omap_prm.c
+++ b/drivers/pmdomain/ti/omap_prm.c
@@ -635,7 +635,6 @@ static int omap_prm_domain_attach_clock(struct device *dev,
 static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
 				      struct device *dev)
 {
-	struct generic_pm_domain_data *genpd_data;
 	struct of_phandle_args pd_args;
 	struct omap_prm_domain *prmd;
 	struct device_node *np;
@@ -654,9 +653,6 @@ static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
 			 prmd->pd.name, pd_args.args_count);
 	of_node_put(pd_args.np);
 
-	genpd_data = dev_gpd_data(dev);
-	genpd_data->data = NULL;
-
 	ret = omap_prm_domain_attach_clock(dev, prmd);
 	if (ret)
 		return ret;
@@ -667,12 +663,8 @@ static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
 static void omap_prm_domain_detach_dev(struct generic_pm_domain *domain,
 				       struct device *dev)
 {
-	struct generic_pm_domain_data *genpd_data;
-
 	if (!pm_clk_no_clocks(dev))
 		pm_clk_destroy(dev);
-	genpd_data = dev_gpd_data(dev);
-	genpd_data->data = NULL;
 }
 
 static int omap_prm_domain_init(struct device *dev, struct omap_prm *prm)
-- 
2.43.0


