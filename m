Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D417606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2H8Hxcl9;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=H9xN3dtX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2L0+ubWBrqKmaPNuUbxc1vTo20sNFqwPHMxboVWuy6c=; b=2H8Hxcl9LA2x12lsZQY0iaDiYG
	8PILgGAne6wcbAwSOUz/mfNvNb4OJfrVd9yznLmcbjztKygd3x9VSeSf94xYHNAxp26yKoApgXCuC
	fMaVl4ZvbauMzYoe7kUbV2iC4NmGQye4ddoNq0enKiZZkf/Opqv2lrvgMhq2GtOys7OolOPUNjxiq
	yf7+qnC0bcAAgu8lbiQJelJ+qLFjbBeiqftsQJTbuTx7fBUJWVOnC1GzUt61nJKOHgMf+F/bwdcuO
	E1QH0sNPnkJSYgVvSoeGi0txLbjgJ/jyfqvj2e0tqxdTuBgt8Gag/2g2wfJPUPjGo0wDrJmSxgq0c
	mNVyQgfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKbI-00000008WdX-34CE;
	Thu, 12 Nov 2026 02:31:44 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKbE-00000008Wbi-2GVD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=H9xN3dtXJJRHHKdNQvS2be1qZyuAEIJkephSl/KCYFR84wrzBlEi7jad8fapVvjGxE5RPZu1fmh/A
	 cdqwvyALpWiTbtBSjIj44F5nZEasxwllHCDN6GQJV6g17s7vKT3oUle/WzUY99oOXUt8hOUxVTRpQo
	 pMKfrFaHOdX7IcI8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af52509174-a8b05;
	Thu, 12 Nov 2026 10:31:38 +0800 (CST)
X-RM-TRANSID: 2ee36af52509174-a8b05
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af52507ec2-ef219;
	Thu, 12 Nov 2026 10:31:38 +0800 (CST)
X-RM-TRANSID: 2ee76af52507ec2-ef219
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: kristo@kernel.org
Cc: nm@ti.com,
	ssantosh@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] clk: keystone: sci-clk: Release nodes while scanning DT clocks
Date: Thu, 12 Nov 2026 10:31:37 +0800
Message-ID: <20261112023137.118241-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183141_122272_3DFDE9CC 
X-CRM114-Status: GOOD (  10.69  )
X-Spam-Score: -2.4 (--)
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

ti_sci_scan_clocks_from_dt() parses clock phandles without releasing the
provider node references. Allocation failures also leave the current
consumer node referenced by the outer device tree walk.

Give each parsed provider node scoped cleanup, and release the consumer
node when returning early from the scan.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: 8e48b33f9def ("clk: keystone: sci-clk: probe clocks from DT instead of firmware")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/clk/keystone/sci-clk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 967f77900358..433bdca8ac83 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -541,7 +541,7 @@ static int _cmp_sci_clk_list(void *priv, const struct list_head *a,
 static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
 {
 	struct device *dev = provider->dev;
-	struct device_node *np = NULL;
+	struct device_node *np __free(device_node) = NULL;
 	int ret;
 	int index;
 	struct of_phandle_args args;
@@ -573,13 +573,16 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
 		index = 0;
 
 		do {
+			struct device_node *clk_node __free(device_node) = NULL;
+
 			ret = of_parse_phandle_with_args(np, *clk_name,
 							 "#clock-cells", index,
 							 &args);
 			if (ret)
 				break;
 
-			if (args.args_count == 2 && args.np == dev->of_node) {
+			clk_node = args.np;
+			if (args.args_count == 2 && clk_node == dev->of_node) {
 				sci_clk = devm_kzalloc_obj(dev, *sci_clk);
 				if (!sci_clk)
 					return -ENOMEM;
-- 
2.51.0




