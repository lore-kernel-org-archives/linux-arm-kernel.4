Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A476606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=thxAB8YN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l/tmojD5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=; b=thxAB8YN4Y8U/r
	xOvMxEl2R3MRM1M7V/Nd0OOWdgZ9nonGO90jbZ9SFFan7ewsM/BWKe/um5e1dsQpO7FSfJCqvFhtX
	RpKElLZ3dlT2OP83AfrDYKKqJmRERI4g2JYAF1xsagl1IRAWmsRqTaTftE1oTOqwHcR+Y5WL/G/Cx
	DI1KDIZ53v1X6OwxvZtVBKSLMe2da0E0yKS4jZ7KXuOEai6MQi98XzEKjOjOPIOoj88AIzgKVeaQ6
	xrN5j9EqrFZ7056IvSz0i05hRZ1BZBvPpsv2xY1Jn5OGhR5lxZu5cGcNDQXY1ZnnEo7Z7XXNXuZ/j
	NIHuZ2GLFSSXJy5b4mQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP9A-0000000Gyav-0jU8;
	Sun, 15 Nov 2026 01:35:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP95-0000000GyXx-4Bi9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:35:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e9d7791b00so25721475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 17:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706502; x=1795311302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=;
        b=l/tmojD53OpzQttzCSZTvXM8o6ESKkBPgFsPBgHXl0rlnPXmYmaD0t/ZyAQYl5/QEf
         H7sij1AzpuhYm6ZjDIFjxr14YZ9p2IQwK5QQg3xjsEYHF+KKqiwgxbM8Bs5K0SZHQOp5
         FFQjg9//2EUAPypwOpI3LAn+8ODGKedul/Hbp9NEytsUzynYoGkZheNeIxSQC4L9WQQq
         ioyZ7MRD3DSRBApX7xPUHTmQaca4hKZ8qMdhMj/+XQPTpH/B0MdItYSjcl+Yhk51s6/z
         VUJizsKbn81F6RAmDSsGNQ/coDBervgy+KP+gWQpdhqj5iFGAoLrcPoq74kjxtKuQXc3
         XeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706502; x=1795311302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XRaUjntmnwgXMBa6bG6H6t68ZP5x01BzH1Lhm94CSs=;
        b=W7vGf/2IeFgWatKkdifkCE1tsAyon877UzfyPvDiZhEwuukjPY2jj9zQIFYtHM0K4+
         ETX0p+icMlBvX3ICSYEZn+sVLVReubzx1rgLm3DIDn1e9Wcv/JqsB/f4zsZiiiy5xYwi
         USINinsMWXn4gIIN/DXLuf3ZBdy6BKjKgK++1MbuORadfofs9toXGx7xPaooENddc2LL
         HNL/q6BzXw3R9X9fT6gHKvIG6jO2+ahcaP/uSKsGbYM3RgoMV/5ZeQjZZaZxcJdOL1+S
         MMP++oO6v7A88Inda8TQSoHum1ARHnZcwhd0/DEvBFdOXCXjzTUG3p0RkSZhzGth6SKT
         og7Q==
X-Forwarded-Encrypted: i=1; AL+hErF0Uf6zB2c73FrGviRuBtW/KtCxNuKLMW5toSFJaqeVINtpzTaBZPbt/iC0dtY0+bCqdKyB1E/XsEaFmYqwx96X@lists.infradead.org
X-Gm-Message-State: APuU4Z8Gu9RmPh+M/k3y4XB3v+R5/I3z9se+dfeArjYfbMgO0YwjWPti
	LZxwMfGmo+9LGmLpTmeXXNyDqyjCMfvP7rnhQu/edU9n51V/RnuSWYI6
X-Gm-Gg: AYBFou152hxU7eOfvOlC7NqTnLBRG1wvhgAu954r8E5XWr+yu9chWn5IxNwrVa5zBsC
	P+qp9qM3xfmfdCUbJBbrjMiet6sI6yl4Z81oRnCWQMNfWiaJIsMyT0TsQKhP9bDTD/Ph/xO/AOG
	rxcYsNP+d37ePTxVtJ2+oO8iPz9fwMgfQQ2+JUovikk0tttifxgTe8c6eSss4AyQEGHu6T7hxjy
	QEWCV2cdojFZNrGuyuvsdiFeMG40l7x35f7HV7HnckSGIqz1WWYzz33CpboJqZx7mdYSf/GiMwM
	HQ2xtv+8ZPV7qhOZFL4WDfPrLF0tV5qFhw6UntKs9W211RdNBzftbMIhxM7ishPTZO5oo9q7a2h
	oiP/S1a0Wig9KHS7ru2PjkveWrCqFVHY9IC16JrE7Ot5lw6qBXI0pTYE9EY+l3q57hPBegLolog
	tS8IIoX4D+sZ+9lFENdQhaLtnLH1Kbf8mZSWSgDckwoRMC4HW8hn3UcNnrSn9Qu6JVmBtPJfjSd
	CU4aVrwYJfA5k1QHjTfo7GJ6xqADCs/3Ex9VPQ/P56gHuEtp94HNwrQvI8M2g+q2YstoR5JuTw8
	sNJ4boZVJWVjMylz1WLZhnj6TxTRuZN9zIAvtnNyApsbmDIero1LKMKZobSHEKlIEd4hNndqBtw
	Q4w+T5Ijy/qgPIRE674Dk6drfxhuCs/k2eFf6CF27f5tpD5fU6mJAKKYvlHQo2ab3wHDwPNefXp
	OjJFnMKiVRTOlo5IgibDSQAYlg1dYfoRB1NTGzPsMuDA==
X-Received: by 2002:a17:902:e84a:b0:2df:9556:6848 with SMTP id d9443c01a7336-2ee0d66ebd8mr59520075ad.4.1794706501770;
        Sat, 14 Nov 2026 17:35:01 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:35:01 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rachelmenge@linux.microsoft.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v3 2/4] tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses FF-A
Date: Sun, 15 Nov 2026 01:34:54 +0000
Message-ID: <20261115013456.212141-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115013456.212141-1-sidchintamaneni@gmail.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_173504_049285_94EB1378 
X-CRM114-Status: GOOD (  15.00  )
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


