Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965C7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WobcNVjk;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DXqaD13V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ls0ihH44PL2mVhwZqJdmouRg8mWtj30ZBhLZKvd0FsM=; b=WobcNVjk0Kg9AONkoJk0Gt8yzP
	EsoGcVjABOVnxEjjBbcXy1/nI7V6BXIqOGExCwMuw1hOhRR+hPylQqmnF/xmwS37kZFTY0S1xUsPb
	0cyzNwPdfVC/c8kPEzUiZ2HgBIQ41s3zRfOgMir4w6QfwOfJOjrU+T8Xf4nwxwMUbk6PbOOx4q1pt
	slCKVVZhjZJDJIreZkhZCxf9sAMRw7klagIMgqTXlWoji4RfOQlIePdfKDnar9suG1GBqUQU2l66e
	fiA3vBdrX5nAM6JscPdtanEZZ5OWS8Yg+viYfHJIdoIR3xp858dBEnfqGaEp9iS5v6pzl9JY5HDmV
	dYgMst9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWex-000000049g3-0clb;
	Mon, 23 Nov 2026 16:12:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWet-000000049fO-3qIt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:12:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21D99143D;
	Mon, 23 Nov 2026 08:12:42 -0800 (PST)
Received: from cesw-lenovo-m90-1s-i9-03.blr.arm.com (cesw-lenovo-m90-1s-i9-03.blr.arm.com [10.164.19.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF4983F632;
	Mon, 23 Nov 2026 08:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795450365; bh=ukFGV1tlM/I4qZGGJcmm4FjJHsd3fH+2IjsdGegi+/s=;
	h=From:To:Cc:Subject:Date:From;
	b=DXqaD13Vq3UbkO2oB/WGqzcy3rIGNRcVRtOkXxS59ccSMuKoHdA2Bd2RTIFk7EB3+
	 T8ZQ7o4DtHRpYvLHrlOj94UlSEY/eRjQwuzmSrzIg7ggvanaxPsCs7mMbf5qbnw99x
	 TscZY14yr5abpWKyq7Vjc1R5h/5+46PtQ13VyJ28=
From: Omkar Anand Kulkarni <omkar.kulkarni@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: james.morse@arm.com,
	Omkar Anand Kulkarni <omkar.kulkarni@arm.com>
Subject: [PATCH] mailbox: pcc: Use threaded IRQ for shared platform IRQs
Date: Mon, 23 Nov 2026 21:42:31 +0530
Message-ID: <20261123161231.3912629-1-omkar.kulkarni@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_081247_994387_877888F2 
X-CRM114-Status: GOOD (  10.97  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PCC platform interrupts can be shared with other ACPI interrupt
consumers. One observed case is a PCC platform interrupt sharing the
same hardware IRQ line with ACPI GED.

ACPI GED requests shared interrupts with request_threaded_irq() and
IRQF_ONESHOT. If PCC requests the same shared IRQ without IRQF_ONESHOT,
genirq rejects the second registration because the shared IRQ users do
not agree on oneshot semantics.

Commit 673327028cd6 ("mailbox: pcc: Remove spurious IRQF_ONESHOT usage")
removed IRQF_ONESHOT from the PCC request because PCC was using
devm_request_irq(), and IRQF_ONESHOT is only valid with a threaded
handler.

Fix the shared platform IRQ case by requesting it with
devm_request_threaded_irq() and IRQF_SHARED | IRQF_ONESHOT. Keep
non-shared platform IRQs on devm_request_irq().

Signed-off-by: Omkar Anand Kulkarni <omkar.kulkarni@arm.com>
---
 drivers/mailbox/pcc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index cd51d8e9c665..e8e5d93b39d8 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -526,10 +526,16 @@ static int pcc_startup(struct mbox_chan *chan)
 	pcc_chan_acknowledge(pchan);
 
 	if (pchan->plat_irq > 0) {
-		irqflags = pcc_chan_plat_irq_can_be_shared(pchan) ?
-						IRQF_SHARED : 0;
-		rc = devm_request_irq(chan->mbox->dev, pchan->plat_irq, pcc_mbox_irq,
-				      irqflags, MBOX_IRQ_NAME, chan);
+		if (pcc_chan_plat_irq_can_be_shared(pchan)) {
+			irqflags = IRQF_SHARED | IRQF_ONESHOT;
+			rc = devm_request_threaded_irq(chan->mbox->dev,
+						       pchan->plat_irq, NULL,
+						       pcc_mbox_irq, irqflags,
+						       MBOX_IRQ_NAME, chan);
+		} else {
+			rc = devm_request_irq(chan->mbox->dev, pchan->plat_irq,
+					      pcc_mbox_irq, 0, MBOX_IRQ_NAME, chan);
+		}
 		if (unlikely(rc)) {
 			dev_err(chan->mbox->dev, "failed to register PCC interrupt %d\n",
 				pchan->plat_irq);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.43.0


