Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA84C606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2EhFJ3IM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NI3vHdVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9ar4Opp2H1k6OcNUZh0cDsgFhCHm2e923NlD+vqOgvM=; b=2EhFJ3IMAignVU
	3C/+hdKZDCtzvA+ahoWGPVeYI5TY1Atjtrz4qfUHdrnBM+nRUbrArjSBJgklNELUEwa8cUPhn0GKH
	W6YrItqaGDLKmNVkjniW17cPCE1vlDT70VsPdcWHk6nBuhHVc+i9WCgs+2FKPBUa44j47O1tWvcUH
	u4IIWb3YLGrTzdCGQ8xBrXrTNkwTXrmchxyGtwsHT0v3jKevx65bDATG2pDK2WiH6veLjjyzG5HRQ
	KuIKnUG75ZiZHyCHNHgBFMB9+ep0dKtsjm54vwrB8jdTLFcb7YVjWSLs9IwMO+CbeS/ZGXKLNrhV/
	+0qrpISroqQVxuXnYYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWS-0000000GgV3-3NMx;
	Sat, 14 Nov 2026 19:34:48 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWL-0000000GgSg-0DRe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 19:34:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2041830a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684880; x=1795289680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ar4Opp2H1k6OcNUZh0cDsgFhCHm2e923NlD+vqOgvM=;
        b=NI3vHdVufG40Qe8gcn9Ceenl3r4pPjW6ZBL77S3uOvn/aOaKVIdOVV+Qlpa5nFkpmW
         p10MHyg7+Nb/ww1sDIYsVCe9E9425z5ezlfjDdtSgjGvPwvOEkwpXXMx7AEliu6pO3vm
         G1EEagI2JDakRHK65S6a7zykw6Z0SVESJk0zpJdBui1Jw32v2MMw3CTSGQGnaPTArZTQ
         lqk8VQ9KWwBQ6qkMvWlq1Nix9Woy2ZckLNc1Gop7QbtbkiQ9PbcLh2AecyV0ruBTxMiV
         Dj9W2/fMwb6xKK+RUigVEpPu1dk4zmHB3QOjrgkcRuQMcoRkXp6XlSpY6rW9CVmKvGyu
         XnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684880; x=1795289680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ar4Opp2H1k6OcNUZh0cDsgFhCHm2e923NlD+vqOgvM=;
        b=N3igwoA9joc7u12x3KJoXgRhVGwdYdY8n1co/qMB86z1gd8G2POIM3FLGBFFtlWmjz
         csLrvg5QabGwDE4T2iA3FbjAdLtc8uCrOmp6X09RahWBlL/lvN7h5eaJLoLJHCnK3bek
         6dekMRUAhaXNoZTHL6GScfL7G9/gNlZGmsDit+FE+iV0O5WBcKN+uWHJ5ANr/H8gBn0I
         KyH27YLMbNPxR5BFnYCcW6IEQiHishyXeY4+9c+V+um2Uv+LoCVhhLG6R/AC9SnlESdp
         Ux/zS2nbIDr6DIbWKGoN6OPuX1qnQki0d4fob4Ezk45bwmLDSHd/M20hfKxCrGOKM5vS
         gHhQ==
X-Forwarded-Encrypted: i=1; AL+hErF2kRvLnPu/nMhJN0OvUkpOR5Pj+8E9h2loevtuW5I3tbEZRkI/MQ2xmEhQizsNOxv3FFaqYbIwBtgNYnZSeG6u@lists.infradead.org
X-Gm-Message-State: APuU4Z/nY42KQUcW1Mf8IjwNUKhDztrJWN2GZTKX74h1j9BXb4plkbHH
	/SazHHc+kdpCnjQfTRMUnMfR6IkjnH4zi2SLomzjlkVq6anfYXIJELw9
