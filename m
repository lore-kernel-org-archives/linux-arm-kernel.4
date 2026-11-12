Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uy2+2moX;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jLjZ2J7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3ooFT16lxzV+jRku2qa+cnHxrKULQH6AWF/pCH2gDZ4=; b=Uy2+2moXBHRGCiE0W8xnk8Ayhe
	9uOszcGzPKsvrKDsBBshmXchpLdBHmWnSBsj3tLEdzIi7EzzAr2AWGnBikfX/L9X0Kg6emz79xwYu
	ZSaoyELgUYcKFOQNYvra9KVAhZUl9lXaBCsxPKPT0210j8IBdujf5sjniX0RZmHgLzIVeap55v/PI
	2EeMP4DJHKRQlhknUolomClpRGU3nhtP2BbzyPyxDB2IC9qIIlh16BCJ49eqAM/+Oh2zYfsX33lmI
	fvgNGE/jlISBy4RPJ1G2DkJHj7BGwwWopPO+zOWjg9X1bP1aE4+92NLzZR9jbkheKG8AURGAh8X0J
	3jCpONcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP41-00000008u52-3JNr;
	Thu, 12 Nov 2026 07:17:41 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP3G-00000008tnT-0vV0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jLjZ2J7GF4B76ipgM1dZ3SDDu3PFWl6aTK7pL8UFonywsgYafSX3qdwl1amixR+kUtshBMRB3kVXv
	 wlYxYt0/HeWQYYmg0S7/WauTbipwBr3uOjVve2eM6McprIk3tzhA9Nj4gpY7xwQpcw9W46Qhuspmek
	 z3uCtdWxVT5YjVs0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af567dc31e-dca43;
	Thu, 12 Nov 2026 15:16:47 +0800 (CST)
X-RM-TRANSID: 2ee56af567dc31e-dca43
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af567dd2ae-f6810;
	Thu, 12 Nov 2026 15:16:47 +0800 (CST)
X-RM-TRANSID: 2eea6af567dd2ae-f6810
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: liviu.dudau@arm.com
Cc: sudeep.holla@kernel.org,
	lpieralisi@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] bus: vexpress-config: Put bridge nodes after checking their phandles
Date: Thu, 12 Nov 2026 15:16:46 +0800
Message-ID: <20261112071646.154452-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_231704_685421_955D8CC2 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

vexpress_syscfg_probe() obtains a config bridge node for each config
bus and only uses it for a pointer comparison. Neither the matching
path nor the continue path releases the reference.

Use scoped cleanup for the bridge node so each loop iteration releases
its lookup reference.

Fixes: a5a38765ac79 ("bus: vexpress-config: simplify config bus probing")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/bus/vexpress-config.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
index 9f57f6581b54..516a54fae850 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -390,9 +390,8 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 	}
 
 	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
-		struct device_node *bridge_np;
-
-		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
+		struct device_node *bridge_np __free(device_node) =
+			of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
 		if (bridge_np != pdev->dev.parent->of_node)
 			continue;
 
-- 
2.51.0




