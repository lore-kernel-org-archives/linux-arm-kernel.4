Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EwPANmmj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlNdl11d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QMVYWj4bXlkZEY5osWZHFiVPY11NYOtrpFxkEUnbsig=; b=EwPANmmjSBViiH/AItlrX193Ri
	J9s3pwSgVVl+5guj1O/yKUGodhOCsREUrPH1oiudQbAmTr/JL/U0w21WSf5k6mvGOhKWkf1U0oo6P
	2d7d1VIeaafx0v/SVmMoEyhUA3mSZbwYCHQkJH9SwvsGVLzgQ5MeNmj6Eehi0l8d8i/VsVucGbcso
	0hvqmmpjcPo7fLCt8QqnSgw1hiIEstAE9ISiNfVD2vu/0VjSpJZ6mheO90h3Ya5fD/pCsgr+OwxS+
	2lxCyXvaglvh+V+A0aSlMzTKOS1unOcR4JdernYmNW7WN4vOywK5Mi/8ovfgFlPd+XCQZxN292CBB
	k8e8Ij4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpcH-0000000F3Qn-41rb;
	Fri, 27 Nov 2026 06:39:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpbt-0000000F3Fb-0NkK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:39:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D296D40244;
	Fri, 27 Nov 2026 06:39:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761544;
	b=IqZHV9oOQlvU72sIHLjaHggl85RZGdygFqW9/i10ofJsBsHlyazP63v/hmSQNETnR/nw
	 vOKVbrNnsJNQBWTDE1TXfBtOsnnuO3TJdJef2TMTTW6aIyPF8SbDz4BL0hj+cRIq+ugFW
	 +gb6RFb4rMOVxuVgQX/COs/tLnm5D3zP4PmBa47P3o1z7Cr7jMt6SILdkIhcQSpTUjWQ8
	 MRx+wS6zqjPjMdkm4yRPEyhIN0SezXQn/vYX9YGh/rvn3mF3sEnxoorcvH0f6oJdYDulz
	 qbKF8xKn+84eE5wYbz/BtK+EWGKzJqTkmEJDGFinL/Oycf8XFsbBr+UltDvNSGbm9og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761544;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QMVYWj4bXlkZEY5osWZHFiVPY11NYOtrpFxkEUnbsig=;
	b=tHotIQBJccm+UfH2BNkAG97HrpC0ZnRTfzyWCG4Hd+58a7KomozdzhxYkVN2K6Sp63Z8
	 gd4rTGd4iJQO/Wo2mBz2/YI4RGJlFdctfnYU/5eFPReV/4CyRta0n8vnW0uSPOUfIsvZj
	 lDsXuAXM5NjCZxNBwEDNaZDCJIjVCZUc6IAmJSsztY4B1e7D+11RBcnP7G3dcJ9tsJXWS
	 ioLKlwanxvMA0yLqDHIvewqiKuGC8lniRzbYFHI4r45FmKqYE6GnTtpF8M+LsH/SyF19o
	 bQmHbOTjtceo9u2mWJXYKI95Q33rW5FnkgtHL1EeSPM4zmLsECR5KnFgkbMbRoVTHeA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12AD71F0089B;
	Fri, 27 Nov 2026 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761544;
	bh=QMVYWj4bXlkZEY5osWZHFiVPY11NYOtrpFxkEUnbsig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nlNdl11dgwxet4s3nqSL17uio0jHoV9xg2pdk82pRoNs+sksrIIaEp2A8Jvwo+Yvc
	 P65I1R/RF+PfIstoZ73A8FLcvP/wO91epxelI0l3THfQMCkuStW60+eFFFubyMlyvY
	 xAAyUyDHPOG2g3NSNnq5zSkJljZW7QZTnClmrJAotyaGqzMJjiAiO2ZbaxBoTWSvsB
	 FhIzYMzftgzmtt4IH3uq+edHOrtzdyhCju3x1Ug9tqsTlet49lw7NClGIXjGt1eEnC
	 IVkaid3ypTUG07fzKyA0ZWHwsA/37YPpzWoboeQIc2XjYaweBoDqdjgIL/fT8jopUH
	 AR/IcJOL8ipGA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 852E84B5CC;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:42 +0200
