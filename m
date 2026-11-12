Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C2C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dK4jr4eB;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WFx08cKh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4aQHBiqJ06U37j0N40/YP+bLbY78zhD+Fcv1k2FBL0c=; b=dK4jr4eBshIykooxfiAf+XM5pw
	LVnDYLm/+FD3JkHsh0Wrs9Vxvgf6ZHj8yB/KkFPVPFEuklBpMiUIQPvYnkRazMxyk/fLjgQ7JcsQu
	KVGrmCKG25fDj08XfRXYy/uRDf5Bi0Ysy+M7dNsLHezOw39ctzMizatSss8ikbI758l1AB1jrBfAd
	yYsk+vyrqvCyv0V61TDmiY8zS2i1qC1oj0oZ8Gv746/z0fNDP9M48yZYsVhx203CS3NL8jx94EgXV
	riLlZiT0guSym/OAlKrQQhQ41cQ7Q8mhyR+HH9c7sp3hasUXoQLeFiK5lBN3GaY7R+OCVt+be19Co
	qE9bHnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKb2-00000008WXq-3LKn;
	Thu, 12 Nov 2026 02:31:29 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKaz-00000008WWu-2MA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WFx08cKhj65W8B/25YY/WT4NVFKCWadtE15HrlGmeAgx+8pEvWHscA6ss2Lvt4kuzDfhGPzu97kWr
	 RNC4ikYTPlpRGuKLytaY4fSTTu0kLGO+n+8nQZ+rR+7LfXjiv276hMmfags829gatR3nIBxT3skzL9
	 oA2nKudcY/+BizMA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af524f8a92-189fa;
	Thu, 12 Nov 2026 10:31:21 +0800 (CST)
X-RM-TRANSID: 2ee26af524f8a92-189fa
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af524f610c-ef34a;
	Thu, 12 Nov 2026 10:31:20 +0800 (CST)
X-RM-TRANSID: 2ee66af524f610c-ef34a
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: chleroy@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] soc: fsl: qbman: Release the private memory node reference
Date: Thu, 12 Nov 2026 10:31:19 +0800
Message-ID: <20261112023119.118215-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183126_151852_071A0F9F 
X-CRM114-Status: UNSURE (   9.34  )
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

qbman_init_private_mem() obtains a node reference through
of_parse_phandle() or of_find_compatible_node(), but never releases it.
The reference leaks on successful initialization and on errors after the
lookup.

Use automatic cleanup to release the reference on every return path once
the reserved memory lookup and any reg property update are complete.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: 42d0349784c7 ("soc/fsl/qbman: Add common routine for QBMan private allocations")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/soc/fsl/qbman/dpaa_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_sys.c
index 3504ff557231..e9c37c45dd58 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -37,7 +37,7 @@
 int qbman_init_private_mem(struct device *dev, int idx, const char *compat,
 			   dma_addr_t *addr, size_t *size)
 {
-	struct device_node *mem_node;
+	struct device_node *mem_node __free(device_node) = NULL;
 	struct reserved_mem *rmem;
 	int err;
 	__be32 *res_array;
-- 
2.51.0




