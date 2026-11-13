Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1vLJyXnO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cz5NfBf9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iv34v7Pp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=; b=1vLJyXnOooI9dW
	qQfB5Uf4p+4FB6FE3Gh/k2SMc/146GyBHFnZqCTqqUlt344XaT7RWv0Y8p6jMG04T6NejNnnxAtEI
	2381mT7rzmhdQ3ilihKh4lDKWRO/mJ8u1lMIly6fkap1/0Ohqge3s+GVzWlrmm7D/a6hSqjb8tUah
	cGnvlWS6G1FEveTnsuJb3Bx9RirK6PyrrlZDBvsGQTjrVLg8W77Pjb7kTOlwcCdmKRpK8IjW5f56o
	iRI+uLv3OcsEiRvPvE2w/z8dnmFHuvj5CfsJ1rEaiNAMbIh0PQPA9jWNzoTEkfbl+JjTk5hd8rJif
	N/ddI14xXFeKL7fQ6h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlmS-0000000BvA4-3bgA;
	Fri, 13 Nov 2026 07:33:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlmO-0000000Bv8z-3L6O
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 07:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=; b=cz5NfBf9BPxN3zVcPsOryPLFLV
	bhy4J+Bi6/opuDVA33H6lAoh24lbWC62xECHE/piiHTFMZcfk7YLaiiNkBOri8mJ2giRFYdbAf4tw
	62o/Vs73x+l6nVnonLOjUi1UZzOorKMEAoOTc7Nb3NzaA0n8s4aeqeDF+wew9fIu6VwlmLdgtRb7g
	9QufQ97ik6b3VELwwBr95pORWhG6xU5OlP/kp5e4nVW9Fp/OGHbKLQTKhuQyLtMCinq7ksyeE8j+6
	RdnMxiD7YZuir6WDmdAre3fsQ1zZfEonOAq7JAZ1NMdA4E/W9k7EaU6RWiU6KYgrm+acc5nhXg/QJ
	U3vVrMag==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlmL-0000000B2QH-1y3T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:32:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so9513325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555174; x=1795159974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
        b=iv34v7PpkPKkkFCL5kLFU7/qBEnBe0qcYZ8J2Z6li3yl8C5fcsROScnlVN2K5XHlIP
         UTZTgIyw7XWNko/JpBLqCcvBL5YTVf/Nt7jx/UseNaEa7jCvD0s/uBw8QFyj2n1Nl37a
         XDntMhwrCZmsS+mHlM99P1BmUjK4GQ7rS5nTxiHneqjJYeP16hcVJQ2cFGONsuBfHSl5
         SrmlSazqPC5dSz7B/ZIBzqIWyw+nIEkIu1ufOzNW6+osOkIgPa/AIOCllzR4r2iYhlCP
         UHdVhZlVL6Q5lSqcrxJcImMNbLlATSvAoOWlEq1VlG6XZVHlB+JPh1BjAf1KMu6UvUMT
         zJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555174; x=1795159974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
        b=SgM2q+lYk0fQBu3ai5UQ6qwvoluQBCjrIkWL4IyGlh7cLW4S/zAP4EhBR9zrlZ8vsC
         CsSJVEPMWaBhnVeRe6pW+er6Gygyu5Gh2Kay1HV6Gw63ZmbfPojFkNE1J3oNlm+aBIUo
         7WVfibVh+Zmy9mTVUM4Mhjz3UOTxwqgPofKDmUqjM/5B9FDmifqM8dDuK/8LdiTjgewH
         DjGhGUtKGR4grFrG9vEN+2V/a0i2tH5MAUjpgnpW51Akr2mI5uhN/uZMYKz0sCi4CXzi
         0kn+bZhP7SFLYDdUP2fvFR+lba224uTNDzGPjooEI/kCc5e/o2n5d+tXab52L4kSTcZV
         CDhQ==
