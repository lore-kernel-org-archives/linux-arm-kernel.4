Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F2606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w39/kk2F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXgxK+eA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=; b=w39/kk2FKn+2fu
	i7nvSzd1HEGt32+Vp+33g28RVZG/4ELzfbe+QSn0vtUXkEyodhkF6kJRPTCINFvjtszKOHK8hO7xO
	pyde4ZiQG+xi6WYHIDgTPryEy+t/ENrui+S1OvPiDdPZo/ZBTqDXTUYlfvJRY5tZpexIkmXJllh5P
	iSOh8tyJhUWtuzN9MJ0iCxSMcV5IHz3ZuBWdP7OUdnVRAdD7m5qMr0GSY/AI12xPaX+FjlurZHMpS
	ZiiHP8ia47kOfQHs49pYaOTwsQb6xTiuxV4VBR6GSPooHZWt+xxZkOEoqeTTw5Pg31LhVxuOpwYza
	9uIkFMQUYnupu/RWRS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PP-0000000C6Ix-1yix;
	Thu, 19 Nov 2026 13:42:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PI-0000000C6EV-3bvW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:42:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-490d59c3edaso691981f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095751; x=1795700551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
        b=jXgxK+eASXrP+dpam7YQMEX6Zwud2AckJcMVdVQWUhW845o5tKRG216lNvf8GtzXuR
         wENcDSLSiE/XJ6X0Vyo1+cRaPo+gF6tD9PQL4nCxQx0wxwjz1ObIK/LMeXgR+TsZjL/J
         YteSl/X+JCMNS8+bEPlfRcbZB+SIuVLY4yOuyRxmQQ+NP15oNqjFzyZwHY450vBOWcIo
         /WOfYaxOLAtIOs33/uX/QFIMDtsPZrBF0JWUTK8TVRWs0EXNmUC77rpXgsABtGSozubd
         c5eDeJfAia1NTe7FYVxwGSBetf4fUoOlUBgXz+WHexHbJ6sdUV/A1P9VbLyDlfk6FA0Q
         duEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095751; x=1795700551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
        b=r0tO0FCIl6dmL+cA/2rYLiERrA1FbLKGvuQYxjmP94afFUifwsRmquv+/WLvLVceWw
         U9lUqmdlsEFzjJnwfRtIf831D/OTz67VC5I8oDPcVH0uH1gBkwk0H3DNqs8MIq4e3z4b
         4EF76g4XSan2wrwb/qNlZN70SicYXGcTa3NcYVsomY6n88MHARMtnaOI5bF7k6Rjzarh
         yjYZBe2hp/4tEJJlHLbP7GfFAi3vFt+OcsjwyHLqvn1GRK6+ylQ2nJbbwPWUyb2d9tai
         9ENmnyrT/pP6hTk2Sk3Q5Nw/MwnOANCUM8o3E2h62KVLt/kaZLDVMDXPrqjddh5FGrfl
         P8sQ==
X-Forwarded-Encrypted: i=1; AL+hErGR3YWVE63VuuqvxsR8k1LLat7evgWB3wrI1Jg5maAtd+uCnRw4eug1EfLOffYqdey9sh3YwEdXaLp0G34qeQaT@lists.infradead.org
X-Gm-Message-State: APuU4Z+s49bLCxwFLzVd7ETpIxZb4EODK/f9uuuKmL6hl1XDKwP1yPiI
	YGn6Qqp9+jViS6z5sMvDDCfAotf5qjvQfepcZrnf/FpU6aVUFCgWP2eN
