Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C9606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ru2g2l7X;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=lS9m8UYC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8VjKfFnIZSkrCLXCygsuoSQMlE9SiraWmXyOrGKYFrE=; b=Ru2g2l7XTfVlHU
	arQjbhCCPbRN6NZSyIDp2aPIbzEfJTqjpVVl8RaRBHsmrMFUp1GvphvZI0U9AXSTIxZakz2Tjb4sY
	brdbbdUiZl1DfBLfPGtoYM8RDOKF8+RYH5bDHIl2etCAK62oINNOsGJOSa+Qbut3wcD/6n0TCSlTB
	4YwvcWetxd39zDUrzjloqBtE8jNSGnxuiSiuN/3+un3GkYGqD/90YE1lSu/rs+WjWr3wgq54brLAX
	wp8b9+ie88yaU1BZvhrotEwAHXI4bZ/h4zCk+SeoH6+8/65YOXKETUfUOPgCjMo06s+Xqv1/+nj8K
	NIUxxYMZHCmK4kB5G4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMk-00000003CZU-2aJk;
	Mon, 23 Nov 2026 11:37:46 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMc-00000003CQq-0hSY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795433858; x=1826969858;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6HSsbhIJ2/LzJaFX+VzpT4jqVpYrVahm8NgRsq5w1c0=;
  b=lS9m8UYCLAGgI9u5grkz1QE/k3KkeIYEGu3IsOPbpsJdFYiX4KGiWvCb
   I8WtRmQzKlRzE9QVcJqHrRCYMSYUqnqKTUyJ+OEAP+bbZneJtQU7B+f0n
   3tsw5H35vg3lr0tGlUqOW2G04ANxSr5XA/oKBVjRrNtT6SB81rz8zhzxX
   DHOl9RCAQHw1ruZo1gWrVxTlgXfqslXM3BZzbYBIXipOr7CSCQaJyfIpQ
   NMT4kBIxxmTsCFfcbyV/Vw94OK4/dHnXU1fwcv6ykHaBZD3H/ZMJ4aIUM
   DP3WMV/RNiFrEgfcPOncdTEC4TdhmC9c5II3KVKIJnrM/fB2jPqcPRAZz
   g==;
X-CSE-ConnectionGUID: CwCs2L1ARR6js4e9gi2O+w==
X-CSE-MsgGUID: kGugUjZETNe+6wfAC83CIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 13:37:29 +0200
X-CSE-ConnectionGUID: wwCti2eIQNyQPVs2zMcl2w==
X-CSE-MsgGUID: zZwA3l2rQHeuaw3KjWwvFQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 23 Nov 2026 13:45:49 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Nov 2026 13:37:28 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Nov 2026 13:37:11 +0200
Subject: [PATCH v4 1/6] mips: {cm,cpc}: Make cm_core_lock, cpc_core_lock
 raw spinlocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-i6500-cm3-pmu-v4-1-5a9f5351688f@mobileye.com>
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
 linux-hardening@vger.kernel.org, Paul Burton <paulburton@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033738_538702_5931187A 
X-CRM114-Status: GOOD (  15.86  )
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

From: Paul Burton <paul.burton@mips.com>

cm_core_lock and cpc_core_lock are used to protect access to a CPU's
core-other/redirect CM and CPC register blocks. Since each CPU sees
its own copy of this block, we need to ensure that critical sections
holding a cm_core_lock run on one CPU - ie. we need to disable
preemption.

Use raw_spinlock_t to implement cm_core_lock and cpc_core_lock in
order to provide the guarantees we need on PREEMPT_RT systems.

Signed-off-by: Paul Burton <paul.burton@mips.com>
[added CPC part]
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/mips/kernel/mips-cm.c  | 20 ++++++++++----------
 arch/mips/kernel/mips-cpc.c | 12 ++++++------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 7c9c5dc38823..3bfe85e86a9a 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -179,7 +179,7 @@ static char *cm3_causes[32] = {
 	"0x19", "0x1a", "0x1b", "0x1c", "0x1d", "0x1e", "0x1f"
 };
 
-static DEFINE_PER_CPU_ALIGNED(spinlock_t, cm_core_lock);
+static DEFINE_PER_CPU_ALIGNED(raw_spinlock_t, cm_core_lock);
 static DEFINE_PER_CPU_ALIGNED(unsigned long, cm_core_lock_flags);
 
 phys_addr_t __weak mips_cm_phys_base(void)
