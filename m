Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pEXKeZiK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJn55Qyy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sZra0TerZldsipBHqTv2P3SPEtapFN7ughUiasP/Bg0=; b=pEXKeZiKfvsn7JXejYSmaT/ZiF
	XwJt56/mHpKi1H/k3TLMs4Cyt//yk4oTgRZEFiuwJPF5v3gj/GbOg9T9eoAZDZZTU8wA1hcjNBdSn
	hKc4kYsACQ4AjR2f7uxS524h7Xt6WKtcbCyzVgzduuVwseqnzFT2iL2V0MBFr6KLv3ldzWyk8v+sw
	UsEIG2+5dPQEflbaY54OlEQbg4W4qXL/ReLp/mwpZgUuRiS2794Ks5E8ZC+NhCKgFGa03PnOgbLOG
	I+ejGUyGNWrs4CeA7uKikRZp33VBIAQYP6PkcvilywMl3rh8yHSk1U8DmhawFZu/9ynSOmkvFDX4P
	VkOCMa5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpcI-0000000F3S8-3059;
	Fri, 27 Nov 2026 06:39:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpbz-0000000F3Jo-0Gbv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:39:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE20D43895;
	Fri, 27 Nov 2026 06:39:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761550;
	b=Vc02bz1GUABVFi8MnPqPixVakVTViN5frsU9hwfewlvx+U6XOg3pOBmtjyc/jm2fkhMX
	 SCi5FtvGy1qtQKJl0GzWaX4IaT4alMwZNWqeATx6P+KlM55n1RdXcdUwd6hp4ph1bURkP
	 PF+BcIsWsi3V57L+4JjquV87b3n9aZeuxqoPkLiQbcHh+yNfXWccPLaXPxjFEqJ3ojgFc
	 W3K37x6Fo1pTAeYIidmhGYsxgipbLdj0hlOZt582vT8EnrRlxApe6/9w6fMu2t0WoD0oh
	 UGM6nWc6Zhmg7cpmqqqMwSAlWrXTF3LnkjTJ1DFHeQi6PyOwDACDBclRF9d5ck5k4vg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761550;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sZra0TerZldsipBHqTv2P3SPEtapFN7ughUiasP/Bg0=;
	b=FI9OzQwd55ofDgtQ/aVzriSuGxkqc2MXEL9MIspDkN+cmoV6y3fHZmtiLE0n+RWcz6o7
	 qQBrkpE8poVzVPdI2ADwVvwtZYCmKh+bHVqRsubEZUPpiOo8UpsNSpnwDD+QauZZJV1OJ
	 LgtQtNSSO+XQfp7TYGwxXgNNSgwkJeWB01EqvkKSDeF+WGAvJd5EVBLV9iniCHK5+u6WV
	 1A2gjq/gS+JrJnE6TGRKgw9zYe0IN6xytmUBg7UizW4pPaYD04lkncr7vssKSO+B6x186
	 WfvRlORQROdTU/Pjr6yN1lAUPKRh8SDe8aNEyV7Hl4IfXi8VvGWtSMjzM8jgGvQFOJg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15EBB1F00933;
	Fri, 27 Nov 2026 06:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761550;
	bh=sZra0TerZldsipBHqTv2P3SPEtapFN7ughUiasP/Bg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gJn55QyyIb4stKiE3ASfxqRw9o67SeZVvlvtfHjq4dKkujTTe3fysROXdlq1XYpie
	 0ZrpVJlIeSijBLgnndfuqtpEZtjMl/RIkSwd/yxwHH/fDaXJaVXp7+sAuzve500owx
	 JgvFEx8FEe7by/o6r2c4sHEjdzegO+FXKGc7Ht6bZogEmyQdsgPfBBlowvIKMVAz1N
	 7q4rf2IrCh5oZyqaXoaulv1KQ57t4k7KvXww/HWYMftK5VohKqIX+CmoKCljJSrr9c
	 wiKLT+M4KvdaBcTp/DD5ksjC5CYgdGedJX+48fJGn9ZUQJjftl4D9mA1i74VE0GQDV
	 liAT/uAiSKd/Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 365A74B5E0;
	Fri, 27 Nov 2026 06:38:47 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:47 +0200
Subject: [PATCH RFC 10/10] coresight: cpu-debug: Print the dump at the
 warning level
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-10-69d3ad1e0fc8@iav.lv>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3896; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=GCm7+tmPZo0cIkK8iPjB0jGTJ009NE8OZzHsJ6RWlHA=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqiXz/09TsGsyPXvvBUfXipd7OoqmvfQ19tR3f7m79
 B535MvZHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiAf6MDPdqecSNy8X+Py/T
 LEy7fChNt6qdJf33/f9f3TWmXgnf9YWRocF6R198nnRh7No5vtP0RSa8sn51VaNsa3BpUbO4pvY
 UNgA=
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

The dump comes from backtrace requests, which also happen on a system
that keeps running, for example on SysRq-l or on an RCU stall warning.

