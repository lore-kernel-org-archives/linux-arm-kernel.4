Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D188606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DT4to4yO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O6Br+14B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QXoVU+zyzO/JVGmjx8QpobF+MHN6a8i8PV7wuxZRA8Y=; b=DT4to4yOrnhKVLJf1UHAem/T0e
	lOMkogWLRF58RAAXY4gmpTEO3S2hGteJxVFe0YSD1+YD2X882LGDgiUgXU8fEnWPZVnTn88CJpTXq
	RmxSsbAf6uzdbiXh9RZZHKT52HBZZVQGn/zh3d1ecPVn5+omuf4Q3QqCUEhjLtKOlLC0fQYnkjDlk
	PBJfs7NKUX86RMPltveXf3djHbpQmvAxajnKP4zoKQidGLFx+DvltZXb+k+8P65lnOqXasZntJ2gQ
	Amk4bf2hPgV/GmboUJzvr7Fy3+T+1nCdeTXTCv475FVuE7J3M0npw9tHuRLbXKhwbsKR7Afn+nPBq
	Y5dA9k7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXeO-00000004KIX-19Iv;
	Mon, 23 Nov 2026 17:16:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXeF-00000004KFB-3Cdt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:16:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D5AB19F0;
	Mon, 23 Nov 2026 09:16:08 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 824AE3F763;
	Mon, 23 Nov 2026 09:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795454171; bh=+tCwHyaMbDnFYKCMMHM4gMAYD6cSQpaChWqSWXyJq+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6Br+14BuoEfTrQNtHyzIzXyi+iiUWwSrLBgp4Y7EJQ6wtdQtszN3OgcTbiXIC70A
	 /AS+awE8Xr1edg3/kuvabZSQwTRddLx3HB2uCelcDQZgF8oRs/b94al+1eLIULyxZ+
	 iWT1X9CzshlF4qDjA49BHXU6aqavoHA6+x2LG4v8=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] arm64: entry: sdei: save and restore PMR for pseudo-NMI
Date: Mon, 23 Nov 2026 17:15:56 +0000
Message-ID: <20261123171557.140944-3-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123171557.140944-1-ada.coupriediaz@arm.com>
References: <20261123171557.140944-1-ada.coupriediaz@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_091612_556081_3718F65B 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kiryl Shutsemau <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, Breno Leitao <leitao@debian.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
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


