Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F1606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AlZkC+0a;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXoJK0O/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Zh+XulnPd/nR+IMT1WxzCnxZlOn4xssX41WPzE9FKU=; b=AlZkC+0aAKKYj2ecTqdcvm/KlW
	RkzuT+Z3Ez6AmdSvFqkzOm/pWnogL5zpgH23rdUC2cTCoo+zlQokDbRB5fM85nK4a+/bqsMH3qFBw
	IfBRR1coCkhAFlLkAQy8GWyPdHADpS4UAZmeW7NVQSGxdJg/D+Kgs15775+Ae3L36Fq7hxDsBPD0j
	TnaqBpHobeoZnJgf1DWa6KhxysN/vEaKnkG/8GAThRj1mZpsyPM4R+Af7XE5kyAxAHb9HGlHlP/ND
	N0UJ4tPwKGpGSWr3+LZnDP9TXOSR7qbSouXXPGkvQXSjb/86iS1UjzKjNW7QOuticHnZk4w+INVra
	n0gTQhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS20F-0000000ExPk-3F9S;
	Sat, 14 Nov 2026 00:52:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS20F-0000000ExPQ-1HUE;
	Sat, 14 Nov 2026 00:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15FC246172;
	Sat, 14 Nov 2026 00:52:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794617543;
	b=ywO6FHeUp1rTgAhqu8h5Fy8RmWveqQfmzsiEucVBZPNlj8bPOr6FNB0bxGlx0Gg/ni7+
	 aTIz4CnvX374CV44i6kx3XbT9+RF9pKvcUPQM+0nVVi0BTrUtgFxp36UK+i/r+S3CZv5+
	 xwf+gQuz52BwOBjiPCPHb4+13ZehrIsb6zLaOK74lg8sHlJEYTv6hwv4Jmd/R+7JcskPc
	 WOFM9sxhAXumKDr3DZRwXMs+oNDWjO50dgSk9PuwKz7ky9z3KIZr/PVO4bgzHFtSDWxva
	 MiDahOZ6X0MkJy5+NnNLNj6glXsltt3Gm35MAPooOh9IPP1QxJg1xeQ2R/4JGaopGpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794617543;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6Zh+XulnPd/nR+IMT1WxzCnxZlOn4xssX41WPzE9FKU=;
	b=ZfLpBVBasb+AcmuRegOSyDwurgd6GvJWQcs84MZN8sn2lnp/qJ576ImQeFY6kzgWS0ST
	 tPGruzlMswQib4zd/zwVvY0hBS4QcS5aUDIGRkXU5Xn80aY+ZrScfIdRUWRdepYGEi85I
	 Sf60QQuOIK9NrIJcdZ66ZLMjZujWtoj270r8DGqdyOydmUXde49mSfCdlaQBEQpS+wNSL
	 BMAvOD0rT+P0kDOaiSMBS0TK4J8sBTSTBY3JjSGi8HnSrjEtR+tv61TILTncZATv/SKpf
	 DvOnqrU2Sbltx0nMYY0O8cPoMhmJ0juymu9qnluSoetItLdFlMjnsOOVj4gbys9Apbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C38E91F000C5;
	Sat, 14 Nov 2026 00:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617542;
	bh=6Zh+XulnPd/nR+IMT1WxzCnxZlOn4xssX41WPzE9FKU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TXoJK0O/XtZ3uD8YfECaDYkHpvDXBw4EqGXAjJDVFCNAyTeHo2yzNYDD4iuhQ7Doc
	 bFKuxR9hkQdz44wp5N34SiwfTJctsexOqSnItN4zjtrc67WC2nmMrsoonvIMPbkMTe
	 lx3eSsNpRI0BHqQHuAzWO5nS/NKJSjDL10QCjejFRMpwmfupXAYPk59AgNC/phPyQR
	 sLyyPVDCBvyGoLIMX2EWdg/rWeP1hOcRBLcGgvmELINGmJ0JX3EicXvh7QeXTYhSna
	 R5iii///9TF0tMN7hlRVKKY8JieqmXwkuq+/q/WQ0pOa3n/CmKKlTjW1bafwNG9noK
	 IMt9Nja7ZFk9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0160849BF8;
	Sat, 14 Nov 2026 00:52:21 +0000 (UTC)
From: Matt Thompson via B4 Relay <devnull+matt.boondocker.io@kernel.org>
Date: Fri, 13 Nov 2026 17:52:20 -0700
Subject: [PATCH RFC v2 2/3] arm64: Allow synchronous abort fixups for
 guarded MMIO reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-rfc-b4-v2-2-d6b14f95c1d6@boondocker.io>
References: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
In-Reply-To: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794617540; l=3957;
 i=matt@boondocker.io; s=rk3399-rfc-20261113; h=from:subject:message-id;
 bh=O2LbMV/iAQG9voycLpkvTk5xx5a7660O6hR4aIZ4gWk=;
 b=AOyjADqb2c9zoTvOxoesEqPq2yFWtk+fGp4f0dFjGUBjgacjGBHN2o1QsuuE7wEmK2y/dvjeQ
 0Bj55wz2NCVAGOBG3u4H5pEBc9Gt7IU9E3dA1lwhdo+WnxAxk+nSbxI
