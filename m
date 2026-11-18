Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1EF60A261B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sO4hsRov;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e07SLl5k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QXoVU+zyzO/JVGmjx8QpobF+MHN6a8i8PV7wuxZRA8Y=; b=sO4hsRovVpLfusA/bYbzgJsZJh
	gAYZK85xI6iwbDNgOBb4VnCmem6Apv+aq94vXfQIdvgJ4xaCiTlryaK2I71ZYZ8l9M5qo+Lslb204
	4+vEC2IZ6QyLMMjUrK9Kk3SJMz4jnXmhQxvqPWddntWJWL8e8ZmDmkUpr2Z48XkWD10k7j7V6uUjy
	qo5y8tWjyMKiN/jNF0crNtZK9fLd9LI2QYLUERKL8eaOMV6adN0QLHBM9vLPYKtfyakzu9d8gfQ+s
	bUQJWqu3WHslpEWFTwJH0wDXjjL+wHEn7iNL2w3TnGaMO2kOyYj7afioak/E1E8tTpmgW6n/ous4x
	UN6udA6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTho7-00000009LkQ-0j51;
	Wed, 18 Nov 2026 15:42:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTho2-00000009LjQ-44Kn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:42:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B80F339;
	Wed, 18 Nov 2026 07:42:38 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 075293F632;
	Wed, 18 Nov 2026 07:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795016561; bh=+tCwHyaMbDnFYKCMMHM4gMAYD6cSQpaChWqSWXyJq+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e07SLl5kVNB3CtW+vgqxR4VZKtstwTke+UCp6+TtNjlxNQkBYg+EI9GI4OrmAv3KB
	 1WvzVduXvNDEE109iCWEA7mv54+Sv+EiyVsHyOykiiiGGD93DeQJxISnHpev2r4lBp
	 n41QOEYCPym7yG5tw49nGVCtHm5acpXX5XbmArYw=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 2/3] arm64: entry: sdei: save and restore PMR for pseudo-NMI
Date: Wed, 18 Nov 2026 15:42:33 +0000
Message-ID: <20261118154233.83599-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117174814.95936-3-ada.coupriediaz@arm.com>
References: <20261117174814.95936-3-ada.coupriediaz@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_074243_113320_B1384D0F 
X-CRM114-Status: GOOD (  16.44  )
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

When using pseudo-NMIs, the PMR affects if IRQs are disabled
and is not updated by the CPU on exception entry/exit. It must be saved
and restored to/from pt_regs, as the DAIF bits are, so that
`regs_irqs_disabled()` can reliably work with pseudo-NMIs.

We do so in the regular entry path, and set it to a known value
reflecting that DAIF is masking all interrupts.
Do the same for SDEI, as it can interrupt the kernel at any point
and does not mandate firmware to touch PMR, but does mandate masking DAIF.

This makes `regs_irqs_disabled()` reliable in the SDEI handler with
pseudo-NMIs enabled, which is critical as the return path to the kernel
depends on if the interrupted task had IRQs disabled or not.
This also avoids returning to the interrupted task with a different PMR
and a possible DAIF/PMR mismatch, as expected by the rest of the kernel.

Fixes: 133d05186325 ("arm64: Make PMR part of task context")
Cc: stable@vger.kernel.org
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/entry-common.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index cb122163a68d..91afd1a36ec6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -1067,6 +1067,16 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 	else if (cpu_has_pan())
 		set_pstate_pan(0);
 
+	/*
+	 * Regular kernel entry saves and resets the PMR to align with DAIF,
+	 * but __sdei_asm_handler() does not ; do it now.
+	 */
+	if (system_uses_irq_prio_masking()) {
+		regs->pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
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
+		write_sysreg_s(regs->pmr, SYS_ICC_PMR_EL1);
+
 	return ret;
 }
 #endif /* CONFIG_ARM_SDE_INTERFACE */
-- 
2.43.0


