Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 23:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w9fSq46u;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlWB+MVx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OmPpVCd1cEeyOHtBZFTBek13c8a3tHRtErjPxTkBgVg=; b=w9fSq46uYZlxtisnAhBLNhy06k
	mICSZZ+zfH7ecm8vGqGTckKlPN60PrUUPMpea1fEwhcqoNv9ZMq0aXXnmuSYeUzUw8VRoMtXdH6ss
	bguTy8LdqmB6rvdQRhKNSLqFobNiimpgow/xJwHG6RUOrQsDmZQTliJkcaRNqqkzJh1gCmUDm847N
	PwBjX35KzNSbiDqOeP66lS08PlH+2i531oZfr8KUljSP+EWa4c5KbdM0Vo9siBkeaAaoukxzYglWB
	DryI0HGgrk4kdoI3WMcpWvVJ8KhEByfMICQj59vZsab0lzOxtfX8KFzDhd95Yh9bgCRr4qqkHwVzK
	aEvn5kzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjEy-00000000hTl-0Vww;
	Sun, 15 Nov 2026 23:02:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjEx-00000000hTZ-0hiT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 23:02:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2942461851;
	Sun, 15 Nov 2026 23:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D35E1F000C4;
	Sun, 15 Nov 2026 23:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794783744;
	bh=OmPpVCd1cEeyOHtBZFTBek13c8a3tHRtErjPxTkBgVg=;
	h=From:Date:Subject:To:Cc;
	b=dlWB+MVxKVso8/2amHfxrbBXqZBfj01wHQbiGaI82BW7gDbu3eN+9YgTda5ojqaUB
	 szbDXmX1Th87QSLx3E9w28xKYwv3yeJzUuahRbmp6xvGQB8efPnvyqS2uzkeDRNAWU
	 6GAkrGTB34NcXBCTsJh+D9y2TgET7stNClBkYuxOrx8otsBOqOzxKzIiMFmplqHeB6
	 yxLADk1leM+urnwuvhI+XuK8yCbJM5QNzpxjNJecruxwaL+1rujrFJgdUTe/islM67
	 8xwXUQ4xEzLK1OpDB2YvQyIIcHMArfpxYkeY8boNCBQ3VFOyhz4I0WblZP/Ph4v3X9
	 CT1pix9iCw0Yg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 00:02:21 +0100
Subject: [PATCH] misc: sram: Enable runtime PM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-ux500-sram-runtime-pm-v1-1-c554831d6b12@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQrCMBAF0KsMf92BTGqq5iriIuios0gsEyuF0
 rsLvgO8DV3dtCPTBtevdXs3ZJKBcHuV9lS2OzIhhjiJSOJlTSFw91LZl/axqjxXjirpeDqM5zK
 NGAiz68PW/3u57vsPsR5W8WcAAAA=
X-Change-ID: 20261115-ux500-sram-runtime-pm-2e1578439a63
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable runtime PM for generic SRAM devices after probe has initialized
the SRAM mappings and partitions.

This lets SRAM devices with attached power domains be managed through
runtime PM references from their consumers.

Keep sysfs-exported SRAM and SRAM requiring platform initialization
powered while the driver is bound. This preserves exported contents
and avoids unpowered sysfs accesses or an unsupported resume sequence.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Enable runtime PM for SRAM suppliers so consumers can manage their power
domains through runtime PM device links. Keep sysfs-exported SRAM and
SRAM with platform initialization powered while the driver is bound.

The Ux500 genpd prerequisites have been merged into the powerdomain tree.

Arnd/Greg: you can either apply this directly (if it checks out) or ask
me to send it to the SoC tree.
---
 drivers/misc/sram.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index c8990e83a65a..4d2477bb5cd9 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/mfd/syscon.h>
@@ -380,6 +381,8 @@ static int sram_probe(struct platform_device *pdev)
 	int ret;
 	struct resource *res;
 	struct clk *clk;
+	bool keep_active;
+	unsigned int i;
 
 	config = of_device_get_match_data(&pdev->dev);
 
@@ -425,6 +428,24 @@ static int sram_probe(struct platform_device *pdev)
 			goto err_free_partitions;
 	}
 
+	/*
+	 * Sysfs users need retained contents; init-only platforms have no
+	 * runtime resume support. Keep both powered while the driver is bound.
+	 */
+	keep_active = config && config->init;
+	for (i = 0; i < sram->partitions; i++)
+		keep_active |= sram->partition[i].battr.size != 0;
+
+	if (keep_active) {
+		ret = devm_pm_runtime_get_noresume(sram->dev);
+		if (ret)
+			goto err_free_partitions;
+	}
+
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto err_free_partitions;
+
 	if (sram->pool)
 		dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
 			gen_pool_size(sram->pool) / 1024, sram->virt_base);

---
base-commit: 9ae477db090b44816741fd9c49a3c459fc7d407b
change-id: 20261115-ux500-sram-runtime-pm-2e1578439a63

Best regards,
--  
Linus Walleij <linusw@kernel.org>