X-Developer-Key: i=matt@boondocker.io; a=ed25519;
 pk=WMnh3kwFFRkrqamL/FbDcdl1/9rBF2uT03VdvGGP40k=
X-Endpoint-Received: by B4 Relay for matt@boondocker.io/rk3399-rfc-20261113
 with auth_id=1517
X-Original-From: Matt Thompson <matt@boondocker.io>
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
Reply-To: matt@boondocker.io
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Matt Thompson <matt@boondocker.io>

An RK3399 PCI configuration read can raise a synchronous external data
abort if it does not get a usable response. Allow an explicitly annotated
MMIO load to return an error in this case.

Match only a current-EL synchronous external abort on a read instruction
with the new exception table type. Keep existing handling for other
faults, including asynchronous SError and translation table walk aborts.

Signed-off-by: Matt Thompson <matt@boondocker.io>
---
 arch/arm64/include/asm/asm-extable.h | 15 +++++++++++++++
 arch/arm64/mm/extable.c              | 20 ++++++++++++++++++++
 arch/arm64/mm/fault.c                |  4 ++++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index d67e2fd..ac78167 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -11,6 +11,7 @@
 #define EX_TYPE_KACCESS_ERR_ZERO	3
 #define EX_TYPE_UACCESS_CPY		4
 #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	5
+#define EX_TYPE_MMIO_READ_ERR_ZERO	6
 
 /* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
 #define EX_DATA_REG_ERR_SHIFT	0
@@ -80,6 +81,11 @@
 #else /* __ASSEMBLER__ */
 
 #include <linux/stringify.h>
+#include <linux/types.h>
+
+struct pt_regs;
+
+bool fixup_sea_exception(struct pt_regs *regs, unsigned long esr);
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
 	".pushsection	__ex_table, \"a\"\n"		\
@@ -111,6 +117,15 @@
 			    EX_DATA_REG(ZERO, zero)			\
 			  ")")
 
+#define _ASM_EXTABLE_MMIO_READ_ERR_ZERO(insn, fixup, err, zero)		\
+	__DEFINE_ASM_GPR_NUMS						\
+	__ASM_EXTABLE_RAW(#insn, #fixup,				\
+			  __stringify(EX_TYPE_MMIO_READ_ERR_ZERO),	\
+			  "("						\
+			    EX_DATA_REG(ERR, err) " | "			\
+			    EX_DATA_REG(ZERO, zero)			\
+			  ")")
+
 #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
 	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, wzr)
 
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 299a244..dcb84d8 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -28,6 +28,8 @@ bool insn_may_access_user(unsigned long addr, unsigned long esr)
 		return false;
 
 	switch (ex->type) {
+	case EX_TYPE_MMIO_READ_ERR_ZERO:
+		return false;
 	case EX_TYPE_UACCESS_CPY:
 		return cpy_faulted_on_uaccess(ex, esr);
 	default:
@@ -101,6 +103,8 @@ bool fixup_exception(struct pt_regs *regs, unsigned long esr)
 	case EX_TYPE_UACCESS_ERR_ZERO:
 	case EX_TYPE_KACCESS_ERR_ZERO:
 		return ex_handler_uaccess_err_zero(ex, regs);
+	case EX_TYPE_MMIO_READ_ERR_ZERO:
+		return false;
 	case EX_TYPE_UACCESS_CPY:
 		return ex_handler_uaccess_cpy(ex, regs, esr);
 	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
@@ -109,3 +113,19 @@ bool fixup_exception(struct pt_regs *regs, unsigned long esr)
 
 	BUG();
 }
+
+bool fixup_sea_exception(struct pt_regs *regs, unsigned long esr)
+{
+	const struct exception_table_entry *ex;
+
+	if (ESR_ELx_EC(esr) != ESR_ELx_EC_DABT_CUR ||
+	    (esr & ESR_ELx_FSC) != ESR_ELx_FSC_EXTABT ||
+	    (esr & ESR_ELx_WNR))
+		return false;
+
+	ex = search_exception_tables(instruction_pointer(regs));
+	if (!ex || ex->type != EX_TYPE_MMIO_READ_ERR_ZERO)
+		return false;
+
+	return ex_handler_uaccess_err_zero(ex, regs);
+}
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b227368..ebe8054 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -30,6 +30,7 @@
 #include <linux/hugetlb.h>
 
 #include <asm/acpi.h>
+#include <asm/asm-extable.h>
 #include <asm/bug.h>
 #include <asm/cmpxchg.h>
 #include <asm/cpufeature.h>
@@ -879,6 +880,9 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
 	const struct fault_info *inf;
 	unsigned long siaddr;
 
+	if (fixup_sea_exception(regs, esr))
+		return 0;
+
 	inf = esr_to_fault_info(esr);
 
 	if (user_mode(regs) && apei_claim_sea(regs) == 0) {

-- 
Git-155)



