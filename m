Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19454606A880
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NWcW40Xi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ecpQiMJc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5irTJeCQfqm7AWnnyXmuLFQGD8l/R9bAv0K62WDnA+o=; b=NWcW40Xihz+wim
	eVuqHKP0NxNP2IAh/jh7f4odcNzvbeN2vWI/N3yJjV60YT9mv43N1Otn8Q49ioIweNE3zCRknB2JV
	ILwJcaQGsN/qJReXtAPAm0qkinlbpIvouazp395BfJgUy/PbsTfhVk7xv9KM1dQ3DRE6lPii43e1Q
	rHkHD7Xslj5WgDSZxsGY7Wjd07hnRppZk4jvizafOMusxe4fDMh9+XO7aEiAVChNoKZamfqe+ADX+
	kaGY4BBdOmueohHZ4QcuzS0mW80PejFle9R+lVQteOqijEhrbrXD9RxWZJ9ptvXPUIm9JABh4z9QA
	j192uPzLFC4ONiOZVw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWS-0000000GgVh-473U;
	Sat, 14 Nov 2026 19:34:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWN-0000000GgTT-0lWI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 19:34:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1838482a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684882; x=1795289682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5irTJeCQfqm7AWnnyXmuLFQGD8l/R9bAv0K62WDnA+o=;
        b=ecpQiMJcjuHN+0SSGyx+rCC3UZnbrXQKnIdAGIK6I9tus/uOVd804msPjsW1d3EiYk
         2h5IRRteJ09YRQkl3Gbekk8SIuXu4yhOI4/xr7/I4HnpHypOO6sq9W7WMnsFgdFoLxza
         KxQiZNc03WNW2YUxrxkRV1WQ+MGFs8kP/sLVXmfRdsqj0k1yTNixbTEVxYv7Qr5Ww2JT
         L/NmJFyCAxmyXcKCT47HSTM/hM5y1VsN2lZTkC/wFpjFg+ElHAs17nv9sup2dOIQhZa6
         ZuS8p2mAU9Wb8NtB3mKspt7Sg7NCEy4LExKdJC+iR+QwZ7QMqJ4VKtQ1LCEvke748yil
         t9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684882; x=1795289682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5irTJeCQfqm7AWnnyXmuLFQGD8l/R9bAv0K62WDnA+o=;
        b=E2cSE4UQ2HNWbJvqYTIBMxGI+aiNsLSevo93ejlBJbm5tABcyiSJcb16RqJ0sAhl90
         UZ+ADQHDWMe+A4rZYrdKJ/OFEmR2zg2rujGCsrJYSlnfkxkCH/fWkHnipjsQ7Lua0fVU
         8ZB736AdnYJQIXMKcAQ8tkkYGfbyA4ah9fuH5yVRgqT+QIOKnEkDfqYr7yDcMs+oiqSE
         vcROjL9iDBnbvV3TGUwJ8EhbXbqOaZH151G33DKz7JsvW9H1gvlfy+p1q/AjY3RUucH2
         UQ/ql/YsrUBmk36a56wetgnsb/3J+iOLyctUytaNLjNDj9NzFZLvnWIfCJed4XOnq+1w
         NNrw==
X-Forwarded-Encrypted: i=1; AL+hErGZScFiSNOPk3d384kiF3ncDIkB4VzEsoS6HwzobbRAMBVJSUjCgGTnm3YCiEOR3WkoD5zbSisSyKGbGGsu3Qgq@lists.infradead.org
X-Gm-Message-State: APuU4Z9G0LHv5TtfPNas0aQa5vPBRLf9+VSgTAYa5zmRfAeuwRQJb7Uv
	wO6SwLK9o9bxb1FVfseLu04R7dMSXLAfW/NZ5ZWU+VVQXaHpDobEX6bG
