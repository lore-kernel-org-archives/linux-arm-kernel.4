Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2914606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4V1hAGSQ;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NrLT/5oB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=o9kbdoBsE4U8B/2v2AZP0fcQdT5UCzBPj2wIoqruvs4=; b=4V1hAGSQQX+6vW/izDTwDAl3+V
	H6Cx7viwPYQQLEto3e0fSK0BM9ILdSH2OJIjwIp8KShcS3cvHzhVkLknmWte9XPadq6/i2sDSsKA+
	jAdVeBGVWYHTvK7cDEg6bLr8aHUyTF84WL90ufoO8sMisu9gh9U88JdKqS+dfLnYbBljh9HP10KMu
	3EFyZGdNSq3zo78n9HcgwKnAKynneAWz0e0fjzfwU9+UFdx+9P0BK47pI0xa87fCXhA5yUpGmjBtE
	sOVZq5v/9HYTppjie32JF4msTKlB0U3i4IMEeX/FWV9F7g+oWAQoW+ypVr4zL0uJ/PLGdOjVhuJKJ
	Nk7UNZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMHr-0000000CulQ-2j9Y;
	Fri, 06 Nov 2026 15:55:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMHp-0000000Cukk-2jex
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:55:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4910b863b84so1323055f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 07:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793980527; x=1794585327; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o9kbdoBsE4U8B/2v2AZP0fcQdT5UCzBPj2wIoqruvs4=;
        b=NrLT/5oB9yVGNpt+iD8oxMU9SY4DUHMg6i4IHtLNqjOAxCbM1uqJQiojkkH+e8et3q
         HzYqkiFQBoMH+DhE7F6eC9qJiuyLiYC76XfnVFwHySk5n2LUTuc7/pTgOLzjXR5EzTsN
         vtB6s1TW60rRiH7XuRuwudQZA68dq3TF1JakNUArR2DWkK1Y//CDBMofnS+QI6Vy5+ZA
         O4EnCcfcHqGxRR8ArxtF6UNz+r0jOmPZyiumyZo6l5pCNk7+tHGOwVj2b/xEPsHJGpOf
         9CMy07sYZ52vy/eBsKaH+2p6gAo7WzhcGnoaYdjHfv/VIFl77Dx/U0jFV9UwirlugMU4
         RgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980527; x=1794585327;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o9kbdoBsE4U8B/2v2AZP0fcQdT5UCzBPj2wIoqruvs4=;
        b=Qn3qwwdb2APEXg2PvPk9Q9B8K42WdCl5X+DSuc5oRvu4jVayCAd7YdHS0EPjWc8z1q
         ItVOY8905gSQFN3q5ZauRixuMzT48U0RGs0PlkUgjSvnQkbGwqZJHIl3ryjBuNPB1Bkd
         cp3MYWEqnwavKSIQ4U0GNUrFSN4b7XtxyqolvP2fNDUmL8CzKsc8WOA+duvyOs5Z1yJo
         cwxF7IG1OLVd+v/J890xnbOgQbD1UdN1kZCslH48W3BGvSHRfMc+GcFVMItaaljQ61F4
         TCVDfUXw97yUzndrvAPb99OZNwTKjyjgeb/D4m3qg1LdNgcNRHpzb3ECQsUFnhV8Llvu
         XwqQ==
X-Forwarded-Encrypted: i=1; AL+hErE+dBF9XTz3lDpQxXu/ANDvWOZhmlUXTdZb55ctw9Ki/+V1BvhmS5ow6N/sToB3+efR0dtNHd262duNfV3lECXH@lists.infradead.org
X-Gm-Message-State: APuU4Z/1cbeUD3S9szjbY6FJ/OGT01e6mMLdRBbSFL7oeZ7ZniNJNe7p
	0if+uid0sCX2Zx57dIK3dN01IBWTIX/8Yh/iofj6arRXPtlJ/3n9rVMN//Dn6uQQO0g=
X-Gm-Gg: AYBFou0qkYnwZny3luhKSase0x7Twu542Y0DbBK5dBvRPiunXq3yo5IOEcGXfrbice9
	g3k+Il1gtMYa91cuDN+e8EqXSU3pLyHHmZNjZY76UDLwiV0Mn87Lq78ZJu8Ns3+WDpCINCSkpXw
	kY02MxHXCQkoH8mdqoM+fiU59uNJEnB69paE2kx+djFeRcJvXoc90TjY2nxoCT+6XIGORxgQDcc
	ELYOF101phFSRAsvMNiQ73VLfersSZBy/Ibp+P4r9/bFzFkv7xFJvBgUZVyzfjDXKGlYJS8YbHx
	ynqaUNekgv3V5AhhqiUR2hy2aCuH0cOQRWDuMmuo1//we2Uy/FyUBsq14/U/BNRvF86NUTFaLKm
	kmVJ99kRZw2OYzAVdZ1p63EQZwbdtbfcR3HcNOr7p27Yv2PYI79kZHXJW8frEy8hmwTHVTxqw3+
	Kx4kHgGiKxuH/+TFC8llgA/sWezKBLjSBCMl8tsBRcE9PfGiRrS7hRX+/QHnbya1KoXyZI7vQZA
	jx5aWwEu4UDUUIIV4G/3HFw6DTT4Fptj1he6k5vW6e63mRxrQKlm4wm2HWTwNHw9lbboLyJiewt
	MYZ7dsHX/i8VaXRdEK7/ZnSzALwvqNCnA1PZ/JYpYtRg5XVOBM+5gR0MLUC/28Ae7Q==
