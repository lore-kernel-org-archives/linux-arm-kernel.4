Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789FB606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UBMf9of8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsK9Yx8A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CRGAUvOGM7cXeBiNifNubn0WANT9Nl+imZXj5mUQRV4=; b=UBMf9of8W4tyKt
	8Tw3BvwLq0hXa6f8OXYlCHAQPWOJO03z9Qynl5vGs/TuE+luY//kI7uhqrrHO1Fzkzf9xST0WayN+
	it3WjRduqaTzfGD1rT+5hLcziTB7rQ9qXoqH5ET94F8lusgN5cNOWabG5ODtTTlKDokJhl7/wO0kF
	C7LAMyrnxMlZAZGxuP4BuRlsO4D9wN1TF13d+plew/pFsjoaI2DpHOkELwvNTlqA0blOXRxcT+hhP
	HIn/rhesrrmwE94H0mz2F4spHTi9YSM/sj4AUEDabDD0iLm4hLsplzbFeAoTmjbis33mGFfqCxA2U
	zbnLnuAm+QRU6jF/mKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP99-0000000Gya9-43pG;
	Sun, 15 Nov 2026 01:35:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP93-0000000GyXS-2XvQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:35:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e95bd1c14cso32204645ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 17:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706501; x=1795311301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRGAUvOGM7cXeBiNifNubn0WANT9Nl+imZXj5mUQRV4=;
        b=qsK9Yx8AfaTptIMZNrzqd7S4a6zbP2uwqd23uOUiVddnmMrAr2WsL4q1vLmiM4wJtg
         7C8fHniX76eZcLWJ23w38wN/vd/umhKpqw2grnwBme95LiNEamZWTyGzjiLE9TG3H5nX
         ILKhmqj0RUY+c5GwKdKSn916c1Y60jF0CsdeT94P0932bKKyjnTF+IVlmYiPFAF2hzDH
         ytGh22+mTW7V3o0d/xqBKgAxfs3H083zwwhH1za1ZQARRr8uEyjiF+k2NoB9eISdNsfc
         EtoJVXT1Uu9rBaa7Nr3ayjB+0hq+ai7xP8nPVG3cDLtFrzvPAGicGaq3UWo+JZ6aawYb
         rnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706501; x=1795311301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRGAUvOGM7cXeBiNifNubn0WANT9Nl+imZXj5mUQRV4=;
        b=W9uoZQ8VCI5PWPNNVuEqWvaPpP2g1bfMVKDvLnIox8wxTy0SkQ3EeTkXGu+F0mgOeH
         rNxIoWvEIBN6QKcr0fj2KZWAnLZh0FKcckewCNBaCAWZdFGPtG5EQ8TSNMvVpEoJn4gv
         5WZ9dwmcvO0u7CX8LYn+KwBLWW2mXOcVUwc+MKtbJuZqfHSi9q1ab231hpPoUi5YiWHq
         MHtA7LdpKcc0WWZ/mQnqy/9miyAY0aC+cT59qza+sBZX5erZXFy9qcLwP7j3KLLHf703
         qylvPph3FbF/FE7Q0yiMg/tp/I6/BjvEwPJOCfRS8BrtexkX8uslWLGNW017AIzHrZw2
         panw==
X-Forwarded-Encrypted: i=1; AL+hErEOou+4Q5FgrwSu4Yz6NXCFK9skXXYxYwVKeBAMmFgoxGHXVji1mESmJ5tlXhKTNYF8jpJfksX2h44gX9qvqBK5@lists.infradead.org
X-Gm-Message-State: APuU4Z+GAxXuEZOhcd8kTSljjGwHVPDrk8S7fhwAlHVt8ZR4OnzY1piK
	upNXvIFTEY7V94b1WhRdYWKYnGpURannHpyATggnlBiohMye1yeAvm1u
X-Gm-Gg: AYBFou04yIoCDhFDJzuTow2FixILZizDNWP4Z9qb1ZV5+fugAtVBiGc4MZOuLbKT0ra
	7CidTzTPv1h9Z3xV4QgxkpUq7DOhbK8DuMIfO853BO0KDleQMOG4A4O+6qGQzAWOfA+g3TRVz4S
	eMYbWPh9rikHD7H1NBUgGbSiAd0dUAwP0ukflqlmveAC909Y7z0bCRTXvRZ9A0LmqcgLXjVf7Y2
	iqOqB55uBSStnZ4I6oLaGkAQgLg2xfjDQyLYCeuyYyJgJsGn1+2eNE4Ak0CbF5/89hEfW5IqnfH
	CvePLY8tkGgnJG3rr+1NPLOBDFj5Hpmuk/EXuRUZ7s+kw4Ztsxd38xdKGCdYFJEYNWAHV4VbeYE
	q+XqTaoDx0j6MYfAsfeve+V1wknhsuVnKCWRsqWaB1on/hpFMlsnH0hlV84454k+Qs9s0YLrMbj
	62mYDm+9vITqiir1q4KtZCY0RiapM/3eTV5WOnwx7/ORIsLzZhE0jkk69mrBVO/u2APJNTHwaoG
	8lg8wUXfp24v6roAksh1rNahvw50DybLSBngStA+U0693Bf4UUTc+W5grw54OgxGkhIg9h33aeG
	OSfE8YbaDc4u7Cv+YpUU6wnLy8ZhrZmcEdDW9bNbS/kjpFPhlRUWUd706sztAB3Lp9YmB7RWqZe
	QNpe7oiQkBQt11Avbpw3RDrah7K6pN0nTgg5J8peSLsX4uj1/PgJT9A+DMnX3Bx3oeo9hqW1jIB
	i+d4UlzBvI4BactxQDYNzKYC8R6ee0zfBxOVxtYYMSCBf3UwBXw17Jol318KsovQ==
X-Received: by 2002:a17:902:e5c9:b0:2ed:84c6:5d5 with SMTP id d9443c01a7336-2ee0de3e85emr70675995ad.42.1794706500714;
        Sat, 14 Nov 2026 17:35:00 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:35:00 -0800 (PST)
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
Subject: [PATCH v3 1/4] tpm: Cache TPM2 start method
Date: Sun, 15 Nov 2026 01:34:53 +0000
Message-ID: <20261115013456.212141-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115013456.212141-1-sidchintamaneni@gmail.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_173501_647121_04048102 
X-CRM114-Status: GOOD (  13.69  )
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

Cache the start method in tpm2_acpi_start_method during tpm_init(), log
it when a TPM2 ACPI table is present, and export it for the leaf
drivers, defaulting to ACPI_TPM2_NOT_ALLOWED when the table is absent or
invalid.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Co-developed-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
 drivers/char/tpm/tpm.h           |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index e0385b16616b..c18b060d7da2 100644
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
+		status = acpi_get_table(ACPI_SIG_TPM2, 1, (typeof(tbl->header) **)&tbl);
+		if (ACPI_SUCCESS(status)) {
+			if (tbl->header.length >= sizeof(*tbl))
+				tpm2_acpi_start_method = tbl->start_method;
+			acpi_put_table((struct acpi_table_header *)tbl);
+			pr_info("tpm: TPM2 ACPI start method: 0x%02x\n", tpm2_acpi_start_method);
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

base-commit: 7e52fc165aa50e70e8df3c879d04fc0ff1673d4a
-- 
2.45.4


