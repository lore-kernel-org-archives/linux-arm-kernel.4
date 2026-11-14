Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534D606A885
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lAJ4YV3S;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/qvznh/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GqHSBBvuKVnGq+xQNg0Da7XlBn10HLSlZo3Xm5Uwi08=; b=lAJ4YV3SYdqnPX
	+UybbD1E+UPASG1ipPzh4y45OYFBKqG8aC/tWnm5/Jqp7IKx+Ks5WUCZBrkZjXGjTLHvZovrQ/KPu
	oHL6Op3yBU+aKaYwTkggiDxWvkREtIDcc89xMtQLkeZDWuOJzNClKhCbIvpRc78qsq+0wgSeRTDkw
	yzqef3JYsKvS1ifzroVYSvDsWxPIku46Cgg+ovSS5QvziS9Vl5aggZyzM1LlTZyRAFeFlo7zEgEhg
	n5Rzq2Gy35BM3F0l7EUYE0+RSKr2ZrcvqHxVB3wVaotCG/hAz9mlzCAIsU89cXHNOs3ZaZuHj021t
	0vS5zqfbq8/IPVEYmGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWT-0000000GgWD-0LaU;
	Sat, 14 Nov 2026 19:34:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWO-0000000GgTs-0rTZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 19:34:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso2164051a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684883; x=1795289683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqHSBBvuKVnGq+xQNg0Da7XlBn10HLSlZo3Xm5Uwi08=;
        b=s/qvznh/OVtqA9QjTqdrFjCKE2o9dYjiXQ5Z+GYdnyj58qearSgyFA2M10Gd9z5eVg
         r+DKieXTbgZvv7E65f4FlPCZDaO9uH4wX2KV9zZKD2FI2oNqsvu3CcgOId8Yj13BNmlk
         r0mA0AMvL8f9UPek1XRvopAnsIaeYtIT5G2GhYfd5oWSSGEddJnoxc1prmvHVRAXfbKd
         tjgYnRBEXnSr7UWLjy6CHAgFdLJO7Kx2vuwfUSOxDz8ghAQyLdZNr/jTOvxaRYVTcCiq
         8/iGqJfrI2pPPtFkAmG+E5OCuEYS/lb21gI3t15vzKYCNpllKxf/XUgGLH4R4MBTRpwu
         bkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684883; x=1795289683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqHSBBvuKVnGq+xQNg0Da7XlBn10HLSlZo3Xm5Uwi08=;
        b=ZtoCqbv1tlvP3H0KMzc6QaNLJw/wEAPThcIJqAXK6/Lp2BZHMfqctgNb3B8TaAGdlk
         Ffqycw73Otp14bBPbuKm4/up1QhDBIZU7suLVYDwsJRbVjeN4eiHwuQmlD0a3xHt1mOc
         KH/+bYsofOQ2vqCZqop8g7uGS8sxhZLNC8E7zPK/otbJE+CKt9LRE3XDj5csnmt1kqkq
         sNsR2bKZaioVNKuY3yVQzMMuQ/3s/mL6bk6FvauHoVS45CjuRBss3y348wlkyiAIldbD
         EUDH8fKGjt5k8EaeFfFxm56ouece2g2w02lbJ74wUYtCt7lbLWK3d9MD6ethMy/ABTCL
         hofA==
X-Forwarded-Encrypted: i=1; AL+hErGLgi0tdaWv/CDQuAhRlCYjUh82uPCxop4qF7DXngoBi/h2MhdcZex/ynWJuiBA1QJUW/WX5KAnr2vL2jR/U1tG@lists.infradead.org
X-Gm-Message-State: APuU4Z8adW0mFgjKT0ptugwZt4RqwDaNhOz5FVMWfKLfQKLCTN4EabBA
	aA0Po938YL5IkGW3hkIAq+nBjarvvgkj7ekZV/jiVv5gmmuOjiLuhNZE
