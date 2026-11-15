Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F187606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sSnWXr+H;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQ8d7wOe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aYL6G69BaEJMm4DnAUdFEhty32iIoI7j/HmKyks21b4=; b=sSnWXr+HU8lAOs
	QBhLMhVd4ArDCIj83TJyB13olayi956Uq0W/8BQbN2QMNgER3XOMt7S9/9smlULXkX1Nldy7cOHRJ
	PWPcqzJOK3ywNdeTEq9k+vrIdnOVaFk3ZmqQB+c2qPdOHoWS9n3B9lUoGtbuUT1dNiYtzbLZbs4vm
	LSS5bM6Dlmh2wacTDszapDiS8bTfxH5UNbCsuERYBj1KYNeaw4l7chwhts5/Dq/vSwYo1+lBANUAE
	DFsdpaHH4js6o67l8bazv9Q6UBTgyPth3uRJtshCc/bJEAwsbFoaHhKxl2XLP+EDndNfW79asESdf
	WxeuwigAp075Uk+vr+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP9A-0000000Gyb6-1IR8;
	Sun, 15 Nov 2026 01:35:08 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP96-0000000GyYx-3xBJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:35:06 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so1135815b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 17:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706504; x=1795311304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYL6G69BaEJMm4DnAUdFEhty32iIoI7j/HmKyks21b4=;
        b=EQ8d7wOeDmjBK6ISXy7KSaAolNpc4JyiUS7PMLivBb2p3tmrx7dZC3XrjmYwVoCMms
         w6N5ZyIaca9WmI6UjE8zdCZIpfnlM0TkYIMSsFaVmKKaWHg0eihFdrcVf7hUgXDFMZBo
         4xp5qfZkudIJVlCYDT+7+HfVAxfZ8AG/0iv7nJps5noD9jD7jetQidoh2xY49Z/X9TRQ
         BqWOe2V02DsFKGidFkXJOm5fvABDMpcQ/xjT499gRazXhFM+ngSsszqNC4QbmIXFGc49
         fX2YyV3EaGIPtFI4NWOOGaJD28vo9K2EW7dujdDx7ujHvwHdNto+JtJK74M0D702SWBm
         tYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706504; x=1795311304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYL6G69BaEJMm4DnAUdFEhty32iIoI7j/HmKyks21b4=;
        b=kj1aX1XLUrguu3ZpD3vrwQYpmV3MsHmTo3KVpJBiQG5dIPBuwyH9T53EvjeLjyfQF9
         R4iGOHylgYu/PlKdEzP4jqxJgeZvNQgNzhkvi9PtA72uduQLJ30flsbkKGPZSV79o8gk
         jG83mVak0XB4P/CLsrMfDv74Chq4AVJEkYxUSWphQSqCoTA5O5+Nb/AR2sXDMGFon2pQ
         9Wy3YGh+o345rCvElbLGF/4v2rdPBZBd4PADqlOk0rGhEdBIqOgkquZKWcJMvlQsmSox
         vj04S8okI9deSHPuOK9Ffd9AHq40H897rGuX+rIzptrLcPGfvXdyukMOaK2hNOemVTIu
         3EwA==
X-Forwarded-Encrypted: i=1; AL+hErHYC0/MeqS3XqXkGYeS6Y892ofNISdEkeqJriqGKAzR59ksFf+Qf13rrd0+tBbfFLAjJEzkR9fW2aqPxYDjXxB/@lists.infradead.org
X-Gm-Message-State: APuU4Z+b/ad8vFsblPFgD4kNV1I9mJClspYCxJqX3qkx3gtbn0xnZYtW
	efxlX/brp6HYL+lhbME7TOVvMZZuTQ+6xC2OCMlkAGwgKD8lfd5k5D6D
