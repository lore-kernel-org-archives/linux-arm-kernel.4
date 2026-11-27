Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA48606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p5N5x1j6;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QG4VPnsi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eJtsX3t9xw21teJVKJeFwZEG56oP5phaBgh7xgOsEG0=; b=p5N5x1j6ZBGWaav0RSR775QHgc
	hHbK8EkWxbv/A0ykoDZ8JNu2kYr3YVc51ATRaMtv1/+C3Gc4JvOFCsYhLMB2AqPtb4F9Dy+K1m/5d
	G/uF6ES0sKqnrFqlp73Z2UQLL/aM2i4MXQrp6Q8Ux3AfcnPBRoXcJ/Sk+nkFPjTbIj1E8P8Vksxej
	SA7Es5oLn7vrlyLBaScvOBlGIRra5ogT+zd4/c/kSPh/dAAgu3HC5wQaGImfiqHLnuUOCv46utuqB
	Ok8IQbWJ2S5s/Ne5yen9WvNy/yZn81nKF7C2lum2FTKh+jZTUHQpBbLsQtkaCnWkvEsbLu8Whi3yS
	hxZ4zzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqbL-0000000F9hk-2cP2;
	Fri, 27 Nov 2026 07:42:35 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqbH-0000000F9g7-03hN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QG4VPnsivjSb0/jdVr79i0WnwDwwtsPw3xtWXCFxb3rOmSbGUndku3+ge/aok/n3uIPeS2sNfBObC
	 pjvZKlvhZpAoDlGfSpthCmjiQXCBmLBmvMaKR1aDUIthWQ9H2FprnQEQaXhZ7XBkjAqpGMOV+2azAi
	 d2DUusU27JISHcFo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b093458f5c-30599;
	Fri, 27 Nov 2026 15:42:18 +0800 (CST)
X-RM-TRANSID: 2ee66b093458f5c-30599
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36b0934574ef-146c2;
	Fri, 27 Nov 2026 15:42:18 +0800 (CST)
X-RM-TRANSID: 2ee36b0934574ef-146c2
From: zhaofeng2@cmss.chinamobile.com
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: vexpress-config: fix OF node leak in vexpress_syscfg_probe()
Date: Fri, 27 Nov 2026 15:42:15 +0800
Message-ID: <20261127074215.1520-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234231_634887_4F0FFC85 
X-CRM114-Status: UNSURE (   8.17  )
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

vexpress_syscfg_probe() calls of_parse_phandle() to obtain
bridge_np for the "arm,vexpress,config-bridge" property inside
a for_each_compatible_node() loop, but the returned device node
reference is never released, leaking a reference on every
matching iteration.

Drop the reference with of_node_put() once the node is no
longer needed.

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current tree. Leak found by code inspection
(OF reference-counting audit of vexpress_syscfg_probe()).

 bus/vexpress-config.c | 5 +----++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -393,10 +393,13 @@
 		struct device_node *bridge_np;
 
 		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
-		if (bridge_np != pdev->dev.parent->of_node)
+		if (bridge_np != pdev->dev.parent->of_node) {
+			of_node_put(bridge_np);
 			continue;
+		}
 
 		of_platform_populate(node, NULL, NULL, &pdev->dev);
+		of_node_put(bridge_np);
 	}
 
 	return 0;



