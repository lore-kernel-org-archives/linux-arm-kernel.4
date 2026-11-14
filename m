Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C887606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZhaKy4Wn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1stEIzY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=; b=ZhaKy4Wnjq2iyv
	KjBSrBWfZ/MtXmhAOJc5yY01oiRlHkshYssxBloKLwPRP16vVgurp4xUC4XwIPGA2kOBq3XduGxxu
	6cTcIjFmu7Dmqbxmz9zCTmKgvc/1Ak4A2DSl5AOi/sv0DSNM+8HwLuo6jTmwaWWSPeGNU+7MqeFoe
	jxw0r6IUsTsAEE5BwmG6p3EIRpciSNJUCkC0XykJio2vhXZb4LGHiOExpHbQwfWqvxu+nLiSBJPiA
	Ci1sWV/2oZSMYadBW1GcTfpo27dHv9B5C+brwWKVn9tkAjtA0gukEsuY1l3kxGB8ksGWgAT/1V+nC
	cXlZTRv34JdbfWPmb9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWS-0000000GgVN-3ii1;
	Sat, 14 Nov 2026 19:34:48 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWM-0000000GgT6-0hg9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 19:34:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2618539a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684881; x=1795289681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=;
        b=u1stEIzYAbr5tqxhVog6iEgC3EhvfZzJQwffMnJRoLt1vk1t7Z9eDOoh4n/VfEtqcI
         mBN6Vtz+QMXZGgLar7+JZJiTMHmNIMeu9ZUF/4vi88vOz52omCeGvM7spD/VMTU8UnPz
         IDownyF00r3K0AAcWbAtKlCJjax7HODPHjfjGsH4uVkWgceu7dL1JDYgvJ6YpY2qPUO9
         0+FTk91i6T3eYlIDBnX/wGlOgvjYnA2vngykZ0REV28q/slUwU3VX9nO2puC/xM2op7v
         HLb/lodPhFqCggM3DJWTk4sWy8BzNuwTrPFtwQPmpxh126qN7x0eVytPWkMKa/kI1Qcc
         DLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684881; x=1795289681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=;
        b=xWnv09PcbXngNLHO6R+d6NN8mjwUlZ4R1ZoU5B2c80WcgB7E0/p5a3nL9FTaBN8WsT
         nN9Ub6NH07yjXtG55Fdyi71xju8Ck+s+KdHU+Jxwk9Yz4aqPS4r6HHHbWRdxf13vAetp
         evkAOwQwD1B0v8K6lQ+cg3sQgsU0Wupfa6WVUWTGPJda0f+TXAT46yAvSIrhljtdHIG1
         hsE3GuXM2UVhbcMiWQvzwnN6yMJsT/Ls2W38+Sq+Jvcag8ZDcGUsJ/7GWMhbLSJ6yXW3
         qRzeB6LQMDTxBZqr+foRann1l1LqFg1QPOmBPNHNZVx3zo3wLHl6q0GUlqPQWpCu2ByK
         pdgw==
X-Forwarded-Encrypted: i=1; AL+hErGaL6NUnxaJ8lNxO7oLmtzCRBrqEYp1oTHP+5X/GYHAzfXZx+tegEj7N0hHOCdfP8vlhAzqh46dPxE8tihqAmTz@lists.infradead.org
X-Gm-Message-State: APuU4Z8xGNI6J/6fCSyOcQs4/s2UYJ+xRFXQvcuzb/gQYzc6J+H9gwnn
	wbYrtiYOL3QxXWlKy/L/Ke1Hq5dPz2ztnw65nXJdDBp+r7orqEpqVV0q
X-Gm-Gg: AYBFou32H+zJ/hpm0pcpmdC8eVFTdUZSib4Udmj5n3LasSV+Ws/pM91L4kXwyYQQPJ4
	bbFmReYvvRm6IahPnH5N1e5gLBof32LN3cqZJSFPSLXmfWgNWQBOHZIKK5NEIeAwMksjDWU0KMG
	U44L4caF8g+mM3OSwQ9CGpThjwueSlOESbN/xtQ98v48PxYajirWZ8n78KMZerFpdmZzHvHMAYl
	saR4i2dnPDwkek93p+Nv3sw0hob0jH1oLxtqaAlHdl625P+75y9HgY3LQOErqyMVpTrVyIFFOLZ
	3f3pwRVIAwhr7mZSkr6iPmbH7ejXyJuEKP2t9m8L6G3oYAyXRs/z+F/A9AIV24Ow6zkoAlR8RkR
	CAGnwb6rI9r2y7IfrNyrfDas3Jp+1vvn3sYDLg2N2RUn1gv5tmD9Mt1lfPdFcNC+2IweT+U8IyG
	VbicfbCT8uoHiSGkPsurOyGcWGt66ld7McVNSYSL9vAOXTM7LdzP6fhwBVmUGt/z9yd50kYniMd
	Lm24dPRiWduaaAtz5EVEzblNuDhOZGiQpy7UMKSFwq5dcVtg7ZzUjREFH6G71RZuZ6mqYx/FNha
	yrgZfv+WfdWPng2uX6w6rf/g/cNbLfEArP+Voyj8PezVzmJvrgzzxM+uY6Y2JBNHYW3ItdmPCZM
	WjyYchfkVTMaVCwl4quYyzFOsjl8mv+Aiz0bav/8BOMDikOLg4qlIFgc3tx6cq88BzbGKVuZKBB
	uMCefijscmiZ90tbQHAV+ZZGjREJYxS8GdGknK7l8e