@@ -309,7 +309,7 @@ int mips_cm_probe(void)
 	mips_cm_is64 = IS_ENABLED(CONFIG_64BIT) && (mips_cm_revision() >= CM_REV_CM3);
 
 	for_each_possible_cpu(cpu)
-		spin_lock_init(&per_cpu(cm_core_lock, cpu));
+		raw_spin_lock_init(&per_cpu(cm_core_lock, cpu));
 
 	return 0;
 }
@@ -347,8 +347,8 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 		 * mips_cm_lock_other() leading to a deadlock or a nice warning
 		 * with lockdep enabled.
 		 */
-		spin_lock_irqsave(this_cpu_ptr(&cm_core_lock),
-				  *this_cpu_ptr(&cm_core_lock_flags));
+		raw_spin_lock_irqsave(this_cpu_ptr(&cm_core_lock),
+				      *this_cpu_ptr(&cm_core_lock_flags));
 	} else {
 		WARN_ON(cluster != 0);
 		WARN_ON(block != CM_GCR_Cx_OTHER_BLOCK_LOCAL);
@@ -359,8 +359,8 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 		 * race with us.
 		 */
 		curr_core = cpu_core(&current_cpu_data);
-		spin_lock_irqsave(&per_cpu(cm_core_lock, curr_core),
-				  per_cpu(cm_core_lock_flags, curr_core));
+		raw_spin_lock_irqsave(&per_cpu(cm_core_lock, curr_core),
+				      per_cpu(cm_core_lock_flags, curr_core));
 
 		val = FIELD_PREP(CM_GCR_Cx_OTHER_CORENUM, core);
 	}
@@ -380,11 +380,11 @@ void mips_cm_unlock_other(void)
 
 	if (mips_cm_revision() < CM_REV_CM3) {
 		curr_core = cpu_core(&current_cpu_data);
-		spin_unlock_irqrestore(&per_cpu(cm_core_lock, curr_core),
-				       per_cpu(cm_core_lock_flags, curr_core));
+		raw_spin_unlock_irqrestore(&per_cpu(cm_core_lock, curr_core),
+					   per_cpu(cm_core_lock_flags, curr_core));
 	} else {
-		spin_unlock_irqrestore(this_cpu_ptr(&cm_core_lock),
-				       *this_cpu_ptr(&cm_core_lock_flags));
+		raw_spin_unlock_irqrestore(this_cpu_ptr(&cm_core_lock),
+					   *this_cpu_ptr(&cm_core_lock_flags));
 	}
 
 	preempt_enable();
diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 3e386f7e1545..4b50c58628dc 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -15,7 +15,7 @@
 
 void __iomem *mips_cpc_base;
 
-static DEFINE_PER_CPU_ALIGNED(spinlock_t, cpc_core_lock);
+static DEFINE_PER_CPU_ALIGNED(raw_spinlock_t, cpc_core_lock);
 
 static DEFINE_PER_CPU_ALIGNED(unsigned long, cpc_core_lock_flags);
 
@@ -74,7 +74,7 @@ int mips_cpc_probe(void)
 	unsigned int cpu;
 
 	for_each_possible_cpu(cpu)
-		spin_lock_init(&per_cpu(cpc_core_lock, cpu));
+		raw_spin_lock_init(&per_cpu(cpc_core_lock, cpu));
 
 	addr = mips_cpc_phys_base();
 	if (!addr)
@@ -97,8 +97,8 @@ void mips_cpc_lock_other(unsigned int core)
 
 	preempt_disable();
 	curr_core = cpu_core(&current_cpu_data);
-	spin_lock_irqsave(&per_cpu(cpc_core_lock, curr_core),
-			  per_cpu(cpc_core_lock_flags, curr_core));
+	raw_spin_lock_irqsave(&per_cpu(cpc_core_lock, curr_core),
+			      per_cpu(cpc_core_lock_flags, curr_core));
 	write_cpc_cl_other(FIELD_PREP(CPC_Cx_OTHER_CORENUM, core));
 
 	/*
@@ -117,7 +117,7 @@ void mips_cpc_unlock_other(void)
 		return;
 
 	curr_core = cpu_core(&current_cpu_data);
-	spin_unlock_irqrestore(&per_cpu(cpc_core_lock, curr_core),
-			       per_cpu(cpc_core_lock_flags, curr_core));
+	raw_spin_unlock_irqrestore(&per_cpu(cpc_core_lock, curr_core),
+				   per_cpu(cpc_core_lock_flags, curr_core));
 	preempt_enable();
 }

-- 
2.43.0