X-Gm-Gg: AYBFou0c9YE+CT77Xa9zqnowbJ7upeZjjiXIbXVQxjWB0KK2Pwp6wbg4DxzIWb40Ixg
	MvqlJBdGpUoRsTZU7t7QLTIrtZTEiKp9DaxR0ZU/6XJnVy1Jh7lQh2FC2bkRVbiHP+mOe6GaAwg
	+5UCMRFuZuv8tuylkg5TV5FjywD4diF4FVZgdGrcDIjMeK7TBUzCaJX9wLde+oLaoCXRGQ7SbqI
	1azH7F7+i2tPtTbatCsMW07jHTMKkWCChNbnB9XzmeUBAMV+XBbLkhEtf4PbYzSzH1iY+ZlZTES
	MNuDueHRNyyNXT0tXBUjawJ3UaUsp+0YV7LzpYMmlGuFFhS6LYjQXiOhByDuJfmYi6VdWnfzzi4
	7EipRhiSYExkaquC0UszogoGS1softa8DB5Rxd04XWMeSqPUrWfJhKOhreS6rYH3mfmtifzcwz3
	ke4aySzsK5uAx6/F2Zl2ghlkMknJzrSQ/5ZLZy2UFgf+8ETOn82WEFFbhkoawJ4KhnBdZy7mrad
	zY50WOeCC5pU+WQ07hy78Tr0vEw+QomyNFlRdSNBP+68NNtMbJN4sMVT1/3HFTgeLPUN//M/JNh
	X+erlS4Njk2fEUcaS+cSY/HKdQ/lfFlB9kkHGBXO7HLZmKlB1KPM84ukBrJbeUFAyVfZ4QDIhgD
	JEK92o1679s2T9F+DxFDRPtnonkiWdft1y0/mxx7w6bapC1ItbOX6jLZ3vLqttdLzEp4wjlRytm
	PyPMy3nvWZ24etXtekc5HMeDoDCfvzbT1OUlH16Gf4e3DvI2S/L2fWL97//QOHHw==
X-Received: by 2002:a17:90a:c88b:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b1b09e69c6mr6471730a91.13.1794684880041;
        Sat, 14 Nov 2026 11:34:40 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:39 -0800 (PST)
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
Subject: [PATCH v2 1/4] tpm: Cache TPM2 start method
Date: Sat, 14 Nov 2026 19:34:31 +0000
Message-ID: <20261114193434.117714-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193434.117714-1-sidchintamaneni@gmail.com>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_113441_092679_0D09B285 
X-CRM114-Status: GOOD (  13.32  )
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

From: Jarkko Sakkinen <jarkko@kernel.org>

Both tpm_tis and tpm_crb retrieve the start method from the ACPI TPM2
table during device probe, and tpm_crb_ffa also needs it before chip
allocation.

Cache the start method in tpm2_acpi_start_method during tpm_init() and
export it for the leaf drivers, defaulting to ACPI_TPM2_NOT_ALLOWED when
the table is absent or invalid.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Co-developed-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
 drivers/char/tpm/tpm.h           |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index e0385b16616b..7b7da79bee7c 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -534,8 +534,17 @@ int tpm_get_random(struct tpm_chip *chip, u8 *out, size_t max)
 }
 EXPORT_SYMBOL_GPL(tpm_get_random);
 
+#ifdef CONFIG_ACPI
+u32 tpm2_acpi_start_method = ACPI_TPM2_NOT_ALLOWED;
+EXPORT_SYMBOL_GPL(tpm2_acpi_start_method);
+#endif
+
 static int __init tpm_init(void)
 {
+#ifdef CONFIG_ACPI
+	struct acpi_table_tpm2 *tbl;
+	acpi_status status;
+#endif
 	int rc;
 
 	rc = class_register(&tpm_class);
@@ -562,6 +571,18 @@ static int __init tpm_init(void)
 		goto out_unreg_chrdev;
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_TPM2, 1,
+					(struct acpi_table_header **)&tbl);
+		if (ACPI_SUCCESS(status)) {
+			if (tbl->header.length >= sizeof(*tbl))
+				tpm2_acpi_start_method = tbl->start_method;
+			acpi_put_table((struct acpi_table_header *)tbl);
+		}
+	}
+#endif
+
 	return 0;
 
 out_unreg_chrdev:
diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index fa554c5ad80b..212ca2410c93 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -100,6 +100,7 @@ void tpm_sysfs_add_device(struct tpm_chip *chip);
 
 
 #ifdef CONFIG_ACPI
+extern u32 tpm2_acpi_start_method;
 extern void tpm_add_ppi(struct tpm_chip *chip);
 #else
 static inline void tpm_add_ppi(struct tpm_chip *chip)
-- 
2.45.4