X-Gm-Gg: AYBFou0JaY/yZs0+l9GeT2qwtmZdQGyAAFkZQlA0PP6105oxaJuhQE0zVNNWk2tyCaa
	jDySY7tM66Bzf97X9m6A7cTUonDhgbFdPApTLbcEo3BwkYrzGfno4vzSlJfrNHd43rn+cTqflPb
	fTHxtbxYsReG9X6B7vcmNsnfDE1btgrzrKu+f1Mj8OC1TVeREQidLgn7o3YwXThThZd/L1fWqq5
	dxAAxtcyhSnFYyOvOhGI+7ryWV+bWi8UHguM9X75rBrzHpWNl102fm/963gqgG45Orn7Bt2/69E
	8lBLIpMsMq4ztgkOfqV2x5Z4nmqIMCa/55Wq7X5bt8AYASTw/01jvE16+KTysMx3O1T6W//0ayQ
	id4q4T7n9vrEfwFGz8ZBdAbZ01AI2bWCblxkEdlzgU1onEYU0+ODTmLIpHHEbrWtKVHEeb+gull
	1TAlBJh6c5LMHDUwYsfVRdzhO1V1v8MCCTX5krbPsTvBnOqFexKJc6gXlK9ZyZ2S3z5/Lz5IsVK
	GDGnMzw/JxK4Q7w5Bh15OzDPosEsyeOcjV2fBrMx1y6pQGs99oeuacJdHf8m1NeZJHSUjRqp+h4
	9dh23qcJlPZi7d3sgdkS0AYR/I0ijtOOhHeKUUGRtb22RQL/gQAwWDlZmGhGa03JdTjMfkel7b/
	2G5FI57RtC6zkLopyloy5dfo1MyG8cc1Qf1rX2XrXw9hSY8DQOOaomOXUadHP7GY7WUpmkEt2Hp
	YT0EgnGTleCF4dLk+QrVUypcszer6UQE4JNxd+ruUx
X-Received: by 2002:a17:902:cf04:b0:2e2:aa17:477f with SMTP id d9443c01a7336-2ee0e0b161bmr68606555ad.58.1794706503817;
        Sat, 14 Nov 2026 17:35:03 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:35:03 -0800 (PST)
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
Subject: [PATCH v3 4/4] tpm: tpm_crb: Use cached tpm2_acpi_start_method
Date: Sun, 15 Nov 2026 01:34:56 +0000
Message-ID: <20261115013456.212141-5-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115013456.212141-1-sidchintamaneni@gmail.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_173504_988784_0652B065 
X-CRM114-Status: GOOD (  20.87  )
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

Replace priv->sm and the local sm variable in crb_acpi_probe() with
tpm2_acpi_start_method across tpm_crb so the cached global serves as
the single source for the ACPI TPM2 start method.