X-Received: by 2002:a05:6000:2893:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-49115c978f5mr13236722f8f.1.1793980527027;
        Fri, 06 Nov 2026 07:55:27 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:153c:4b80:6e11:422])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809ddbbsm4492288f8f.53.2026.11.06.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:55:26 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 06 Nov 2026 15:55:16 +0000
Subject: [PATCH] mmc: sdhci: Use named initializers for acpi_device_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-acpi-mmc-v1-1-00934babd69e@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3cTkgkzd3NxkXfOkpCRLMxMz85QUCyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQABnyAqbAAAAA==
X-Change-ID: 20261102-acpi-mmc-7bbb96467dd8
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hu Ziji <huziji@marvell.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793980525; l=5528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wk0vJLpQ6eLGpzrrOfKv/kURpO3tO1+Cxw3RmtkJnps=;
 b=w4MPYYFZwmLZeAw2/+63BAo7MARTNN03UeXZvJKjaw4YFtVxwA3b1mxsR+J0DpD3p+f2D1Jpj
 EchWeco3koqDhaHCp0G1RXvxaQT3Gf186PUHp5qnBqR4NFHcjXSlAcs
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_075529_929789_A10FEC57 
X-CRM114-Status: GOOD (  19.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/mmc/host/sdhci-acpi.c       | 30 +++++++++++++++---------------
 drivers/mmc/host/sdhci-iproc.c      |  2 +-
 drivers/mmc/host/sdhci-of-dwcmshc.c |  2 +-
 drivers/mmc/host/sdhci-xenon.c      |  8 ++++----
 drivers/mmc/host/sdhci_f_sdh30.c    |  4 ++--
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index 84c7054607fc..e97c33614fd1 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -704,21 +704,21 @@ static const struct sdhci_acpi_uid_slot sdhci_acpi_uids[] = {
 };
 
 static const struct acpi_device_id sdhci_acpi_ids[] = {
-	{ "80865ACA" },
-	{ "80865ACC" },
-	{ "80865AD0" },
-	{ "80860F14" },
-	{ "80860F16" },
-	{ "INT33BB"  },
-	{ "INT33C6"  },
-	{ "INT3436"  },
-	{ "INT344D"  },
-	{ "PNP0D40"  },
-	{ "QCOM8051" },
-	{ "QCOM8052" },
-	{ "AMDI0040" },
-	{ "AMDI0041" },
-	{ },
+	{ .id = "80865ACA" },
+	{ .id = "80865ACC" },
+	{ .id = "80865AD0" },
+	{ .id = "80860F14" },
+	{ .id = "80860F16" },
+	{ .id = "INT33BB" },
+	{ .id = "INT33C6" },
+	{ .id = "INT3436" },
+	{ .id = "INT344D" },
+	{ .id = "PNP0D40" },
+	{ .id = "QCOM8051" },
+	{ .id = "QCOM8052" },
+	{ .id = "AMDI0040" },
+	{ .id = "AMDI0041" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_acpi_ids);
 
diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc.c
index 35ef5c5f5146..db5bed2397f6 100644
--- a/drivers/mmc/host/sdhci-iproc.c
+++ b/drivers/mmc/host/sdhci-iproc.c
@@ -350,7 +350,7 @@ static const struct acpi_device_id sdhci_iproc_acpi_ids[] = {
 	{ .id = "BRCM5872", .driver_data = (kernel_ulong_t)&iproc_data },
 	{ .id = "BCM2847",  .driver_data = (kernel_ulong_t)&bcm_arasan_data },
 	{ .id = "BRCME88C", .driver_data = (kernel_ulong_t)&bcm2711_data },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_iproc_acpi_ids);
 #endif
diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 09702022e708..113a9399d7dc 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -2400,7 +2400,7 @@ static const struct acpi_device_id sdhci_dwcmshc_acpi_ids[] = {
 		.id = "MLNXBF30",
 		.driver_data = (kernel_ulong_t)&sdhci_dwcmshc_bf3_pdata,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_dwcmshc_acpi_ids);
 #endif
diff --git a/drivers/mmc/host/sdhci-xenon.c b/drivers/mmc/host/sdhci-xenon.c
index 046e8100dd08..2e4926e722f3 100644
--- a/drivers/mmc/host/sdhci-xenon.c
+++ b/drivers/mmc/host/sdhci-xenon.c
@@ -700,10 +700,10 @@ MODULE_DEVICE_TABLE(of, sdhci_xenon_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id sdhci_xenon_acpi_ids[] = {
-	{ .id = "MRVL0002", XENON_AP806},
-	{ .id = "MRVL0003", XENON_AP807},
-	{ .id = "MRVL0004", XENON_CP110},
-	{}
+	{ .id = "MRVL0002", .driver_data = XENON_AP806 },
+	{ .id = "MRVL0003", .driver_data = XENON_AP807 },
+	{ .id = "MRVL0004", .driver_data = XENON_CP110 },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_xenon_acpi_ids);
 #endif
diff --git a/drivers/mmc/host/sdhci_f_sdh30.c b/drivers/mmc/host/sdhci_f_sdh30.c
index e9b934e159ad..f3d0a50d1a6f 100644
--- a/drivers/mmc/host/sdhci_f_sdh30.c
+++ b/drivers/mmc/host/sdhci_f_sdh30.c
@@ -227,8 +227,8 @@ MODULE_DEVICE_TABLE(of, f_sdh30_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id f_sdh30_acpi_ids[] = {
-	{ "SCX0002" },
-	{ /* sentinel */ }
+	{ .id = "SCX0002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, f_sdh30_acpi_ids);
 #endif

---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261102-acpi-mmc-7bbb96467dd8

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


