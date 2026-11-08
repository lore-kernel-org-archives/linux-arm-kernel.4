Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Noml2Wz4;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=P6CSed8M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OKPZQyJsCxKmvcu3evgCAn8bCU003kDuUuvj5pSvgRY=; b=Noml2Wz4DyXQL2
	9AI7QKupfbOyXHg7ILDCaO8MslA8zVnTOHFQ5gudYFy9RLh16WboBy7fLS6lIJlhTXOc0Szo4I9mr
	kTwf178uMZdk3u+PBVxgi7vz9v/2/KhiAxgjJpQ6wUYrwB7V6ejXXg5anIsbI6AbaJzn13hyBhLFB
	/I/73wJxcJ6fu6BZDO10Xz79VdMx1TeuuLX6Cw7tSQBJHbj2YHm8R+rwxuHgMn5OWCiKR1q1GKWjK
	kOMTrQlmYOXTWWp9JOGKLqUrc4nTl+4Y+W9vvXsmsaQ7+U/wDULiTtdgVp8ChtqthI79z5A0nG0If
	yZpUSSUb6dPmM1J8BCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2p5-0000000GCIk-0ets;
	Sun, 08 Nov 2026 13:20:39 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2ox-0000000GCDn-1V79
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 13:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794144031; x=1825680031;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4V18Tfg9Ly6MPWUMnLZiqruGXQUpnrBi9GEGXYzKK7I=;
  b=P6CSed8MaJMC5CcInzUIjzG62q+Fv5OXuJhG0NJKX/hTDRoeaXpT6Bc2
   j7RzR2GuvmKorJrAa5G67OFkD8ECb61/gyD/SzGqPpZxYEmwMN+AgnDhD
   DyGj9B7LHNOlR29YQ28XYIGwup7cSoSWUSFlY35SeEw5rm3JjPEiqAMXQ
   5cgwYICjUyIvmjITotWcAJLk2vufolMcx2s/30aCW+5HHGubDh/aHAby0
   8S9OaH0LJ5lJhcu4XsaJ1wzj17+cBgAwChXU/y4Umh9R+QRfnygNfBQ1k
   vjyQhiVg2j5rp4VqWSm5jSbR/EHXZzH3gbBNH9NdhuH/FS5GeB9Synt/G
   w==;
X-CSE-ConnectionGUID: zybtT9kDR5GGTu2OsmKe5A==
X-CSE-MsgGUID: eWr8sC4vR66rwav3b/XcwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 15:20:27 +0200
X-CSE-ConnectionGUID: f/8VzZ2vQ+GxPA0q6sIThQ==
X-CSE-MsgGUID: LXSvwY2eSq6y8FZ7rEvvEw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 08 Nov 2026 15:28:27 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 08 Nov 2026 15:20:25 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Sun, 08 Nov 2026 15:20:10 +0200
Subject: [PATCH 1/5] MIPS: CM: add CM3 performance counter GCR definitions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-i6500-cm3-pmu-v1-1-bd119584891a@mobileye.com>
References: <20261108-i6500-cm3-pmu-v1-0-bd119584891a@mobileye.com>
In-Reply-To: <20261108-i6500-cm3-pmu-v1-0-bd119584891a@mobileye.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Fu Chao-Ying <chao-ying.fu@globalfoundries.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_052032_091341_5DC8C585 
X-CRM114-Status: GOOD (  16.13  )
X-Spam-Score: -4.0 (----)
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

The CM3 implements two programmable 32-bit performance counters and a
32-bit cycle counter, controlled through registers in the GCR global
debug block (GCR_DB_PC_*, offset 0x6100..0x61a8 from GCR_BASE).

Add GCR_DB_ACCESSOR_{RO,RW} helpers for the debug block and define the
control, overflow status, event select, cycle counter, qualifier and
counter registers along with their fields, as described in the I6500
register reference (MD01189).