Print it at the warning level, like the "these CPUS still haven't
responded" line it follows.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 44 +++++++++++------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 5c5a1f6a6e33..860c31b4e025 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -321,8 +321,8 @@ static unsigned long debug_adjust_pc(struct debug_drvdata *drvdata)
 	 * case and print info for notice.
 	 */
 	if (pc & BIT(1))
-		dev_emerg(drvdata->dev,
-			  "Instruction offset is implementation defined\n");
+		dev_warn(drvdata->dev,
+			 "Instruction offset is implementation defined\n");
 	else
 		pc = (pc & EDPCSR_ARM_INST_MASK) - arm_inst_offset;
 
@@ -335,38 +335,38 @@ static void debug_dump_regs(struct debug_drvdata *drvdata)
 	struct device *dev = drvdata->dev;
 	unsigned long pc;
 
-	dev_emerg(dev, " EDPRSR:  %08x (Power:%s Reset:%s DLK:%s)\n",
-		  drvdata->edprsr,
-		  drvdata->edprsr & EDPRSR_PU ? "On" : "Off",
-		  drvdata->edprsr & EDPRSR_R ? "Yes" : "No",
-		  drvdata->edprsr & EDPRSR_DLK ? "Lock" : "Unlock");
+	dev_warn(dev, " EDPRSR:  %08x (Power:%s Reset:%s DLK:%s)\n",
+		 drvdata->edprsr,
+		 drvdata->edprsr & EDPRSR_PU ? "On" : "Off",
+		 drvdata->edprsr & EDPRSR_R ? "Yes" : "No",
+		 drvdata->edprsr & EDPRSR_DLK ? "Lock" : "Unlock");
 
 	if (!debug_access_permitted(drvdata)) {
-		dev_emerg(dev, "No permission to access debug registers!\n");
+		dev_warn(dev, "No permission to access debug registers!\n");
 		return;
 	}
 
 	if (drvdata->edpcsr == EDPCSR_PROHIBITED) {
-		dev_emerg(dev, "CPU is in Debug state or profiling is prohibited!\n");
+		dev_warn(dev, "CPU is in Debug state or profiling is prohibited!\n");
 		return;
 	}
 
 	pc = debug_adjust_pc(drvdata);
-	dev_emerg(dev, " EDPCSR:  %pS\n", (void *)pc);
+	dev_warn(dev, " EDPCSR:  %pS\n", (void *)pc);
 
 	if (drvdata->edcidsr_present)
-		dev_emerg(dev, " EDCIDSR: %08x\n", drvdata->edcidsr);
+		dev_warn(dev, " EDCIDSR: %08x\n", drvdata->edcidsr);
 
 	if (drvdata->edvidsr_present)
-		dev_emerg(dev, " EDVIDSR: %08x (State:%s Mode:%s Width:%dbits VMID:%x)\n",
-			  drvdata->edvidsr,
-			  drvdata->edvidsr & EDVIDSR_NS ?
-			  "Non-secure" : "Secure",
-			  drvdata->edvidsr & EDVIDSR_E3 ? "EL3" :
+		dev_warn(dev, " EDVIDSR: %08x (State:%s Mode:%s Width:%dbits VMID:%x)\n",
+			 drvdata->edvidsr,
+			 drvdata->edvidsr & EDVIDSR_NS ?
+			 "Non-secure" : "Secure",
+			 drvdata->edvidsr & EDVIDSR_E3 ? "EL3" :
 				(drvdata->edvidsr & EDVIDSR_E2 ?
 				 "EL2" : "EL1/0"),
-			  drvdata->edvidsr & EDVIDSR_HV ? 64 : 32,
-			  drvdata->edvidsr & (u32)EDVIDSR_VMID);
+			 drvdata->edvidsr & EDVIDSR_HV ? 64 : 32,
+			 drvdata->edvidsr & (u32)EDVIDSR_VMID);
 }
 
 static void debug_init_arch_data(void *info)
@@ -441,18 +441,18 @@ static int debug_stall_notifier_call(struct notifier_block *self,
 			continue;
 
 		if (!banner) {
-			pr_emerg("ARM external debug module:\n");
+			pr_warn("ARM external debug module:\n");
 			banner = true;
 		}
 
 		idle = cpumask_test_cpu(cpu, stall->idle);
 		if (idle && READ_ONCE(debug_skip_idle)) {
-			dev_emerg(drvdata->dev, "CPU[%d]: idle, not sampled\n",
-				  drvdata->cpu);
+			dev_warn(drvdata->dev, "CPU[%d]: idle, not sampled\n",
+				 drvdata->cpu);
 			continue;
 		}
 
-		dev_emerg(drvdata->dev, "CPU[%d]:\n", drvdata->cpu);
+		dev_warn(drvdata->dev, "CPU[%d]:\n", drvdata->cpu);
 
 		if (idle)
 			debug_read_regs(drvdata);

-- 
2.43.0



