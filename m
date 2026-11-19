Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95444606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LFoTei3t;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=fW17kvRt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CedYSSN4VmRSUUDOCoWWB86uIFN22b2CcBsb82DlUJU=; b=LFoTei3txjeRwz
	fwhzPstkkGGR/waGmbFRLFZ++TkfrOXsNPHhyA+Hh7ahL7gydS0kvfHtGTRjzoSYNrrqmTaMisR09
	mqeLUfwt4cz82OXKTDGGUM1s6MAV7DRGjTP+3todFsEBEv3ibIXa5vJQSLlkKjxwsMwG3IMDSaQf2
	yDRs46XedPGQPv8pr2haIa2IehKVSxnw1FqRpZCwBtZPd0H6v1+JuDTLyIQ+ntNqORLr7vkcuFIQq
	FXAGNUburqEt7CThQji+mTtgrvzJX7SHDl2ldOU7FEO0QA/dFaP6bRGsWmKTJTsgzk/kPy1Auv1Kt
	LhAuGgjMZfhZKQrytTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Ib-0000000CtNj-2A6H;
	Thu, 19 Nov 2026 17:51:53 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6IJ-0000000CtGJ-2OWi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795110695; x=1826646695;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=L7G8bdD9wp+VJx4bnBPXDO6O3hytAVV8cw1v6jTr0PA=;
  b=fW17kvRtInNa5wVayYls2Amqm9iKwycuYFN2goYPUrPfvecKVWd8DyzI
   Sza/nHEoxFnR6iGf4FvXqP52Bcfo1SPLNsncjdqf4TOsdhAj19jU2QExF
   3uzPf7TFVB4BlOyRKIARIcu9aGNi4DPnzg1qDNrwewxWJV7fNKm/5Pun1
   /EfcIV0KpepaSU68bNLEwnRLKIquiQ8IkU9c1pWmRV5/KsAqWvnu8f4H1
   dgR4AgqVrgRS/mtwZs9ayecybIVkfvgSTLSaQQtEvbRhvHmhGqGEZOmlr
   kbJ1vY5YVb5GNYgqNZRUE8TKU2T5tBEq1RH6DHxTyHBUAdcukkpQ3DqrC
   g==;
X-CSE-ConnectionGUID: GEEV0erwS1mGIMUlJTUlqQ==
X-CSE-MsgGUID: HaLiLNdVTq6/6EJ1b369pA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 19:51:32 +0200
X-CSE-ConnectionGUID: zePeCnaBSnuCurSiN3xmsw==
X-CSE-MsgGUID: TgesIyceQZm3mT7ScHrYig==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 19 Nov 2026 19:59:47 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 19 Nov 2026 19:51:31 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 19 Nov 2026 19:51:27 +0200
Subject: [PATCH v3 1/7] mips: {cm,cpc}: Make cm_core_lock, cpc_core_lock
 raw spinlocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-i6500-cm3-pmu-v3-1-c86410934b51@mobileye.com>
References: <20261119-i6500-cm3-pmu-v3-0-c86410934b51@mobileye.com>
In-Reply-To: <20261119-i6500-cm3-pmu-v3-0-c86410934b51@mobileye.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
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
 linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Paul Burton <paulburton@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095135_888095_30A289DE 
X-CRM114-Status: GOOD (  16.72  )
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


