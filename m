Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C464606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HlaARN3a;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOYA8Oal
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Bhk1XAMEGUqw4Gd56fR/vruXqPANPGJWP7xiupKdveQ=; b=HlaARN3aKFQyz/8lYQe4AEnCO1
	3CEhSps5tYDmIuA5Y9H2IcqWvdkzMcmXwdN8GumV3tKeiNs/4oE8/clr8bsZDrwVFw9LLQ+lqM6Kc
	/+nzPR5KUPYTVllFwArYit65CGyisXuJbNXoh1nf4hbYrYdnWiF9ZZUcridqyvwY9k7edP2Rfz2N1
	VuSWXOzZdTQAEyzsqlD7AJHqOrvz3i1jVFXUbbejLDf6YqVBSrTGDGnxLUvyLgxjzer5UqhsOTPpB
	MwjvdiI2ZWOBfMbxHoE4BDXwqI8IxJVLJVBWnTYtCu/jylz3PERQMsLAJv0yTjwuCoMbs34pp1gNz
	9NJxFuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReMx-0000000BG64-3gwP;
	Thu, 12 Nov 2026 23:38:15 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReMt-0000000BG5Q-2rg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:38:14 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso158131a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794526691; x=1795131491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bhk1XAMEGUqw4Gd56fR/vruXqPANPGJWP7xiupKdveQ=;
        b=hOYA8Oal2eFpVuD10WmNUquEK0XuQYYeq6Z2CI+c9WKv6z2ok25/USzAo8Yr+all0j
         7N8bqG/z4pRvVfMq9K8+yVU/7NDmSONSULQxbrAH4B3DQ1J09UAv1Vt7pjIpIH5OaI6T
         d/kEabaRP2JqFMGDqF01uDR7HwUj3ni2qgX9hKoDzKKzW2Jzhkq/YurQ+WyGb1bREaYf
         bI2kATD5Ujl+O82S+bM1/phdZlQIMNyjj9JgzxRCWFWrSTkW+ax6s/ReM9tsXtVaRUi0
         QFjqp/c+1G1vI/vljyz7fj/Y7GP0kt5eaJR7wkqA3kTLQyuAiW6tQ9t9PHjHEOI3w053
         PYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526691; x=1795131491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bhk1XAMEGUqw4Gd56fR/vruXqPANPGJWP7xiupKdveQ=;
        b=dKrxYZW7rPfAIktdCL98U5sA3871px6/g0kQeNfqNV+JPvtX9KUCMLn3jvEok6B5qg
         2ipiIUyZD+UA5vsXyKf0NCGqi8Rgk4ewwB0VPtD0EPAyG8DLEWjZiLqcvD0gj9B9lRoT
         9R3ssbtPVvb46Lzx4nOPXgisAQGQrK4p+wOzyl4R7Q7E+xFCurt8td/AQUJyuqLy8tU5
         OqMozS8/Cuai+w/wT1JsrlXRY9tee2QkljdMqHAaDs2IoP1Rsb+KjeiioYSArjHJ5Yuq
         9VWrKGSuE0Np4VP2u0BgYJ47M2yRqsgP+WPT5oueOtsIFRf440jYRqRT3L1WDvmJz6z3
         kr1w==
X-Forwarded-Encrypted: i=1; AL+hErEa9MgHCztiGDT86t53NWAjxN4WeAGrvFe5XsE3rK0Ev71yOWYfAx1P3FUrIh7UI/Tl+1AM10gENSD497I3LBPx@lists.infradead.org
X-Gm-Message-State: APuU4Z8vknVxGxgsoJx4PVuIsGuBfkgEyBXsnub7SVDmTQOZEd1I4F3r
	bO3kT2r4FwtWU4fSdQl5mCmvKAr2fiTP6yZfHGSBlZBKES9VRObHeOkQ