X-Received: by 2002:a17:90b:1f8d:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3b1b0a20e04mr6004859a91.37.1794684881101;
        Sat, 14 Nov 2026 11:34:41 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:40 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v2 2/4] tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses FF-A
Date: Sat, 14 Nov 2026 19:34:32 +0000
Message-ID: <20261114193434.117714-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193434.117714-1-sidchintamaneni@gmail.com>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_113442_219043_E3428633 
X-CRM114-Status: GOOD (  14.58  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Prior to commit 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed
when tpm_crb_ffa is built-in"), built-in tpm_crb_ffa only registered
tpm_crb_ffa_driver from tpm_crb_ffa_init() after crb_acpi_probe()
confirmed start_method == ACPI_TPM2_CRB_WITH_ARM_FFA. After that
commit, tpm_crb_ffa unconditionally registers on the FF-A bus at
device_initcall time (and when loaded as a module) without checking
the platform's ACPI TPM2 start method.

A platform's firmware may expose a TPM CRB over FF-A Secure Partition
for UEFI boot services while advertising a non-FF-A start method to
the OS in the ACPI TPM2 table. When the ACPI TPM2 table designates a
non-FF-A start method, Linux has no consumer for tpm_crb_ffa and
should not probe the FF-A TPM service.

On Microsoft Cobalt 200 systems, the ACPI TPM2 table does not use
ACPI_TPM2_CRB_WITH_ARM_FFA, yet ffa_init() discovers the FF-A TPM
partition and tpm_crb_ffa_probe() unconditionally sends
CRB_FFA_GET_INTERFACE_VERSION via FFA_MSG_SEND_DIRECT_REQ2/REQ SMC.
That request wedges the calling CPU in Secure World (with Non-Secure
interrupts and GICv3 pseudo-NMIs masked), hanging boot with an RCU CPU
stall:

  [    5.507519] ARM FF-A: Driver version 1.2
  [    5.507519] ARM FF-A: Firmware version 1.2 found
  [    5.507551] ARM FF-A: Notification setup failed -61, not enabled
  [    7.150580] Freeing initrd memory: 293640K
  [   65.515248] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
  [   65.521346] rcu:     10-...0: (3 GPs behind) idle=dd9c/1/0x4000000000000000 softirq=37/37 fqs=5262
  [   65.530031] rcu:              hardirqs   softirqs   csw/system
  [   65.535589] rcu:      number:        0          0            0
  [   65.541146] rcu:     cputime:        0          0            0   ==> 30028(ms)
  [   65.548102] rcu:     (detected by 66, t=15010 jiffies, g=-951, q=1384 ncpus=132)
  [   65.555228] Sending NMI from CPU 66 to CPUs 10:
  [   75.560686] After 10 seconds, these CPUS still haven't responded to the NMI: 10

Check tpm2_acpi_start_method in tpm_crb_ffa_probe() and return -ENODEV
unless it equals ACPI_TPM2_CRB_WITH_ARM_FFA. Checking in probe() rather
than module_init allows tpm_crb_ffa.ko to load as a symbol dependency
of tpm_crb.ko on non-FF-A platforms when built as modules, while
skipping FF-A TPM requests unless ACPI advertises the FF-A start
method.

Fixes: eb93f0734ef1 ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_crb_ffa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
index 025c4d4b17ca..da676da6f3f0 100644
--- a/drivers/char/tpm/tpm_crb_ffa.c
+++ b/drivers/char/tpm/tpm_crb_ffa.c
@@ -9,9 +9,11 @@
 
 #define pr_fmt(fmt) "CRB_FFA: " fmt
 
+#include <linux/acpi.h>
 #include <linux/arm_ffa.h>
 #include <linux/delay.h>
 #include <linux/moduleparam.h>
+#include "tpm.h"
 #include "tpm_crb_ffa.h"
 
 static unsigned int busy_timeout_ms = 2000;
@@ -324,6 +326,9 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
 	struct tpm_crb_ffa *p;
 	int rc;
 
+	if (tpm2_acpi_start_method != ACPI_TPM2_CRB_WITH_ARM_FFA)
+		return -ENODEV;
+
 	/* only one instance of a TPM partition is supported */
 	if (tpm_crb_ffa && !IS_ERR_VALUE(tpm_crb_ffa))
 		return -EEXIST;
-- 
2.45.4


