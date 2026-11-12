Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ea9Pf4C3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ouePeZW1;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Vq76MZUH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w/3eMi6BEBDUj1l+rVzXDGFEq02m+mmHJY+e5v9Hkd0=; b=ea9Pf4C3oCE0Fb
	yr5m8bfHiYLRlYOyu9UzbFarRJMnGc35hr9XjiLH6M3onOFA0uhR2lA+iMOWexekj7brpwIbOa5oI
	ZctCWXgsOxqpgnUsMkpmhxQxVnlCu3yBgMFsVkxZ2PuCFnC5a9RocN3EKGoLhCjtDW+TfH/4huLwe
	IVgOsF2E5GU7aEQfspWCkheET9i/Nm5SwQ5+1CTeEu/bR8oSvJsL5yacUSh6yTAoTNmOk563okkpZ
	oqy89xCQYt6qjaRH3ucPSt8wEw4ja3Yo/rmTqkyU2XBDMSzatOVGii27MMW1W75CsJurqejHPkYmV
	iJ4lQ9s/qXevtEtLIznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmH-0000000A2SN-2m6W;
	Thu, 12 Nov 2026 13:23:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlP-0000000A1Ks-0tFK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 13:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w/3eMi6BEBDUj1l+rVzXDGFEq02m+mmHJY+e5v9Hkd0=; b=ouePeZW1AcqYzuA/a94Zsbxehr
	A+5X41M1MyAPLMf7DFbPbAcx7Th6+5V3EWeIv7Tfpo29ToEGQNLpbD+zSqHGwR4fSlH6J/Axr0s9B
	6f7jYsPQOJ+qt89wHesMHpISsH0pNgfuiSqHtoo2YDXPicybWUHk5RXxiJrB+nxegCsvl+/gm+Uel
	rg28ULo4nhgkLXB6/W8CNFD+04mF+kENQOh9McN7MC3y5k+q56oMOyPvgXyk0c65S5iKt5xYGe9ha
	Je720Oq5Off8zxlbEFH37HCerPVeZhRMY5rI76Nvxh88ETEvC6No2hpaKgetb7MBTmjlv0Yy1nQqx
	/vwlBhlQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlM-0000000AMqL-2RCd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAAC21A9A;
	Thu, 12 Nov 2026 05:22:44 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 740F13F632;
	Thu, 12 Nov 2026 05:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489767; bh=CfuL9Q04nRaMONDtJ0j7IvppOIakN4KRyH5wvVKFfNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vq76MZUHaDr3GEgT1Y6BAil+lnAcZlmod0v/4dl7tOH3pRSqAHRJSh0zClPWIOLYy
	 /YJu7xMHxCLenCnWec+Jssu7hS050yWSAwLhrD5KSBWKNVJrFKWziqju5fAq7BtqeQ
	 pVZrLq7kK4fmBkK7saIt0mOfV1QAw2mtPdLxdw90=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 36/39] arm64: smp: Add NMI support for LPI-backed IPIs
Date: Thu, 12 Nov 2026 13:20:39 +0000
Message-Id: <20261112132042.129062-37-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_132248_643825_B6728D9D 
X-CRM114-Status: GOOD (  13.78  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LPI-backed IPIs are currently always requested and managed as regular
IRQs. Allow IPIs selected by ipi_should_be_nmi() to be requested as
NMIs, falling back to regular IRQs when the NMI request fails.

Track which IPIs were successfully requested as NMIs so that the
per-CPU enable and disable paths use the appropriate NMI helpers.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 58b705426120..c4d1aff31258 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1177,16 +1177,28 @@ static const struct ipi_irq_ops ipi_sgi_ops = {
 
 static void ipi_lpi_enable(int cpu, int ipi)
 {
-	enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));
+
+	if (ipi_is_nmi(cpu, ipi))
+		enable_nmi(irq);
+	else
+		enable_irq(irq);
 }
 
 static void ipi_lpi_disable(int cpu, int ipi)
 {
-	disable_irq_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+	int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));
+
+	if (ipi_is_nmi(cpu, ipi))
+		disable_nmi_nosync(irq);
+	else
+		disable_irq_nosync(irq);
 }
 
 static void ipi_lpi_setup(int ipi, int ncpus)
 {
+	bool is_nmi = ipi_should_be_nmi(ipi);
+
 	for (int cpu = 0; cpu < ncpus; cpu++) {
 		int err, irq;
 
@@ -1195,13 +1207,29 @@ static void ipi_lpi_setup(int ipi, int ncpus)
 		err = irq_force_affinity(irq, cpumask_of(cpu));
 		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
 
-		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
-				  NULL);
-		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
+		/*
+		 * Try to request NMI if it should be
+		 */
+		if (is_nmi && request_nmi(irq, ipi_handler, IRQF_PERCPU | IRQF_NO_AUTOEN, "IPI", NULL)) {
+			/*
+			 * Fallback to regular IRQ
+			 */
+			is_nmi = false;
+		}
+		/*
+		 * Otherwise regular IRQ
+		 */
+		if (!is_nmi) {
+			err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI", NULL);
+			WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
+		}
 
 		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
 
 		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+
+		if (is_nmi)
+			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
 	}
 }
 
-- 
2.34.1