Subject: [PATCH RFC 05/10] coresight: cpu-debug: Do not sample a core that
 is in reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-5-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=tmVd95P84NWuwX8kkEkvDAkpADpu+/ySXwvKuYqsquA=;
 b=kA0DAAoWMpeVi+pfeQMByyZiAGsJJXKg9FySgRgbmMFUWOvWYE0orsAY00k/u3+touPMlk4B5
 Ih1BAAWCgAdFiEEkMIo2mik1f1PSDfgMpeVi+pfeQMFAmsJJXIACgkQMpeVi+pfeQMN1wD/UpEA
 FZm0PvjJa04cuKMqqOm4nD33RYPU2BkA8Wmw6EUA/1/s6XKuTmM6gF+QdwdvAb1B58oTyOLXyNZ
 t1hM4TAoG
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

debug_access_permitted() lets the driver read the sampling registers
when EDPRSR shows the core powered and the OS Double Lock clear. A core
can be powered and held in reset: an idle Cortex-A72 on RK3399 reads
PU = 1, R = 1, and a read of its EDPCSR aborts.

Treat a core that EDPRSR reports in reset as not accessible, and print
the bit in the dump.

debug_read_regs() writes EDOSLAR before it reads EDPRSR, and on RK3399
that write already faults for such a core. The check covers the path
added later in this series, which reads EDPRSR first.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 Documentation/trace/coresight/coresight-cpu-debug.rst | 4 ++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c     | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
index 32fbae244524..04bfd318cb2b 100644
--- a/Documentation/trace/coresight/coresight-cpu-debug.rst
+++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
@@ -182,12 +182,12 @@ Here is an example of the debugging output format::
 
   ARM external debug module:
   coresight-cpu-debug 850000.debug: CPU[0]:
-  coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
+  coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On Reset:No DLK:Unlock)
   coresight-cpu-debug 850000.debug:  EDPCSR:  handle_IPI+0x174/0x1d8
   coresight-cpu-debug 850000.debug:  EDCIDSR: 00000000
   coresight-cpu-debug 850000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
   coresight-cpu-debug 852000.debug: CPU[1]:
-  coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
+  coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On Reset:No DLK:Unlock)
   coresight-cpu-debug 852000.debug:  EDPCSR:  debug_notifier_call+0x23c/0x358
   coresight-cpu-debug 852000.debug:  EDCIDSR: 00000000
   coresight-cpu-debug 852000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 9a8ce85fc468..64b5abe33aa8 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -51,6 +51,7 @@
 
 /* bits definition for EDPRSR */
 #define EDPRSR_DLK			BIT(6)
+#define EDPRSR_R			BIT(2)
 #define EDPRSR_PU			BIT(0)
 
 /* bits definition for EDVIDSR */
@@ -129,6 +130,7 @@ static void debug_os_unlock(struct debug_drvdata *drvdata)
  * registers to avoid lockup issue:
  *
  * - CPU power domain is powered off;
+ * - The CPU is in reset;
  * - The OS Double Lock is locked;
  *
  * By checking EDPRSR can get to know if meet these conditions.
@@ -139,6 +141,10 @@ static bool debug_access_permitted(struct debug_drvdata *drvdata)
 	if (!(drvdata->edprsr & EDPRSR_PU))
 		return false;
 
+	/* CPU is in reset */
+	if (drvdata->edprsr & EDPRSR_R)
+		return false;
+
 	/* The OS Double Lock is locked */
 	if (drvdata->edprsr & EDPRSR_DLK)
 		return false;
@@ -293,9 +299,10 @@ static void debug_dump_regs(struct debug_drvdata *drvdata)
 	struct device *dev = drvdata->dev;
 	unsigned long pc;
 
-	dev_emerg(dev, " EDPRSR:  %08x (Power:%s DLK:%s)\n",
+	dev_emerg(dev, " EDPRSR:  %08x (Power:%s Reset:%s DLK:%s)\n",
 		  drvdata->edprsr,
 		  drvdata->edprsr & EDPRSR_PU ? "On" : "Off",
+		  drvdata->edprsr & EDPRSR_R ? "Yes" : "No",
 		  drvdata->edprsr & EDPRSR_DLK ? "Lock" : "Unlock");
 
 	if (!debug_access_permitted(drvdata)) {

-- 
2.43.0



