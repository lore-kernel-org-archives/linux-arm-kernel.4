Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D7/q5nFn;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ywHxZDm0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2EMrqLxhB8NeX2lRlrhTsQgGdQYslPX62AQYL2s8aVA=; b=D7/q5nFnNFZEDY2SETS5YFisFM
	kbFxZoPfXRd4awu79rLSYLIkMFJrAZlwkyZEflWoerdeMamFkKWQsd3PlGi8QtcgfyCBWpvzFYbvl
	YmdPE+UrMKgTXl7AR4Gce74jFzzgR8VtVdmawf0z9/Ht97r3iVtULHAfsECYxUy9VA4rdfgQC62Ro
	k1DB9k5lBJUh6y966/RKLALzEnnfpL0r6AAZ9hxXPjMPeLu4N4JXPL22tMY6jugwQc9n4713RQD9l
	u/z7iAsx/Gv67obgVOHDtjwg2RgoXuGAHFWRjaZ6yJwDocVf2k1vnz8Z45uhClkkyfDBS03CVR+dO
	XYcPIRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqbd-0000000F9mh-3pjk;
	Fri, 27 Nov 2026 07:42:53 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqbG-0000000F9g6-3Cy1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ywHxZDm0Lvd0Bttj+3Ow4g4Piz06Ny2hJDsz2MWk3ZqmspXl0Of8XD1/4bGbFncLYE/W1qtSsHgyt
	 SY+Wf3UJGsuaERBzG05j9LlO88fsQtxSOQa9a0fXSPVNI0yIVfDhDF6mdeJENCTpEZUKWruJ97WvlZ
	 CbX0IVB7sxa76BS4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56b093459d9b-60cce;
	Fri, 27 Nov 2026 15:42:21 +0800 (CST)
X-RM-TRANSID: 2ee56b093459d9b-60cce
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b09345b14f-8bd70;
	Fri, 27 Nov 2026 15:42:21 +0800 (CST)
X-RM-TRANSID: 2ee96b09345b14f-8bd70
From: zhaofeng2@cmss.chinamobile.com
To: Andrew Lunn <andrew@lunn.ch>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: dove: fix OF node leak in dove_init_pmu()
Date: Fri, 27 Nov 2026 15:42:18 +0800
Message-ID: <20261127074219.1188-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234232_045907_038845FA 
X-CRM114-Status: UNSURE (   8.78  )
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

dove_init_pmu() calls of_get_child_by_name() to obtain the
"domains" child node of the PMU node, but the reference is
leaked on the two early failure paths and on the successful
return.

Drop the reference with of_node_put() once the node is no
longer needed.

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current tree. Leak found by code inspection
(OF reference-counting audit of dove_init_pmu()).

 soc/dove/pmu.c | 11 +--------++---
 1 file changed, 8 insertions(+), 3 deletions(-)

--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -388,8 +388,10 @@
 	}
 
 	pmu = kzalloc(sizeof(*pmu), GFP_KERNEL);
-	if (!pmu)
+	if (!pmu) {
+		of_node_put(domains_node);
 		return -ENOMEM;
+	}
 
 	spin_lock_init(&pmu->lock);
 	pmu->of_node = np_pmu;
@@ -400,6 +402,7 @@
 		iounmap(pmu->pmu_base);
 		iounmap(pmu->pmc_base);
 		kfree(pmu);
+		of_node_put(domains_node);
 		return -ENOMEM;
 	}
 
@@ -451,5 +454,7 @@
 			pr_err("dove_init_pmu_irq() failed: %d\n", ret);
 	}
 
-	return 0;
-}
+	of_node_put(domains_node);
+
+	return 0;
+}



