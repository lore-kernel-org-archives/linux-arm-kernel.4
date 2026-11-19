Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E3606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/7sO9jL;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aVLOjJPO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vQ1ZLgcFUZtCDwuIPYWV9IVqIzUqj1yLDVqQJYwH9Jw=; b=K/7sO9jLFmtGIm
	wyKGh5qSvsXIofgA1e+24Ion5Zm41TrkQYd5LPOwRPZjTzfZBtsHts98CJt1JfRyTZZxAVCvmD3Ky
	ZzPUn7YIWSWzbR0kTdqOqNLrTZ3dOHdOqMHFQlTewOY7t6PHsmC87GNM6BZud3IC+nUOzCm+nbYTt
	jV7O+wxPo3uzoeXPc/dNqeqiLtydgHtOLEaMGanDfJ5kzI0xwBsIJ8wqh1qYRYJ/amThTwIUYC+8k
	g7U3+wgSuuk1afJMOC9O4aK1xgHYQzjqLMcN5+gxDTog+zM8el6w7lNCE/HV3IFsrWVlsf1QgRalw
	PeBKWqovAu/IfnXSyIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Tl-0000000CwD4-15Oq;
	Thu, 19 Nov 2026 18:03:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Tc-0000000Cw6w-14k6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:03:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFCDE1C01;
	Thu, 19 Nov 2026 10:03:12 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BF963F882;
	Thu, 19 Nov 2026 10:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795111395; bh=eIVMSjtan774rHqwKkSyYCnWR4LbX246XkkkxOObdfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aVLOjJPOC1ezbxnVKJuM0R6HTF9dvb5ryFmzIjIrXmJ+YKkraNasP9EorNWZC9bjs
	 xIy6aTfz5yT+LV0pO0ts62WKpiB40nQKi6DuFlTs8BNcJNQMQ5uM8yxqVFOovSjYbW
	 EOsbiyd7EOB+b0HgKotf3ZegpdpRQsEai9qCdNZk=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 18:02:43 +0000
Subject: [PATCH 2/2] docs: arm64: Document booting requirements for POE at
 EL0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_booting_rst-v1-2-bbae0ab68498@arm.com>
References: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
In-Reply-To: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111391; l=1242;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=eIVMSjtan774rHqwKkSyYCnWR4LbX246XkkkxOObdfk=;
 b=me0tEkFynbzyQte8S2k+Go38bFUCipBdC9JyW3F179UPXK1R3uO4A3GQWtdfLCKPoi2S0BSyB
 RCJ9D85wzuXBXK/oTx/8x5K9y5tS9a4b1X2DE07A0HgegTtpFcG5xCq
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100316_342075_7E08A126 
X-CRM114-Status: GOOD (  10.57  )
X-Spam-Score: -4.4 (----)
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

Add missing boot requirements for the kernel to enable FEAT_S1POE at
EL0 (POE is currently unused at EL1). SCR_EL3.PIEn controls trapping
for both PIE and POE registers.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 Documentation/arch/arm64/booting.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 8f22aa7b2c0b..3f31eedd8551 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -515,6 +515,18 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGRWR_EL2.nPIRE0_EL1 (bit 57) must be initialised to 0b1.
 
+  For CPUs with the Stage 1 Permission Overlay Extension feature (FEAT_S1POE):
+
+  - If EL3 is present:
+
+    - SCR_EL3.PIEn (bit 45) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HFGRTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
+
   For CPUs with Guarded Control Stacks (FEAT_GCS):
 
   - GCSCR_EL1 must be initialised to 0.

-- 
2.56.0


