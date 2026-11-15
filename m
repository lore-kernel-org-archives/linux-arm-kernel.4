Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE33606A883
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JvnTwD/C;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iX4OvPLd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oMtWGlskVqXWYTGgT8kUzvtSaHGUGjmSxElRD/6sbRw=; b=JvnTwD/CuPbPQ1
	5iV/YH0ur5Yw1zVzZ176HYUUY5EVEIc+ZuJX/TOP4CrupzPteM48f+7rJh5CG3u8ZepCt2E+j9r8x
	Ot/kv3lJM7IapiNAzVmJ2CSHoMheqMc3B4UqIuiQbK3dzQt6XVHNee5RNB1XDBv4l83Ryz0Kpkm9r
	MsnXjKwQiF8SJSfUiCj9TZqK9boJe1RkBybIWh7y+87S0JccoeUN0fgzjGRqrqD3IjmolV37IvigW
	Jcb/oXIA9GqGyr8VSFyhqib1DrPSgO76MCgk8O1PTFyYmmAVvHts1I4N7X73+igbHTnFC1g6a7Uui
	yvfFmDjDrm0RFe+LUh0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP9A-0000000GyaO-0Ftx;
	Sun, 15 Nov 2026 01:35:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP95-0000000GyY0-4BWI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:35:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2e95bd1c14cso32204815ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 17:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706503; x=1795311303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMtWGlskVqXWYTGgT8kUzvtSaHGUGjmSxElRD/6sbRw=;
        b=iX4OvPLdkFe6ohxll0H7li9QQUztfEUlP0DPTsownw54YBe8G96H02Y4bU8TgA7fpg
         B9kgaHZj5rv2DjJkZJM4P5nEPsMQARK25k4338CVjPx6iIF8SVbXVU13nePN6NKrljR8
         yNSOOg+wRAb0Nf6C6XfBSuUf11aewS/iO1wynP7RGQOsi0lhtiAC1cfnQ3uO3BXhjKpJ
         bDnbt5BSMyPqoRw0CxFXuhl1qP9L4H3vnt2eCb7G/xcY6+iQ+u4ufLi4tyTI3uxTvoRO
         rj8J5QEZmH3Bt8KGaSECtfRZl8T+fp5yr6LqIXVpMFZZJ4Rj0pje30S4UPssx4XkhqJX
         TUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706503; x=1795311303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMtWGlskVqXWYTGgT8kUzvtSaHGUGjmSxElRD/6sbRw=;
        b=oy/E6G3ZxCi5pvIRcKPoSzLHifddXHAQ7w1bp0qBT2DB8sE267N3Cw/BbijEc+iShq
         vp6i1xXUFZZ8hoS+n3XnwATNoY7uR+mhseBD8VoK/2wnbENnyvAOLdrfhehfVmcjCSqu
         zqVpoNVFf1OGMzdbcqDHu0hTwF2e7NV/qxFHYzhdENOPWKylAGvi2QliDVY3RwBvLubC
         2dMPFQYNaXG5/GuPl8/NJZQh16P0+TPJZa04waZ0yxl+tG34kU6j69OtY45Vtc1HGS2s
         xKgENEGW9kYr9rcGT8bkOHaswy+eHwZA6E1rY8m/SMTaoZ/824HFF9EF1B/oUdyjGKkK
         dZRQ==
X-Forwarded-Encrypted: i=1; AL+hErFVkiOoSJUkcvNaaOaM4FY+0jZDhsFslHSOPyWhG+i+u6pSPLyMUdsLqCg20w7u+Q9K+PUgdxTPV6UpQkIIwuwb@lists.infradead.org
X-Gm-Message-State: APuU4Z9NdB5THWlzBkVg/5jJ5TZ0hySNKzJ1NVKuSouuTXEERrUdRvhF
	rqtLFDSsZHHjAXSJ7H2YiWnOumACUuA3bryoUyWghsyYbElta/OPlpx6