X-Forwarded-Encrypted: i=1; AL+hErFR+RdRbpxl9xfQfqZ0oxF+/ihGlRwiutFpgkiDm0ej/CddqJn7Jk3uz382rF+IiMDnRSZWedmf5DURBf5HwcM3@lists.infradead.org
X-Gm-Message-State: APuU4Z/jhKo06Y8n0Ovt/GVUh0e6GR/yejZC1Ce2HR9nVMSZwMZbshfz
	foLn2K50TqnFmH6TUqd2YfaxyDD9MI5geeMAZQsvMewkdPQAxy1tLsqs
X-Gm-Gg: AYBFou062fy5GRi01NAeR19VIFi1BnKpO966E8QMZBq6Ade3zOmA/rWc14FE8GQkyv1
	xeoPmJH0dhSWljj3bgUqjVJi63xKzBtZprtV2DWXNMdyOzo6mB2RxeJMoDkxi/GAbaWlEVE0S+E
	jQ73LEVkA6zMJ7kElxjqOrYkqKoIFuex6toEgTxL06YxrqGUs30Y3rXdopXV+Ec+hKDOj9MhZIo
	XYfpgchKKOmtApw7inCmJikBzMK6aDfKeK5798RckkfTUOzWg0o348o2ppUfkjOh4+6/5rus8AK
	QGAL+vo1mqbwmWNT8Ovf5SeCfC294Hrpz1pnUXncA86axTz73WeQoMJ//rfX8D6z0mp4w3YXWaD
	TW0hnHLQZFVrDB/lBItDp1qfeX2xRz+iSv8uOND1WPmgvzzJIHzfsSu9FV6VZbrugAj9C32tbIS
	Ywb9Img5P0jXD+Cn7zsGVhdWKAfjV4ggLmCpLqdNnFbIgCkGEZBntyuUvtJlcJ8Ehvl9P4BnpkT
	NvjKwKefzv5nSA04l2+OLE5Dbl50L1wI/xf0tfxnGj4m5mV29u6cEWb8kR3aAOKe3BU1tUZDkvj
	nOo3wv6h7Ft1rjsB6dOZ2ibx99xCqabos6s=
X-Received: by 2002:a05:6000:98c:b0:491:49c2:3b3 with SMTP id ffacd0b85a97d-49c71d48644mr3357985f8f.51.1794555174171;
        Thu, 12 Nov 2026 23:32:54 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:53 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Fri, 13 Nov 2026 08:32:50 +0100
Message-ID: <20261113073250.1037215-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: <20261113073250.1037215-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_073257_783255_F9947EA4 
X-CRM114-Status: GOOD (  13.97  )
X-Spam-Score: -0.2 (/)
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When the address of a DMA write is not acknowledged the controller
raises its interrupt and no DMA request, so i2c_imx_dma_write() blocks
for DMA_TIMEOUT (1 s) and returns -ETIMEDOUT, where the interrupt driven
write returns -ENXIO.

Let the interrupt handler end the wait when it sees a missing
acknowledge during a DMA write, and return -ENXIO. No interrupt arrives
while the bytes of a DMA write are acknowledged, so that path does not
change.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1987a0fd8132..09934f3b13ef 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1108,6 +1108,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 	switch (i2c_imx->state) {
 	case IMX_I2C_STATE_DMA:
 		i2c_imx->i2csr = status;
+		if ((status & I2SR_RXAK) &&
+		    i2c_imx->dma->dma_transfer_dir == DMA_MEM_TO_DEV)
+			complete(&i2c_imx->dma->cmd_complete);
 		wake_up(&i2c_imx->queue);
 		break;
 
@@ -1225,6 +1228,11 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 		return -ETIMEDOUT;
 	}
 
+	if (i2c_imx->i2csr & I2SR_RXAK) {
+		dmaengine_terminate_sync(dma->chan_using);
+		return -ENXIO;
+	}
+
 	/* Waiting for transfer complete. */
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-- 
2.56.0