X-Gm-Gg: AZFdTZer1MoynR0KaePQDWX97unsrCaHhO8ERPxyyA5TBHImsoZP1sWLj9kf0Y6UiXA
	w17daeE6MlK3yNrE+wgFT8dvyMnVsLjA4ixEwdKMAmigzdokQMDtx7sgCJoO9Ez48pHbZO0D6vA
	AcZnBOAlFkatsRjzzEGWNNXcpgfoNlu4mLe4uv9+i5H5qvaMaaefRrwhEyJiI4ECTAEYe7q3Qkx
	3uqfDlO+sijtkAmSzWYieC4852f0NUsN65BRpGKGM78n0VvFeWQvWSutRpcwhFz6nwSC+jT3iy2
	dTnlEIcVwORdrhfuUze8zbPsZze93IaXKyH+WgNwx1aBLoZKVjQZj1YTd5xFM+9Nrin+QwMKvBa
	RqikBnAQH8HpY+gNY7Vsmda9KYuk9lElxnJmUAqxHN3Ncafa3KwrO4CQfnPWEgKT+ongQhg2GLM
	RX7p1yf9SLdpyO6hVuC3uGVBgkZfJ3twIqjUn9W26jK7B2TeQHHKKXfiQ9Kuh2ZNUlwyRfk81N7
	pD7rF2tVA9zmmmzi6c7VBDHEx/vmeXifVWqJL5+TsBcxtLOu45yAYsHbFJhapsPusBdmzJB9ESB
	5iyrr1ByEnd5nMpmg2oKT/P64GC/udo2y7o=
X-Received: by 2002:a5d:64c4:0:b0:4a8:647c:f962 with SMTP id ffacd0b85a97d-4aa573ee4c2mr3035038f8f.23.1795095750641;
        Thu, 19 Nov 2026 05:42:30 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:29 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 2/3] i2c: imx: unmap the DMA buffer when a transfer is terminated
Date: Thu, 19 Nov 2026 14:42:24 +0100
Message-ID: <20261119134225.265242-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_054233_038375_2F98DDC5 
X-CRM114-Status: GOOD (  15.79  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The buffer of a DMA transfer is unmapped in the DMA completion callback
only. When the wait for the completion times out the transfer is
terminated, the callback does not run and the mapping is never released.

Unmap the buffer where the transfer is waited for, after the transfer
has completed or has been terminated.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index f20727ffb5ce..fbfabceb29ac 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -469,11 +469,26 @@ static void i2c_imx_dma_callback(void *arg)
 	struct imx_i2c_struct *i2c_imx = (struct imx_i2c_struct *)arg;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 
-	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
-			dma->dma_len, dma->dma_data_dir);
 	complete(&dma->cmd_complete);
 }
 
+static int i2c_imx_dma_wait(struct imx_i2c_struct *i2c_imx)
+{
+	struct imx_i2c_dma *dma = i2c_imx->dma;
+	int result = 0;
+
+	if (!wait_for_completion_timeout(&dma->cmd_complete,
+					 msecs_to_jiffies(DMA_TIMEOUT)))
+		result = -ETIMEDOUT;
+
+	if (result)
+		dmaengine_terminate_sync(dma->chan_using);
+	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
+			 dma->dma_len, dma->dma_data_dir);
+
+	return result;
+}
+
 static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
 					struct i2c_msg *msgs)
 {
@@ -1192,7 +1207,6 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 					struct i2c_msg *msgs)
 {
 	int result;
-	unsigned long time_left;
 	unsigned int temp = 0;
 	unsigned long orig_jiffies = jiffies;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
@@ -1217,13 +1231,9 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	 * The first byte must be transmitted by the CPU.
 	 */
 	imx_i2c_write_reg(i2c_imx_addr_byte(msgs), i2c_imx, IMX_I2C_I2DR);
-	time_left = wait_for_completion_timeout(
-				&i2c_imx->dma->cmd_complete,
-				msecs_to_jiffies(DMA_TIMEOUT));
-	if (time_left == 0) {
-		dmaengine_terminate_sync(dma->chan_using);
-		return -ETIMEDOUT;
-	}
+	result = i2c_imx_dma_wait(i2c_imx);
+	if (result)
+		return result;
 
 	/* Waiting for transfer complete. */
 	while (1) {
@@ -1298,7 +1308,6 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 			struct i2c_msg *msgs, bool is_lastmsg)
 {
 	int result;
-	unsigned long time_left;
 	unsigned int temp;
 	unsigned long orig_jiffies = jiffies;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
@@ -1321,13 +1330,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	if (result)
 		return result;
 
-	time_left = wait_for_completion_timeout(
-				&i2c_imx->dma->cmd_complete,
-				msecs_to_jiffies(DMA_TIMEOUT));
-	if (time_left == 0) {
-		dmaengine_terminate_sync(dma->chan_using);
-		return -ETIMEDOUT;
-	}
+	result = i2c_imx_dma_wait(i2c_imx);
+	if (result)
+		return result;
 
 	/* waiting for transfer complete. */
 	while (1) {
-- 
2.56.0


