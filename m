Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB36606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EC9W6A+o;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J5GTQhV2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+0lOfaArNHSPPmLKVZDVKJqfeIkhQfvkVNfuB1PE5lU=; b=EC9W6A+o5I2gr0+YfL9hr6h8AT
	MhnMJSiFCpg20H3NKj8151FEy7/XuuGKDZiajwTtCINCXeDdH6sK4wm9EiDq26h4uL24L3Cgtyey3
	XgtI6qfDE4rpBta8lB9YG1hdcvvgvEt3ArzBrZO98o705I+fAH6d/AabaN8vTZLTQb0FVh3c5J7M+
	NAQwZQ+lqmiDdzEmD7iO9PG6NnS9537aRnzNNx6zAA9A6+BjynVcNZfQ+KBK73EH2uDKrwoFEXyXz
	8NnfoTsl9hBEIoJkLyeULYdu6zi0mgXt/2naHuDEkkBrPcRvb2bdpxbZgCQ4VJ3MDAICVmk7grBil
	HG63puTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNIJ-00000006gU5-3bIo;
	Tue, 17 Nov 2026 17:48:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNIE-00000006gRh-2ORY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:48:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C2F21BD0;
	Tue, 17 Nov 2026 09:48:27 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 030353F632;
	Tue, 17 Nov 2026 09:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794937710; bh=0PN648yUFxoQTW5++i2JEnjRxqyZhkJP38t4f/fNAQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5GTQhV29EDU20Bia7+BY9Zrk7SwV8JzSSxTxEluB6feRtJ38dn1UrYWgZfz9OKiU
	 IZhwhJDHvfFtDmDaJTQuqsNPYihJb1EMPKit+iu0PJB7Q46KFaUfPQyPvmWTzBwvtq
	 Mw7gYSYLfH3psuBvWTuaKgxzLhpJ0Gi9S5n9Me2M=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 2/3] arm64: entry: sdei: save and restore PMR for pseudo-NMI
Date: Tue, 17 Nov 2026 17:48:13 +0000
Message-ID: <20261117174814.95936-3-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117174814.95936-1-ada.coupriediaz@arm.com>
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094830_989565_F4070FBA 
X-CRM114-Status: GOOD (  15.85  )
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
Cc: Kiryl Shutsemau <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Breno Leitao <leitao@debian.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If using pseudo-NMI, PMR must be saved and restored on exception
entry/exit. We do so, and set it to a known value reflecting that DAIF
is masking all interrupts, in the regular entry path.

Do the same for SDEI, as it can interrupt the kernel at any point
and does not mandate firmware to touch PMR, but does mandate masking DAIF.
This avoids potentially returning with a different PMR than interrupted,
and SDEI having the DAIF/PMR pair in a unexpected state compared to
the rest of the kernel.

Fixes: 133d05186325 ("arm64: Make PMR part of task context")
Cc: stable@vger.kernel.org
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/entry-common.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index cb122163a68d..17a14c55532c 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -1041,7 +1041,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 asmlinkage noinstr unsigned long
 __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 {
-	unsigned long elr, spsr, esr, far, vbar;
+	unsigned long pmr, elr, spsr, esr, far, vbar;
 	irqentry_state_t state;
 	unsigned long ret;
 
@@ -1067,6 +1067,16 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 	else if (cpu_has_pan())
 		set_pstate_pan(0);
 
+	/*
+	 * Regular kernel entry saves and resets the PMR to align with DAIF,
+	 * but __sdei_asm_handler() does not ; do it now.
+	 */
+	if (system_uses_irq_prio_masking()) {
+		pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+		write_sysreg_s(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET,
+				SYS_ICC_PMR_EL1);
+	}
+
 	/*
 	 * Nothing saved the interrupted context's exception registers on the
 	 * way in, and it may be in the middle of exception entry or return
@@ -1110,6 +1120,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 	write_sysreg(far, far_el1);
 	write_sysreg(vbar, vbar_el1);
 
+	if (system_uses_irq_prio_masking())
+		write_sysreg_s(pmr, SYS_ICC_PMR_EL1);
+
 	return ret;
 }
 #endif /* CONFIG_ARM_SDE_INTERFACE */
-- 
2.43.0