Check tpm2_acpi_start_method at the start of crb_acpi_probe() and
return -ENODEV before mapping the ACPI TPM2 table when the table is
absent or uses ACPI_TPM2_MEMORY_MAPPED.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_crb.c | 82 ++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 44 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 4749a9183726..8585c73fb25b 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -98,7 +98,6 @@ enum crb_status {
 };
 
 struct crb_priv {
-	u32 sm;
 	const char *hid;
 	struct crb_regs_head __iomem *regs_h;
 	struct crb_regs_tail __iomem *regs_t;
@@ -138,11 +137,11 @@ struct tpm2_crb_pluton {
 /*
  * Returns true if the start method supports idle.
  */
-static inline bool tpm_crb_has_idle(u32 start_method)
+static inline bool tpm_crb_has_idle(void)
 {
-	return !(start_method == ACPI_TPM2_START_METHOD ||
-	       start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD ||
-	       start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC);
+	return !(tpm2_acpi_start_method == ACPI_TPM2_START_METHOD ||
+		 tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD ||
+		 tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC);
 }
 
 static bool crb_wait_for_reg_32(u32 __iomem *reg, u32 mask, u32 value,
@@ -166,7 +165,7 @@ static bool crb_wait_for_reg_32(u32 __iomem *reg, u32 mask, u32 value,
 
 static int crb_try_pluton_doorbell(struct crb_priv *priv, bool wait_for_complete)
 {
-	if (priv->sm != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
+	if (tpm2_acpi_start_method != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
 		return 0;
 
 	if (!crb_wait_for_reg_32(priv->pluton_reply_addr, ~0, 1, TPM2_TIMEOUT_C))
@@ -204,12 +203,12 @@ static int __crb_go_idle(struct device *dev, struct crb_priv *priv, int loc)
 {
 	int rc;
 
-	if (!tpm_crb_has_idle(priv->sm))
+	if (!tpm_crb_has_idle())
 		return 0;
 
 	iowrite32(CRB_CTRL_REQ_GO_IDLE, &priv->regs_t->ctrl_req);
 
-	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, loc);
 		if (rc)
 			return rc;
@@ -258,12 +257,12 @@ static int __crb_cmd_ready(struct device *dev, struct crb_priv *priv, int loc)
 {
 	int rc;
 
-	if (!tpm_crb_has_idle(priv->sm))
+	if (!tpm_crb_has_idle())
 		return 0;
 
 	iowrite32(CRB_CTRL_REQ_CMD_READY, &priv->regs_t->ctrl_req);
 
-	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, loc);
 		if (rc)
 			return rc;
@@ -303,7 +302,7 @@ static int __crb_request_locality(struct device *dev,
 
 	iowrite32(CRB_LOC_CTRL_REQUEST_ACCESS, &priv->regs_h->loc_ctrl);
 
-	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_LOCALITY_REQUEST, loc);
 		if (rc)
 			return rc;
@@ -337,7 +336,7 @@ static int __crb_relinquish_locality(struct device *dev,
 
 	iowrite32(CRB_LOC_CTRL_RELINQUISH, &priv->regs_h->loc_ctrl);
 
-	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_LOCALITY_REQUEST, loc);
 		if (rc)
 			return rc;
@@ -530,18 +529,18 @@ static int tpm_crb_start(struct tpm_chip *chip, u32 start_cmd)
 	 * report only ACPI start but in practice seems to require both
 	 * CRB start, hence invoking CRB start method if hid == MSFT0101.
 	 */
-	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
-	    priv->sm == ACPI_TPM2_MEMORY_MAPPED ||
+	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER ||
+	    tpm2_acpi_start_method == ACPI_TPM2_MEMORY_MAPPED ||
 	    !strcmp(priv->hid, "MSFT0101"))
 		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
-	if (priv->sm == ACPI_TPM2_START_METHOD ||
-	    priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
+	if (tpm2_acpi_start_method == ACPI_TPM2_START_METHOD ||
+	    tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
 		rc = crb_do_acpi_start(chip);
-	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
 		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 		rc = tpm_crb_smc_start(&chip->dev, priv->smc_func_id);
 	}
-	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
 		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
 	}
@@ -622,7 +621,7 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 	}
 
 	/* Seems to be necessary for every command */
-	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
+	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
 		__crb_cmd_ready(&chip->dev, priv, chip->locality);
 
 	if (len <= priv->cmd_size)
@@ -638,12 +637,12 @@ static void crb_cancel(struct tpm_chip *chip)
 
 	iowrite32(CRB_CANCEL_INVOKE, &priv->regs_t->ctrl_cancel);
 
-	if ((priv->sm == ACPI_TPM2_START_METHOD ||
-	     priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD) &&
-	     crb_do_acpi_start(chip))
+	if ((tpm2_acpi_start_method == ACPI_TPM2_START_METHOD ||
+	     tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD) &&
+	    crb_do_acpi_start(chip))
 		dev_err(&chip->dev, "ACPI Start failed\n");
 
-	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
 		if (rc)
 			dev_err(&chip->dev, "FF-A Start failed\n");
@@ -762,7 +761,7 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
 	 * Pluton sometimes does not define ACPI memory regions.
 	 * Mapping is then done in crb_map_pluton
 	 */
-	if (priv->sm != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
+	if (tpm2_acpi_start_method != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
 		INIT_LIST_HEAD(&acpi_resource_list);
 		ret = acpi_dev_get_resources(device, &acpi_resource_list,
 					     crb_check_resource, iores_array);
@@ -804,9 +803,9 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
 	 * the control area, as one nice sane region except for some older
 	 * stuff that puts the control area outside the ACPI IO region.
 	 */
-	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
-	    priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA ||
-	    priv->sm == ACPI_TPM2_MEMORY_MAPPED) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER ||
+	    tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA ||
+	    tpm2_acpi_start_method == ACPI_TPM2_MEMORY_MAPPED) {
 		if (iores &&
 		    buf->control_address == iores->start +
 		    sizeof(*priv->regs_h))
@@ -938,25 +937,21 @@ static int crb_acpi_probe(struct platform_device *pdev)
 	struct tpm2_crb_ffa *crb_ffa;
 	struct tpm2_crb_pluton *crb_pluton;
 	acpi_status status;
-	u32 sm;
 	int rc;
 
 	device = ACPI_COMPANION(dev);
 	if (!device)
 		return -ENODEV;
 
-	status = acpi_get_table(ACPI_SIG_TPM2, 1,
-				(struct acpi_table_header **) &buf);
-	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
-		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
-		return -EINVAL;
-	}
+	if (tpm2_acpi_start_method == ACPI_TPM2_NOT_ALLOWED ||
+	    tpm2_acpi_start_method == ACPI_TPM2_MEMORY_MAPPED)
+		return -ENODEV;
 
-	/* Should the FIFO driver handle this? */
-	sm = buf->start_method;
-	if (sm == ACPI_TPM2_MEMORY_MAPPED) {
-		rc = -ENODEV;
-		goto out;
+	status = acpi_get_table(ACPI_SIG_TPM2, 1, (typeof(buf->header) **)&buf);
+	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
+		if (ACPI_SUCCESS(status))
+			acpi_put_table((struct acpi_table_header *)buf);
+		return -ENODEV;
 	}
 
 	priv = devm_kzalloc_obj(dev, struct crb_priv);
@@ -965,7 +960,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	if (sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
 		if (buf->header.length < (sizeof(*buf) + sizeof(*crb_smc))) {
 			dev_err(dev,
 				FW_BUG "TPM2 ACPI table has wrong size %u for start method type %d\n",
@@ -978,7 +973,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
 		priv->smc_func_id = crb_smc->smc_func_id;
 	}
 
-	if (sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
 		if (buf->header.length < (sizeof(*buf) + sizeof(*crb_ffa))) {
 			dev_err(dev,
 				FW_BUG "TPM2 ACPI table has wrong size %u for start method type %d\n",
@@ -999,7 +994,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (sm == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
+	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
 		if (buf->header.length < (sizeof(*buf) + sizeof(*crb_pluton))) {
 			dev_err(dev,
 				FW_BUG "TPM2 ACPI table has wrong size %u for start method type %d\n",
@@ -1014,7 +1009,6 @@ static int crb_acpi_probe(struct platform_device *pdev)
 			goto out;
 	}
 
-	priv->sm = sm;
 	priv->hid = acpi_device_hid(device);
 
 	rc = crb_map_io(dev, priv, buf);
@@ -1038,7 +1032,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
 #ifdef CONFIG_X86
 	/* A quirk for https://www.amd.com/en/support/kb/faq/pa-410 */
 	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-	    priv->sm != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
+	    tpm2_acpi_start_method != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
 		dev_info(dev, "Disabling hwrng\n");
 		chip->flags |= TPM_CHIP_FLAG_HWRNG_DISABLED;
 	}
-- 
2.45.4