X-Gm-Gg: AYBFou1Yo0mHKs/XnWu+DOBtbwCXtOSN/ve7DP0u7dmukDcagnz6BJGk2xIPvinB+Pm
	F+XNLQUxaIW1HCEBwaaK3ZcWHvI04OOJgn3YF8oaA8GgXa/HefXBBUTGsni8t3rJpIkRXuIpFWS
	gqP25qsxDevWTPse/SJIyonAouG05mttzzx4xMAHNikj9+GfFcKtCA4dcYMvJnfwSP10DQQCHLI
	Txz018U7ZcPWKyb25iRTV0FpecRpvpRc7jdBQz4Xe3fnbk58gdIXRXoLaYqydInApmKRIPjPky9
	R7q3NgkFj45PeDIdeZkOkZXAKx1OquHZ5xvTkpW4XDTJBWyt044DGHkK580HRQ7pavMPhrzvegJ
	V9ViX7sLe73Ji5ZOxUdQDLtcpojTMYtRYGTWE8R0WPBpkX4I9AbnN3ttkqosRy4DNz9VfOzSC1h
	lhL+WZruizIqM+FuAqFsuEhtvQr/WvtTRBpV/DCd+jRyigNwz7am3OhzRKPF04d1fagGhbw6jZX
	75Nq2UkXYEAuBPvC7av0fIL++7WFD+LpDHB39V40fLqc5ckUNgNTVumPaBy430sJIfMmtZ17zEe
	3rLiM22v5jjHLXvfDYBM4KtEll0hXCWlaGgn8fpXT8J5GbEl0KL81gjjfV4ESmxV7rc2ftz0vcT
	5u9WpllXuyIOSZ41uLBQiDtSUjgU0lpuRYC0xODVi7nzSi/fvgAQGfWYm+J/QJOcedeuVhd1NC6
	XzMk4SY4yzhafP+UDODFyUQje3uPezIla5dfEP5350
X-Received: by 2002:a17:90b:58f0:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b1b081887amr6439067a91.8.1794684883214;
        Sat, 14 Nov 2026 11:34:43 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:42 -0800 (PST)
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
Subject: [PATCH v2 4/4] tpm: tpm_crb: Use cached tpm2_acpi_start_method
Date: Sat, 14 Nov 2026 19:34:34 +0000
Message-ID: <20261114193434.117714-5-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193434.117714-1-sidchintamaneni@gmail.com>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_113444_275220_9200DF76 
X-CRM114-Status: GOOD (  13.28  )
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

Check the cached tpm2_acpi_start_method value at the start of
crb_acpi_probe() before mapping the ACPI TPM2 table for CRB-specific
parameters. This avoids mapping the table when it is absent or when the
device uses ACPI_TPM2_MEMORY_MAPPED and belongs to tpm_tis.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_crb.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 4749a9183726..c1c2b72459a2 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -945,18 +945,23 @@ static int crb_acpi_probe(struct platform_device *pdev)
 	if (!device)
 		return -ENODEV;
 
-	status = acpi_get_table(ACPI_SIG_TPM2, 1,
-				(struct acpi_table_header **) &buf);
-	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
+	sm = tpm2_acpi_start_method;
+	if (sm == ACPI_TPM2_NOT_ALLOWED) {
 		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
 		return -EINVAL;
 	}
 
 	/* Should the FIFO driver handle this? */
-	sm = buf->start_method;
-	if (sm == ACPI_TPM2_MEMORY_MAPPED) {
-		rc = -ENODEV;
-		goto out;
+	if (sm == ACPI_TPM2_MEMORY_MAPPED)
+		return -ENODEV;
+
+	status = acpi_get_table(ACPI_SIG_TPM2, 1,
+				(struct acpi_table_header **)&buf);
+	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
+		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
+		if (ACPI_SUCCESS(status))
+			acpi_put_table((struct acpi_table_header *)buf);
+		return -EINVAL;
 	}
 
 	priv = devm_kzalloc_obj(dev, struct crb_priv);
-- 
2.45.4


