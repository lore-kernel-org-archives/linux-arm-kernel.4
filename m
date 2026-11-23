Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2YpBtD2u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O0QnIOfk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ya6v0UyKzX4mmCXRtci1TvYwloWMFBhWYhOd/yqiouQ=; b=2YpBtD2u/S8Ewo1G70fhbVgGbx
	ON643IDjDYaMvO+UCaUCFOwmQFj+GJYrLO1Wh3b+Wav1HHJui0Fp1O/dKgsBfFvncuqlDzKWGmPlU
	DOLuI2oI6NK7Ombw7dolg5yMmVi/qxcmWDvyfeI23MXRFzjAKjgaS7ON4eR2homx0Rgig3pTugQrg
	L3LycMVxnztPMzhGeGExNwdMMlPFPgcTo5dJtku1ugj2bfyJQLCx1evruLGlhF5BmU98p5p+u3+23
	3TnQp0z4MCzDkoyqoVOIVbVsGcvrC+3+YBumRnr2qRbBlyGbVLTXhU4FWuQr3s2FGCN4j3aLlDlGM
	d3z2PiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXeO-00000004KIM-0m4E;
	Mon, 23 Nov 2026 17:16:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXeD-00000004KDL-0dey
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:16:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53586176B;
	Mon, 23 Nov 2026 09:16:05 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 870AC3F763;
	Mon, 23 Nov 2026 09:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795454168; bh=LFtDzB/okrnQHH291WRp6toxRg+swNwN8gcOpZd7uFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0QnIOfkL73MNoc91NYxTAD9VVYpv8ma/GCrN8yHd55fA8kVyYwGHRJBz2Q66uArH
	 ISKQvISI9h+0x2jCkTCVGx2Tt7lbgJT22BHox58wgqTQ2m7D1nUkyyd8AKgr7TpeRk
	 7SJGdZVWmDqQhZfU+6XvkfWcGn5hY1txFhlDZk7Q=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] arm64: entry: sdei: always set VBAR_EL1 on SDEI entry
Date: Mon, 23 Nov 2026 17:15:55 +0000
Message-ID: <20261123171557.140944-2-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123171557.140944-1-ada.coupriediaz@arm.com>
References: <20261123171557.140944-1-ada.coupriediaz@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_091609_269818_5974DF48 
X-CRM114-Status: GOOD (  18.99  )
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

SDEI can interrupt at any time, so we cannot guarantee that VBAR_EL1
points to the kernel vectors.
Unconditionally set VBAR_EL1 to the kernel vectors on SDEI entry so
the SDEI handler always runs on the correct vectors.

Commit 9bf6ee7952c7 ("arm64: sdei: Run the event handler on the kernel
vectors") sets VBAR_EL1 to the kernel vectors when KPTI is on
and it still points to the trampoline vectors.

This is only covers the KPTI case, as any other VBAR_EL1 value would
not be changed, while pointing to the wrong exception vectors.
KVM in VHE mode would be such a case as, in VHE, VBAR_EL1 is an alias for
VBAR_EL2, which KVM uses for the hypervisor vectors when running guests.

Fixes: 79e9aa59dc29 ("arm64: sdei: Add trampoline code for remapping the kernel")
Cc: stable@vger.kernel.org
Cc: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: Breno Leitao <leitao@debian.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/entry-common.c | 25 ++++++++++++++-----------
 arch/arm64/kernel/sdei.c         |  3 ---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index beb56891fc4f..cb122163a68d 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -1079,19 +1079,22 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 	far = read_sysreg(far_el1);
 
 	/*
-	 * With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
-	 * EL0 until the next exception from EL0 maps the kernel. They only
-	 * handle exceptions from EL0: an exception taken here would run their
-	 * empty current-EL half and never come back. Switch to the kernel
-	 * vectors. The IRQ-like resume keeps using the interrupted VBAR, so it
-	 * still goes through the trampoline.
+	 * As an SDEI event can take over at any point, VBAR_EL1 might not allow
+	 * us to take an exception safely :
+	 * - With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
+	 *   EL0 until the next exception from EL0 maps the kernel. They only
+	 *   handle exceptions from EL0: an exception taken here would run their
+	 *   empty current-EL half and never come back ;
+	 * - With VHE, the kernel runs at EL2 and VBAR_EL1 accesses VBAR_EL2.
+	 *   KVM might be running a guest and switched VBAR_EL2 to the
+	 *   hypervisor vectors.
+	 *
+	 * Switch to the kernel vectors unconditionally and restore
+	 * the interrupted VBAR_EL1 before returning.
 	 */
 	vbar = read_sysreg(vbar_el1);
-	if (arm64_kernel_unmapped_at_el0() &&
-	    vbar == (unsigned long)raw_cpu_read(this_cpu_vector)) {
-		write_sysreg((unsigned long)vectors, vbar_el1);
-		isb();
-	}
+	write_sysreg((unsigned long)vectors, vbar_el1);
+	isb();
 
 	state = irqentry_nmi_enter(regs);
 	ret = do_sdei_event(regs, arg, vbar);
diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 1b902da8ba43..1027138ba5b4 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -255,9 +255,6 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * exception registers; __sdei_handler() puts them back. Only the last
 	 * one's syndrome survives; report it if it is not one known to be
 	 * harmless.
-	 *
-	 * If the event interrupted a KVM world switch, VBAR points at the KVM
-	 * hyp vectors and any such exception is a hyp panic instead.
 	 */
 	nested_elr = read_sysreg(elr_el1);
 	nested_esr = read_sysreg(esr_el1);
-- 
2.43.0


