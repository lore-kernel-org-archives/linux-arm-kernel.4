Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99603606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vh+Tcw9R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bWO1UAtI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=l1fXfZo7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6uDpr5jw4pIdprDzUV7vqQyqb7LLsyzhquA04m6gdcM=; b=Vh+Tcw9Ra7CHqspZF06UENG7B/
	OcX/6MACSZEwZz2lqLdKtARRIe5G+EgcCQ7mUZ+I1toFsIdw+Ybsc2So6GrMHyH78cCBw7R4zRDwu
	ab3wIYtnPbVOois5h1LbBlNvFuPutqTfvSJ5sPJBDZ0NTpQDIUifaxmJTp4I3ogcpiAZ63VEJ5cnp
	YEzyaJb6fMWAegftDIkLZv03XQdRJtEZ+SWDRirn6picWj0P67KnRwiLUux4P9nJ9u+/d8gFGNmCE
	ZgWDpVWGr5MNYphbA9O50Zb/9vq5odb1tQ18brPC4FP8IazXewNGFx1zgmbtsPCb3pq+023doSgo+
	xRVKa/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUls-0000000A1tL-2vAI;
	Thu, 12 Nov 2026 13:23:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUl8-0000000A1BA-1d7g
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 13:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6uDpr5jw4pIdprDzUV7vqQyqb7LLsyzhquA04m6gdcM=; b=bWO1UAtIKAlItB3WSXjYObUqZJ
	cs6ONig+90lFt9phLo1tAzwJ0eQmb7fl3yDDRy9o1JlVMXBXziWiZL2gnIxkU+ke+n2EYP9jsklWE
	0wRnF9B1aq3apLzGia+3uJo5GVWQ1hF+ZJzMbved6PmNxr3MJIa9QaxoyEuGbw2J/g/vIiInkeNm7
	C6520byPQvqFMHBxBnOIpv2dbRX/mnMg61DxLntWEwFV7y2mNS0PRHXIdDQroeLJWwYq668fergAJ
	KrYz2//gabXzg8jmDuuV0r5N8ZMSw1vNycUB9p+/7/KC9HWB+3Wyur/qBiVmqowI1HE81hN6et3/F
	C/zKS8fg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUl5-0000000AMn0-0jMs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18624175A;
	Thu, 12 Nov 2026 05:22:26 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 972323F632;
	Thu, 12 Nov 2026 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489749; bh=ibDVB1ILNN2wZVH+0ykFNydp7o+ebfUSL//VCoJKzcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l1fXfZo7nokG8olvcMr7LkScnPZRjTMOuUl/3bQNowOlz/Jsm7lXPUstWM8uUkxhv
	 RPp788o81QFyTY00Fumu1dDho5hbA/1EbTdvBKvg64sAyr8P013eKc0ChN3Z/XPNZ8
	 aW/zMerYy3HT8ukqDkiFZqG2RjKeJc+QvkYb19Zk=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 25/39] arm64: irq: Report FEAT_NMI masking local IRQs
Date: Thu, 12 Nov 2026 13:20:28 +0000
Message-Id: <20261112132042.129062-26-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_132231_531252_41D116EB 
X-CRM114-Status: GOOD (  17.06  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

As we clear SCTLR_EL1.SPINTMASK when enabling FEAT_NMI, ALLINT masks
IRQs and FIQs regardless of superpriority.
Update irqflags.h and `regs_irqs_disabled()` to take it into account,
so we properly keep track of the local IRQ masking state.

We have documentation at the top of irqflags.h which explains the DAIF
masking. Since the additional masking with NMIs is related and also
covers the IF in DAIF, extend the comment to note what's going on
with NMIs.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 17 +++++++++++++++++
 arch/arm64/include/asm/ptrace.h   |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 31b8f4e99532..d64d89a8f31a 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -20,6 +20,16 @@
  * always masked and unmasked together, and have no side effects for other
  * flags. Keeping to this order makes it easier for entry.S to know which
  * exceptions should be unmasked.
+ *
+ * With the addition of the FEAT_NMI extension we gain an additional
+ * class of superpriority IRQ/FIQ which is separately masked with a
+ * choice of modes controlled by SCTLR_ELn.{SPINTMASK,NMI}.
+ * Linux sets SPINTMASK to 0 and NMI to 1 which results in ALLINT.ALLINT
+ * masking both superpriority interrupts and IRQ/FIQ regardless of the
+ * I and F settings. Since these superpriority interrupts are being
+ * used as NMIs we do not include them in the interrupt masking here,
+ * anything that requires that NMIs be masked needs to explicitly do so,
+ * but we do check for ALLINT masking IRQs/FIQs.
  */
 
  /*
@@ -105,6 +115,9 @@ static __always_inline unsigned long arch_local_save_flags(void)
 {
 	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
 
+	if (system_uses_nmi())
+		hwstate.allint = read_sysreg_s(SYS_ALLINT);
+
 	if (system_uses_irq_prio_masking())
 		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 
@@ -118,6 +131,10 @@ static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 	if (hwstate.daif & PSR_I_BIT)
 		return true;
 
+	/* SCTLR_EL1.SPINTMASK is clear, so ALLINT masks *all* IRQs/FIQs. */
+	if (system_uses_nmi())
+		return !!(hwstate.allint & ALLINT_ALLINT);
+
 	if (system_uses_irq_prio_masking()) {
 		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
 			     hwstate.pmr != GIC_PRIO_IRQOFF &&
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index a64eb588a781..2c42296b7675 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -231,6 +231,9 @@ static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
 	if (regs->pstate & PSR_I_BIT)
 		return true;
 
+	if (system_uses_nmi())
+		return !!(regs->pstate & PSR_ALLINT_BIT);
+
 	if (system_uses_irq_prio_masking()) {
 		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
 			     regs->pmr != GIC_PRIO_IRQOFF &&
-- 
2.34.1