X-Gm-Gg: AYBFou1bHw+7YifyodVF65xwpxNAN5I8ad9VeeUe8yoKNk9IV1806upZUnuwHlzEnP/
	GptQdyfb8m0iCohPbzjttv8j6CMAQyx41uxd2U/0VWY0fQFEThosWYmUKhLAVmuuOx0TnznRy8z
	H3w6JQzKXn8qRlqDCZm4NVHzziIJ07PkT5EQCX6dcMIoG9MTu0iVDQlAszmSisYp3bK5BRb3bXz
	h5xwT/6I7DBtweUqD7Y6g/Pr2MV2q6S6paixWfTadTnfoeWmnfAKpuMXptO7TYY+JET9UaXockq
	MboXgAt7Ft8IFArUsIEZhCCiQ+g71i70pe3J0sMKb7eCjZuclCqFuBDU2iszKO8vRUKw12s1Alk
	OCYwDfCSACmvHD8/wl4+hXx0m4K0m7UlvazxUZI1rzNPXmrasVl9hfiogORi3ChmZgoZb+g3EO5
	YCK6DN/YdqmJpJdYcEmmcVu8Gqag78t5cv6Fae1bOjPaBujrNHg7+c2y1QFHz185cYZazD3iSO4
	n33X6wZYD/NA5d+Kiny8zpziL83I3fro6c3uJ8fDySmw9nWAPkiQ71wi8unYuSJDPQyBrjKgZew
	yv54pjC7Rt3ocS0gSgLaDzaA1FmCU+TWo2UbMiXKpvrCma7vpzQ8nXv4S13GuD9G3Ssr0dKjytZ
	kOMOOoMBN5TrtEFTGgOPbjKBjFSo/ZHyhemG3nQGVd/40uKd+jdRwMp93B19JJsWRnfOd087qeZ
	2ZX+mbiHIxzjaZPZZUBRk7YgtYZML8nECzcdy4Ta7tcA==
X-Received: by 2002:a17:90b:2882:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b1b0dacca3mr5922566a91.66.1794684882159;
        Sat, 14 Nov 2026 11:34:42 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:41 -0800 (PST)
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
Subject: [PATCH v2 3/4] tpm: tpm_tis: Use cached tpm2_acpi_start_method
Date: Sat, 14 Nov 2026 19:34:33 +0000
Message-ID: <20261114193434.117714-4-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193434.117714-1-sidchintamaneni@gmail.com>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_113443_224908_7552434D 
X-CRM114-Status: GOOD (  13.48  )
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

Use the cached tpm2_acpi_start_method value in check_acpi_tpm2() instead
of mapping and unmapping the ACPI TPM2 table again during probe.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_tis.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 6f8344894ea5..a6fb6f889e7d 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -138,28 +138,24 @@ MODULE_DEVICE_TABLE(acpi, tpm_acpi_tbl);
 static int check_acpi_tpm2(struct device *dev)
 {
 	const struct acpi_device_id *aid = acpi_match_device(tpm_acpi_tbl, dev);
-	struct acpi_table_tpm2 *tbl;
-	acpi_status st;
-	int ret = 0;
 
 	if (!aid || aid->driver_data != DEVICE_IS_TPM2)
 		return 0;
 
-	/* If the ACPI TPM2 signature is matched then a global ACPI_SIG_TPM2
-	 * table is mandatory
+	/*
+	 * If the ACPI TPM2 signature is matched then a global ACPI_SIG_TPM2
+	 * table is mandatory.
 	 */
-	st = acpi_get_table(ACPI_SIG_TPM2, 1, (struct acpi_table_header **)&tbl);
-	if (ACPI_FAILURE(st) || tbl->header.length < sizeof(*tbl)) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_NOT_ALLOWED) {
 		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
 		return -EINVAL;
 	}
 
 	/* The tpm2_crb driver handles this device */
-	if (tbl->start_method != ACPI_TPM2_MEMORY_MAPPED)
-		ret = -ENODEV;
+	if (tpm2_acpi_start_method != ACPI_TPM2_MEMORY_MAPPED)
+		return -ENODEV;
 
-	acpi_put_table((struct acpi_table_header *)tbl);
-	return ret;
+	return 0;
 }
 #else
 static int check_acpi_tpm2(struct device *dev)
-- 
2.45.4


