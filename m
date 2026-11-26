Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wna2byAH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bspCBTx3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PxTOYIHvI17Msf41IsUjPdgFC6alqYaSYAKqM9iXWh4=; b=Wna2byAHBHhoPf
	BTdnizNKcnznQFQpk2tOoUX1FdeboJXigqmZcF7QKVQbBregdHTEwZmtqas743u7WzYvHZZRXBPc8
	+5R+5YXz+E76TJh1QCJmRmfC/aOtURGR7u4OC9+GT6q6hN/qXinqCOkOZFW2SFHI70uMbHzk3m64P
	8I1g51IElxmkN0rokvbuKitkx9z3758y2qH5grrrjz0lvloiDSpNVi2s62qijeiM86AHdgcXVOH4L
	VvHCDm3mNUGduFKUkUjPdzqZ2/gzOGe+mdO0ntySuelf/bYidPmQz9jpLsflWW9f130G4dC4UMcZH
	tkvxKE98GSUP7hf+C8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnM-0000000Do1e-1qkm;
	Thu, 26 Nov 2026 15:54:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnF-0000000DnzF-459R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:53:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C7BC62483;
	Thu, 26 Nov 2026 15:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E031F000D8;
	Thu, 26 Nov 2026 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708433;
	bh=PxTOYIHvI17Msf41IsUjPdgFC6alqYaSYAKqM9iXWh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bspCBTx3fsSSd9wXwoHJCk5AqAuB5NUNu4A+UAnGPSynBKM1FFTyyhc57DHVOVaTL
	 arxAyjcjQUuGq/aGvvg23JsP1a7i6h1mmvg4p0cMHsjfS+iGzcn9kUkURAJZLldeAZ
	 RnQGknQP4QeIqbhwWI7iKlW42QXBzepXfprYb1qW1xIQQiZiL01b5RbWJARvtblHoa
	 CmeHuRvBwymaPVQLthhjnqURNS03USzff/cYD4RxF5vm7n+tWQnvgke6MpculorLOW
	 LAdBd6d4DBu5+UuRkU7WeSn+jbZZapWayU+ftT30n7oii+IZoS5RyQhig+UY9yHdTs
	 wkMU6B04xEjEA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Yicong Yang <yangyicong@hisilicon.com>
Subject: [PATCH v2 3/3] kselftest/arm64: Add HWCAP test for FEAT_LS64_ACCDATA
Date: Thu, 26 Nov 2026 16:53:39 +0100
Message-ID: <20261126155339.1349218-4-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126155339.1349218-1-arnd@kernel.org>
References: <20261126155339.1349218-1-arnd@kernel.org>
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

Add tests for FEAT_LS64_ACCDATA, similar to FEAT_LS64 test added in
57a96356bb69 ("kselftest/arm64: Add HWCAP test for FEAT_LS64").

st64bv0 only works on very specific devices and returns a bus error on
anything else, but an illegal instruction on machines without the feature.

Based on an earlier patch by Yicong Yang.

Cc: Yicong Yang <yangyicong@hisilicon.com>
Link: https://lore.kernel.org/all/20241202135504.14252-4-yangyicong@huawei.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 19fca95f7c22..8981a1eed2ca 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -693,6 +693,48 @@ static void ls64_sigill(void)
 	/* ST64B x0, [x8] */
 	asm volatile(".inst 0xf83f9100" : : "r" (xt_1), "r" (xn)
 		     : "x1", "x2", "x3", "x4", "x5", "x6", "x7");
+	sigaction(SIGBUS, &old, NULL);
+}
+
+static void ls64_accdata_sigill(void)
+{
+	struct sigaction ign, old;
+	char dst[64] __aligned(64);
+
+	/*
+	 * Like LS64, LS64_ACCDATA requires both the feature to be
+	 * available in hardware, and the address to be on a device
+	 * capable of the transaction.
+	 * In addition, the device driver that has mapped the device
+	 * must have created a PASID that can be used as ACCDATA.
+	 *
+	 * For testing the ABI, check only that st64bv0 on a user
+	 * address gives the expected SIGBUS error when the instruction
+	 * is not enabled for this thread. If it was enabled, the
+	 * error status would be reported in 'st' instead of a signal,
+	 * but that can only be tested if a PASID is set for this thread.
+	 */
+	ign.sa_sigaction = ignore_signal;
+	ign.sa_flags = SA_SIGINFO | SA_RESTART;
+	sigemptyset(&ign.sa_mask);
+	sigaction(SIGBUS, &ign, &old);
+
+	register void *xn asm ("x8") = dst;
+	register u64 xt_1 asm ("x0") = 1;
+	register u64 xt_2 asm ("x1") = 2;
+	register u64 xt_3 asm ("x2") = 3;
+	register u64 xt_4 asm ("x3") = 4;
+	register u64 xt_5 asm ("x4") = 5;
+	register u64 xt_6 asm ("x5") = 6;
+	register u64 xt_7 asm ("x6") = 7;
+	register u64 xt_8 asm ("x7") = 8;
+	register u64 st asm ("x9");
+
+	/* ST64BV0 x9, x0, [x8] */
+	asm volatile(".inst 0xf829a100" : "=r" (st) :
+			"r" (xt_1), "r" (xt_2), "r" (xt_3), "r" (xt_4),
+			"r" (xt_5), "r" (xt_6), "r" (xt_7), "r" (xt_8),
+			"r" (xn));
 
 	sigaction(SIGBUS, &old, NULL);
 }
@@ -1300,6 +1342,14 @@ static const struct hwcap_data {
 		.sigill_fn = ls64_sigill,
 		.sigill_reliable = true,
 	},
+	{
+		.name = "LS64_ACCDATA",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_LS64_ACCDATA,
+		.cpuinfo = "ls64_accdata",
+		.sigill_fn = ls64_accdata_sigill,
+		.sigill_reliable = true,
+	},
 };
 
 typedef void (*sighandler_fn)(int, siginfo_t *, void *);
-- 
2.53.0