Each accessor comes in two flavours, as the CPC ones do: db_<reg> for
the local cluster and redir_db_<reg> for the debug block of another
cluster through the redirect block. GCR_Cx_OTHER.BLOCK value 2 selects
the debug block in the GCR, where the existing _BLOCK_USER name only
describes its GIC meaning; add CM_GCR_Cx_OTHER_BLOCK_DEBUG for it.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/mips/include/asm/mips-cm.h | 51 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 407f253bb4a1..390d06a8f1d1 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -161,6 +161,20 @@ static inline bool mips_cm_has_l2sync(void)
 	CPS_ACCESSOR_RW(gcr, sz, MIPS_CM_CLCB_OFS + off, cl_##name)	\
 	CPS_ACCESSOR_RW(gcr, sz, MIPS_CM_COCB_OFS + off, co_##name)
 
+/*
+ * Global debug block registers. The redir_db_* accessors reach the debug
+ * block of another cluster through the redirect block, which must have been
+ * pointed at it with mips_cm_lock_other(cluster, 0, 0,
+ * CM_GCR_Cx_OTHER_BLOCK_DEBUG).
+ */
+#define GCR_DB_ACCESSOR_RO(sz, off, name)				\
+	CPS_ACCESSOR_RO(gcr, sz, MIPS_CM_GDB_OFS + off, db_##name)	\
+	CPS_ACCESSOR_RO(gcr, sz, MIPS_CM_COCB_OFS + off, redir_db_##name)
+
+#define GCR_DB_ACCESSOR_RW(sz, off, name)				\
+	CPS_ACCESSOR_RW(gcr, sz, MIPS_CM_GDB_OFS + off, db_##name)	\
+	CPS_ACCESSOR_RW(gcr, sz, MIPS_CM_COCB_OFS + off, redir_db_##name)
+
 /* GCR_CONFIG - Information about the system */
 GCR_ACCESSOR_RO(64, 0x000, config)
 #define CM_GCR_CONFIG_CLUSTER_COH_CAPABLE	BIT_ULL(43)
@@ -357,7 +371,8 @@ GCR_CX_ACCESSOR_RW(32, 0x018, other)
 #define CM_GCR_Cx_OTHER_BLOCK			GENMASK(25, 24)	/* CM >= 3.5 */
 #define  CM_GCR_Cx_OTHER_BLOCK_LOCAL		0
 #define  CM_GCR_Cx_OTHER_BLOCK_GLOBAL		1
-#define  CM_GCR_Cx_OTHER_BLOCK_USER		2
+#define  CM_GCR_Cx_OTHER_BLOCK_USER		2	/* GIC */
+#define  CM_GCR_Cx_OTHER_BLOCK_DEBUG		2	/* GCR */
 #define  CM_GCR_Cx_OTHER_BLOCK_GLOBAL_HIGH	3
 #define CM_GCR_Cx_OTHER_CLUSTER			GENMASK(21, 16)	/* CM >= 3.5 */
 #define CM3_GCR_Cx_OTHER_CORE			GENMASK(13, 8)	/* CM >= 3 */
@@ -384,6 +399,40 @@ GCR_CX_ACCESSOR_RW(32, 0x030, reset_ext_base)
 #define CM_GCR_Cx_RESET_EXT_BASE_BEVEXCPA	GENMASK(7, 1)
 #define CM_GCR_Cx_RESET_EXT_BASE_PRESENT	BIT(0)
 
+/* GCR_DB_PC_CTL - Control of the CM3 performance counters */
+GCR_DB_ACCESSOR_RW(32, 0x100, pc_ctl)
+#define CM_GCR_DB_PC_CTL_PERF_INT_EN		BIT(30)
+#define CM_GCR_DB_PC_CTL_PERF_OVF_STOP		BIT(29)
+#define CM_GCR_DB_PC_CTL_P1_RESET		BIT(9)
+#define CM_GCR_DB_PC_CTL_P1_COUNTON		BIT(8)
+#define CM_GCR_DB_PC_CTL_P0_RESET		BIT(7)
+#define CM_GCR_DB_PC_CTL_P0_COUNTON		BIT(6)
+#define CM_GCR_DB_PC_CTL_CYCL_CNT_RESET		BIT(5)
+#define CM_GCR_DB_PC_CTL_CYCL_CNT_COUNTON	BIT(4)
+#define CM_GCR_DB_PC_CTL_PERF_NUM_CNT		GENMASK(3, 0)
+
+/* GCR_DB_PC_OV - CM3 performance counter overflow status (write 1 to clear) */
+GCR_DB_ACCESSOR_RW(32, 0x120, pc_ov)
+#define CM_GCR_DB_PC_OV_P1_OF			BIT(2)
+#define CM_GCR_DB_PC_OV_P0_OF			BIT(1)
+#define CM_GCR_DB_PC_OV_CYCL_CNT_OF		BIT(0)
+
+/* GCR_DB_PC_EVENT - CM3 performance counter event selection */
+GCR_DB_ACCESSOR_RW(32, 0x130, pc_event)
+#define CM_GCR_DB_PC_EVENT_P1_EVENT		GENMASK(15, 8)
+#define CM_GCR_DB_PC_EVENT_P0_EVENT		GENMASK(7, 0)
+
+/* GCR_DB_PC_CYCL - CM3 performance cycle counter */
+GCR_DB_ACCESSOR_RW(32, 0x180, pc_cycl)
+
+/* GCR_DB_PC_QUALn - CM3 performance counter n event qualifier */
+GCR_DB_ACCESSOR_RW(64, 0x190, pc_qual0)
+GCR_DB_ACCESSOR_RW(64, 0x1a0, pc_qual1)
+
+/* GCR_DB_PC_CNTn - CM3 performance counter n value */
+GCR_DB_ACCESSOR_RW(32, 0x198, pc_cnt0)
+GCR_DB_ACCESSOR_RW(32, 0x1a8, pc_cnt1)
+
 /**
  * mips_cm_l2sync - perform an L2-only sync operation
  *

-- 
2.43.0


