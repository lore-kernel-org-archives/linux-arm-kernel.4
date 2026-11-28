Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5280D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UROmd70G;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=TaPwroic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a6KQkBDlOnA+9cBuc86DyZ2pfHU8+DqCe8yKhntGTCg=; b=UROmd70Gm4I91O
	W1swtCyyIl/XtBVsYiK6kYG8vQGk3dVtxIrV+Qa2E9cctjrkOmYx6dWh8yrCrQuELdNwrUkD0uv2h
	Vy86n1jFMXu/zDAlAIDvFoW69h7OfnVrIoRH53ePhMK/IyHSMfFZz0DqluWiehF+82Ebm3A1AIcm2
	BIw4EEuq0qxvfVn5wsnfZBGv5BkWPrBocUQp+nIR68pNYpHqakW6xvQurKLH6SS3Lz3SZRUVlJlpC
	+EQSd0c3qfiZhr6HKUA4ZoEAouL63WmwkWbYR6gtBzesmJsZUOj4lo4YQFM82pyS1QJ7tNRgxv4rU
	gEmeUXYOvqw74GLBp8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF1s-00000000cdp-34Qc;
	Sat, 28 Nov 2026 09:47:36 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF1j-00000000caL-05Rz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:47:28 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b08a4;
	Sat, 28 Nov 2026 17:47:24 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: chleroy@kernel.org,
	tglx@kernel.org,
	bigeasy@linutronix.de
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] soc: fsl: qbman: Disable manual unbind of QMan portals
Date: Sat, 28 Nov 2026 17:47:23 +0800
Message-ID: <20261128-f81b700d6c-u20-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u20-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u20-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218d643503a1kunm46250e204521f9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHx1LVkNLGR0aGE9ITB0ZH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=TaPwroic10OPXmLqyPUOuLy5ul37dQOaldnQbnp7SDvtY1mv3H94Bm8/KE9VxxLeRw1nmTS+htTL8ymFSyif6jXBmgncXHGtQCLfgrCrDScgk1rHGpDXNpo6O/1Ahl1gp02ZIu71P6K9qRQ6nVGVkPIza6kddz7XQoQj5sGvmsk=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=a6KQkBDlOnA+9cBuc86DyZ2pfHU8+DqCe8yKhntGTCg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014727_257967_8C160938 
X-CRM114-Status: UNSURE (   7.98  )
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

The CPU hotplug callbacks continue to use the per-CPU QMan portal
configuration after a manual unbind. Keep the built-in portal bound
while it participates in frame queue management and CPU migration.

This issue was found by our static analysis tool under development.

Fixes: 1f759d328f6d ("soc/fsl/qbman: Convert to hotplug state machine")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/soc/fsl/qbman/qman_portal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
index d2063a86866a..a93e4fcbb63f 100644
--- a/drivers/soc/fsl/qbman/qman_portal.c
+++ b/drivers/soc/fsl/qbman/qman_portal.c
@@ -315,6 +315,7 @@ MODULE_DEVICE_TABLE(of, qman_portal_ids);
 static struct platform_driver qman_portal_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
+		.suppress_bind_attrs = true,
 		.of_match_table = qman_portal_ids,
 	},
 	.probe = qman_portal_probe,
-- 
2.43.0


