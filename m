Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0r381Tz0;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=oCfNzuQZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OKPZQyJsCxKmvcu3evgCAn8bCU003kDuUuvj5pSvgRY=; b=0r381Tz0Xbprb9
	453V0DeQwXcFOW2ZuvU55zJkATO63mJYYMGU5pOQRsrDiTf9aCw2TT20jEojurgcsZyMdLeSMMc1N
	ApayCuQP98YpS58mzn910KwVH8D4zmaujYP7YhGNM9/zbT4/FhE7zSvRRjPwTlns94qtlf/6Xp8G5
	V9lWdFx+bseXj2mRKWgQDf2ykqgqleqCkDzyDxiPB4LrP9hwaJRKqb/HRLJ6Tc9svgQtFL3D1IoWr
	Be6p5peKIZmiVbw6XjxzxRQ8Sbt2E8UjFqRm/Qq92IJV/9kqV6wUnBsTcco9q1BXFtc/1l76XoBgs
	WUndjfryKR5R41c6t79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMc-00000003CT8-1flH;
	Mon, 23 Nov 2026 11:37:38 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMX-00000003CQz-26el
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795433853; x=1826969853;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4V18Tfg9Ly6MPWUMnLZiqruGXQUpnrBi9GEGXYzKK7I=;
  b=oCfNzuQZmzA9/4J2V6s4OAVYbvqpEp1A9hbw5+JWW9XvP/5SpNh+jfvx
   pKLXUGTKQFPTK6YYovR1yFiHNyUfvJrclvLhfhid7opGOAdLUPAYinUWi
   mNEAS+hCCCKjTc07iRYJIHTQHiKpPW9362hbCbw/mqU2HdR0xloHXINcD
   L9HstMENRSph7ietjJ8uWJShGShAcsFZTydBamw7lnAB7eZUYs26HgN7N
   O707TNwTGEa2lzzdx4YvOdMex9ukva1+IRaxbwLFW48nhyRnQa+k0mVkc
   xqxKYuKwKsGjFftnIf0or2P3B3iP7D5by7lvGkfgQs5M+hK2CXR0PinTh
   A==;
X-CSE-ConnectionGUID: 8qNEtdamTQe7y+juy3+hkQ==
X-CSE-MsgGUID: ghcQRi4XRYS7mbvPZ5slqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 13:37:31 +0200
X-CSE-ConnectionGUID: qZJxtW2yTseV96LosV/AHg==
X-CSE-MsgGUID: yOytxXA3SDmIRqsH5JK2/w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 23 Nov 2026 13:45:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Nov 2026 13:37:29 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Nov 2026 13:37:12 +0200
Subject: [PATCH v4 2/6] MIPS: CM: add CM3 performance counter GCR
 definitions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-i6500-cm3-pmu-v4-2-5a9f5351688f@mobileye.com>
References: <20261123-i6500-cm3-pmu-v4-0-5a9f5351688f@mobileye.com>
In-Reply-To: <20261123-i6500-cm3-pmu-v4-0-5a9f5351688f@mobileye.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Fu Chao-Ying <chao-ying.fu@globalfoundries.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-hardening@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033733_859169_71C11C41 
X-CRM114-Status: GOOD (  16.24  )
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


