Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC46606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gFbmN6SA;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fHXdQPEs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=433pLzxHkmCxN1U53BphB4Z144XEI0ZxFQ0624Fy6js=; b=gFbmN6SAwahXcQ
	mF7irXlrNXpAp9RLkCEBtT+I3qtuNHtgkdDWnc6HFDLjoGO8zsDwmrakf0+0rm2E8bN/88keqTx+J
	mCZA6i7fUw6sZee96HKwXooJLkutfwSC5t0Q022v4M5uuok+3px9S7XWEqctWf3tsTiv6hLqsiVa0
	fr1b+D/dYFySWiQIWxysOZOZy2Mb8ZdUQTQiPLXhbsCyB9uuJKyzlKYNtaf1z9/qchKZQ5t7Z4A5w
	qH8NXcEt+r3RdWQD7E9k0lqRAtaoBuZzXpLonzg1x2zrkq16rfAKjRKqzKVduATmJEggIATnW79b3
	gPsssyNSOPJb8aEvi+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF1s-00000000cde-2dMn;
	Sat, 28 Nov 2026 09:47:36 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF1h-00000000cZg-1pO3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:47:26 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b08a3;
	Sat, 28 Nov 2026 17:47:22 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: chleroy@kernel.org,
	tglx@kernel.org,
	bigeasy@linutronix.de
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc: fsl: qbman: Disable manual unbind of BMan portals
Date: Sat, 28 Nov 2026 17:47:21 +0800
Message-ID: <20261128-f81b700d6c-u20-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u20-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u20-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218d5d1c03a1kunm0012fee94521f5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRlLVkgaTBkYSkpOHR9NTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=fHXdQPEsh/x3VjRr0MQQXnzc34clDx8wO91VWMovt6XEwLScNjXcwa3DJxAvmnMuuS8hodvS9wShzeTxzOHcWGYo4h2FTDqjfFoh7bdL5rmVOweqpv+ZuDOLngqctrP5rG5pAIhdbJCsDy+IvmEcG4fJY6cKIKCbzawE4TxbNj8=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=433pLzxHkmCxN1U53BphB4Z144XEI0ZxFQ0624Fy6js=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014725_683926_1A2D63AD 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Per-CPU BMan portals keep their configuration for use by the CPU hotplug
callbacks. Manually unbinding a built-in portal driver frees the
configuration while the portal is still reachable. Suppress its bind and
unbind attributes.

This issue was found by our static analysis tool under development.

Fixes: fce77c3562ec ("soc/fsl/qbman: Convert to hotplug state machine")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/soc/fsl/qbman/bman_portal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/qbman/bman_portal.c b/drivers/soc/fsl/qbman/bman_portal.c
index 046034a7cba3..7ff6f76ea458 100644
--- a/drivers/soc/fsl/qbman/bman_portal.c
+++ b/drivers/soc/fsl/qbman/bman_portal.c
@@ -216,6 +216,7 @@ MODULE_DEVICE_TABLE(of, bman_portal_ids);
 static struct platform_driver bman_portal_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
+		.suppress_bind_attrs = true,
 		.of_match_table = bman_portal_ids,
 	},
 	.probe = bman_portal_probe,
-- 
2.43.0