X-Gm-Gg: AYBFou3XhWs0l2NQQvy4LGL1VJSjFi9jh8Ct5Ubwc9cKcE90K0zfK65f2VG92soeUZm
	q2lQ3DYBVbmL2UL7O9G2XqkZjZxjSiJCnB9lWnp9oGxXLsVe8h8Wp4vqdmdR4RT0MMZtohbecCv
	eAmhjL5PSshSBF247Vs8tIXCPHRri9XnB02rtf/uTZpqktWVKLANAaHwdUy4gUhwBdW0W7mcycE
	cEpljILu7D4WFa2kSTfzQZaN1RlavUAht3Pb/TQTlZHovbuO3BgT8f0tQE9MNY0OBLZUGdvOGr5
	I258dXDAiR3P3SuCtD1Axdkr0Ps40+QaOsN4z4glm0DExb0J4podXBQrGA6QdUTNfeR5tnSLzSd
	vLWtJb/9U2595KyqHMNXrdU6OvT8gMwWb1SkhoLWKXj2/mMotH3BU2DWkUzzeVl8jiT63jmSuBQ
	weCCxE6sB9X6oqW3KmRloO5aJtv4stpOr/WdWeiqDApHE4haMgLMU8YCyLjty8gp8VyHhAIChLw
	19kf9IgVZ3mCcmNJyym7Jo6XWajndEGcrPPVr0B3iEXot1OCNR0Kk7Pq9wYoL8VAy+F5yihhvzA
	YaAZNPMISfuwhC/qKVirTOshfvR1t48RLxngsftzLKLfB+plGAXs5+GxpD2b8HODkUao4VrnZ/E
	FJkBfrmNB/qcbnDT++vY3EiPfQg25fpWZkdrMDbvq06+b1WYkRJDdDQTtILDq7/HpFCUk5sWEdb
	Od44x0N+BNOEffj6o83TodGuuHeplqxmbD8oN07N9G
X-Received: by 2002:a17:902:e848:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2ee0dd2dbe6mr71270395ad.13.1794706502800;
        Sat, 14 Nov 2026 17:35:02 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:35:02 -0800 (PST)
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
Subject: [PATCH v3 3/4] tpm: tpm_tis: Use cached tpm2_acpi_start_method
Date: Sun, 15 Nov 2026 01:34:55 +0000
Message-ID: <20261115013456.212141-4-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115013456.212141-1-sidchintamaneni@gmail.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_173504_047749_8E804507 
X-CRM114-Status: GOOD (  14.38  )
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

Use the cached tpm2_acpi_start_method value instead of mapping and
unmapping the ACPI TPM2 table again during probe. Remove
check_acpi_tpm2() and open-code the start method check directly in
tpm_tis_init(), returning -ENODEV when the device does not use
ACPI_TPM2_MEMORY_MAPPED.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_tis.c | 45 +++++---------------------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 6f8344894ea5..df2d8c1c2be0 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -127,45 +127,11 @@ static inline int is_itpm(struct acpi_device *dev)
 #endif
 
 #if defined(CONFIG_ACPI)
-#define DEVICE_IS_TPM2 1
-
 static const struct acpi_device_id tpm_acpi_tbl[] = {
-	{"MSFT0101", DEVICE_IS_TPM2},
+	{"MSFT0101"},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, tpm_acpi_tbl);
-
-static int check_acpi_tpm2(struct device *dev)
-{
-	const struct acpi_device_id *aid = acpi_match_device(tpm_acpi_tbl, dev);
-	struct acpi_table_tpm2 *tbl;
-	acpi_status st;
-	int ret = 0;
-
-	if (!aid || aid->driver_data != DEVICE_IS_TPM2)
-		return 0;
-
-	/* If the ACPI TPM2 signature is matched then a global ACPI_SIG_TPM2
-	 * table is mandatory
-	 */
-	st = acpi_get_table(ACPI_SIG_TPM2, 1, (struct acpi_table_header **)&tbl);
-	if (ACPI_FAILURE(st) || tbl->header.length < sizeof(*tbl)) {
-		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
-		return -EINVAL;
-	}
-
-	/* The tpm2_crb driver handles this device */
-	if (tbl->start_method != ACPI_TPM2_MEMORY_MAPPED)
-		ret = -ENODEV;
-
-	acpi_put_table((struct acpi_table_header *)tbl);
-	return ret;
-}
-#else
-static int check_acpi_tpm2(struct device *dev)
-{
-	return 0;
-}
 #endif
 
 static int tpm_tcg_read_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
@@ -222,11 +188,12 @@ static int tpm_tis_init(struct device *dev, struct tpm_info *tpm_info)
 {
 	struct tpm_tis_tcg_phy *phy;
 	int irq = -1;
-	int rc;
 
-	rc = check_acpi_tpm2(dev);
-	if (rc)
-		return rc;
+#ifdef CONFIG_ACPI
+	if (acpi_match_device(tpm_acpi_tbl, dev) &&
+	    tpm2_acpi_start_method != ACPI_TPM2_MEMORY_MAPPED)
+		return -ENODEV;
+#endif
 
 	phy = devm_kzalloc_obj(dev, struct tpm_tis_tcg_phy);
 	if (phy == NULL)
-- 
2.45.4