X-Gm-Gg: AYBFou218PU9cGm5BO6TIxLVxJUQAGGYU4oBBsg3852GVrGgYM1fOzocukjWluyukiG
	WoqVtmvEPc8y7UNjuOhcumOKYXa98GvvTK/FZdmNgzioI96zz6p1G96XUbaisjDoxjUFse85HW3
	xhx7vUuYmTdDq8HPKj3J8VurkXkbvS9oNa2Kq34UlaCeky4ANeS1vELqqeH94LmX2TCPq2xoAam
	DPpvYCJAQevXyzs4TaZZIAXZns90s3dZfxCNKld1WmFAVtoiSAASXS9/KguzdTVS5dU8vm1OkNk
	7D6VVp1SXK7PuUD5PQpmUuBhz9eAE4b9ZUqYKfkMTIewohBBS14DEhCvFYTuRD149t2VIGZFZyQ
	cV2tKg1wKvBO85sOT+VJIR8SV1PMwp2FDVuQ5fdjYMxxUgfuyLQejc3qmMPAMvKI9f8uzAAIb5J
	DuE8KrJCt8IY1KSBtvd31xXEwbGKZhY5guvmId/3WG74T5QhZEPDnXXYERgpNyEVZvVhF6ADqEm
	QYtCv/MrdfUIH8EkXplA9zHXByPjv0q8069iFrqTRtFcFSecMhYxM6iz1DSrVC6ieEw1bT789SR
	DTf4tTG7Rtn0HYiJL4p9Hi2KlvuoLzRkn574aEA8GYRAMB/nqbfkAQMVvS2TFKW+yIcyw6n2aRn
	oPQMh5q7Bpnb+98RPvgEzcdNxOfVuTAa119QEEPYf8jjjgzMguMDT79AClqMlvohXWfbli3Xv8O
	vYk5G6OMMl6QWiiJtdQFJWZa83CZBK516jos5hwUh5
X-Received: by 2002:a17:90a:d60e:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3b1b0d7622bmr327595a91.40.1794526690626;
        Thu, 12 Nov 2026 15:38:10 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3d279d8sm102411a91.2.2026.11.12.15.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:38:10 -0800 (PST)
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
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 1/1] tpm: tpm_crb_ffa: Only register driver when ACPI TPM2 uses FF-A
Date: Thu, 12 Nov 2026 23:38:07 +0000
Message-ID: <20261112233807.70664-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_153812_731090_EB112E9A 
X-CRM114-Status: GOOD (  15.29  )
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
the platform's ACPI TPM2 table.

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

Check the ACPI TPM2 table in tpm_crb_ffa_driver_init() and return
-ENODEV before calling ffa_register() unless the table is present and
specifies ACPI_TPM2_CRB_WITH_ARM_FFA, matching the check_acpi_tpm2()
pattern in tpm_tis.c. This ensures Linux only issues FF-A TPM requests
when ACPI advertises the FF-A start method (for both built-in and
modular builds), while preserving normal FF-A bus probing on platforms
that use CRB over FF-A.

Fixes: 677042afb97a ("tpm: tpm_crb_ffa: revert defered_probed when tpm_crb_ffa is built-in")
Fixes: eb93f0734ef1 ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over FF-A")
Cc: stable@vger.kernel.org
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_crb_ffa.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
index 025c4d4b17ca..8219a8d01344 100644
--- a/drivers/char/tpm/tpm_crb_ffa.c
+++ b/drivers/char/tpm/tpm_crb_ffa.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) "CRB_FFA: " fmt
 
+#include <linux/acpi.h>
 #include <linux/arm_ffa.h>
 #include <linux/delay.h>
 #include <linux/moduleparam.h>
@@ -395,7 +396,41 @@ static struct ffa_driver tpm_crb_ffa_driver = {
 	.id_table = tpm_crb_ffa_device_id,
 };
 
-module_ffa_driver(tpm_crb_ffa_driver);
+static bool __init tpm_crb_ffa_has_acpi_tpm2(void)
+{
+	struct acpi_table_tpm2 *buf;
+	acpi_status status;
+	bool match;
+
+	if (acpi_disabled)
+		return false;
+
+	status = acpi_get_table(ACPI_SIG_TPM2, 1,
+				(struct acpi_table_header **)&buf);
+	if (ACPI_FAILURE(status))
+		return false;
+
+	match = buf->header.length >= sizeof(*buf) &&
+		buf->start_method == ACPI_TPM2_CRB_WITH_ARM_FFA;
+	acpi_put_table((struct acpi_table_header *)buf);
+
+	return match;
+}
+
+static int __init tpm_crb_ffa_driver_init(void)
+{
+	if (!tpm_crb_ffa_has_acpi_tpm2())
+		return -ENODEV;
+
+	return ffa_register(&tpm_crb_ffa_driver);
+}
+module_init(tpm_crb_ffa_driver_init);
+
+static void __exit tpm_crb_ffa_driver_exit(void)
+{
+	ffa_unregister(&tpm_crb_ffa_driver);
+}
+module_exit(tpm_crb_ffa_driver_exit);
 
 MODULE_AUTHOR("Arm");
 MODULE_DESCRIPTION("TPM CRB FFA driver");
-- 
2.45.4


