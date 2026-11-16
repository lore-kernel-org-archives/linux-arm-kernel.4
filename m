Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dogsBdcM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olhQZZCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=; b=dogsBdcMmYOa+BlbLvAKRERMw0
	FkbZ83Vwwirw9gpharCVohdXGZqTBK0Jf27UPLDs91UTiNfeaeXuphoMfcY6BLW2Z9VtCVBCK+AKB
	9yAeFKn6RDQa4acZseaCPChQ1bYBUIcBaOzfGTpVWgLTHz+m0bXRk9u+f3ajGJV09itwyUx9c/CLR
	Q3MkKBjfrMuwKvdZHL1bDsf12snFcGIz2M65eFCvODQ3CIpNw1wBA7o2v2IvyF0U6H8h+VSAHHEoh
	o3u0hs1OHi+kwUSjidvy1MqguOwgcPjF/4LMiFNI/Zftxo4lV1c92SAXJSEsYoR5v4miN8F2tnp4B
	R6vJ/zyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw4h-00000002SFc-1Pyy;
	Mon, 16 Nov 2026 12:44:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw4e-00000002SF7-2cYP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:44:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5c14470729eso2837082e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833078; x=1795437878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
        b=olhQZZCkXMOMHlAaqn4y2hnrbVQzEjyKIc8hBkRd/1TOhAtQ5PTLRI7WKM2sR55KB4
         mQb5FVwVBPiiqX5f2sIHw1b+hFhWy1FgcXGp4pFsbht3PqGyc6jleJkAhAac8CZhu8QH
         GQHWnZ8VQrt50QB1NtAgw8QsXlo7tWgBFiaikZ2yBLbXppSD6mlWF5cV+sBzFEdMQNpP
         lvokRP/E8LvBhRBFAwSiuWZc+YWYiMYvdM2JlnZAdz2go5NNhU8iY8axwjTxZ5HcFwhX
         J8ZK3pfZ+4zponEqJARKF76aU+6FEGfTdw/Lfa8uulmGV/ah70P2Tjo7A2PXCcbFBxpV
         zFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833078; x=1795437878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
        b=FOhQsSp7tGbURCAS6jpugn6OSFmfDt95Zs4wAma1mXV2GS+iPvWh6cmfCiEQn2rRcQ
         q1vPn4ytUajb+cJ7/hx0mFh1CVnGUz7zC28AUr7sj7t6Rr7dGU4VUpxIPuu9uGo+AAWN
         OPmwDv+S2mShI4cNBImvOyUm5GFioEyCUHhgnM6sj24zIbS0tNF8EydnqkWtUr86+gul
         hKSGk2O9n8FQgOp/tYESdU1l30eOQDL1K2OQK6txYhhpP84fWzSDoY87XpueuozUcGJ9
         m0JXT8p4xYqDxvCqWOONIllbb2NTY+zpoBmzqXhfs+joP+ZOf9ZM2n1TPEkBkUbrSiLP
         /lDg==
X-Forwarded-Encrypted: i=1; AL+hErFDaBwmFSDlmM1BG/xUAJDZrfIPTT/JpqvILjf1PxhiWKyfh5Z05XOp1A/ih28uFcFKG5muGkPOuyfdHUrilNMA@lists.infradead.org
X-Gm-Message-State: APuU4Z8yLn8wlWhoslNGuSqcidGP0STSjP2iyGL4LAioxBQCAuvJyY75
	kzWzxFo8TsEXLVZmJI+nHF14nNcRBWctFuOLG4+Xa1psO9ew39taL0fu
X-Gm-Gg: AYBFou1GbbeTBfQahFxGvuPfj9rwKnSx5ADCSE3F9SoRMQEKxCTFERdNZIGFhz6HxTF
	9O/64G69nMeaTWOhjBHUU2fmDyR/4Vf7ZkeDBGkSPawKVQ2eBUz+jjt6/yViA/gvNIxRAyQUfXI
	jWhh753LYSKr3wVgnpizp5hjcBGfiWgyiAx3yCOMKHT6vo4Lr4cKT8fmEFoaLZ8xp6pNblKAzz/
	eTydRyl5M6hoMapadP1u13AnWyi127TPysaEH73o6+Aw0DIdjpzXUjka/vs90M0yQKOv/AhYzVJ
	bJ60vuJ7s2qLslZelR3nufX8FRW0+wsJJ/vF5EfvIbQ0AGN5hsTXLkweYEm7U78mACJaRL8vj8K
	vY/TFxn4iPQS8wufDuWo4HIK/btf9/YHRCPA20uRuvT+o9O45siFLixPycz2W630y3BcSW8tb6r
	Zxfa69KpHmzlLhCGzg/ro4JF1Y3SWZgm1/2IHQoSoqmhhXA8hD+rWWpIwl6yrlFgMWi5vFu0xHA
	jphZhUX2KC64873y1IlztoepTt0KuChkyDRl81qMiE0FmlysCN/eeerp5VPj44HM8FHJlIa6QYh
	BDht+nnYFJZP9qLsXv/v3yhFPqPlZwK9k3E=
X-Received: by 2002:a05:6512:3a8a:b0:5c1:5715:bd00 with SMTP id 2adb3069b0e04-5c170b1c313mr3742145e87.18.1794833078067;
        Mon, 16 Nov 2026 04:44:38 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348078sm3201870e87.57.2026.11.16.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:44:37 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Mon, 16 Nov 2026 13:44:30 +0100
Message-ID: <20261116124430.1358948-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_044440_686676_BB782055 
X-CRM114-Status: GOOD (  14.59  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

In the interrupt driven read, the read of I2DR that takes the count byte
of an SMBus block read starts the reception of the next byte. With a
count of 1 that byte is the last one, but I2CR_TXAK is only set in
i2c_imx_isr_read_continue() for the byte after it, so the last byte is
acknowledged and the target goes on sending. The read fails with
-ETIMEDOUT, the bus stays busy and the following transfers on it fail
too.

Set I2CR_TXAK after taking a count of 1, as the read before the
interrupt driven state machine did and the atomic read still does.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read", with the
    M41T0 RTC at 0x68. A test-only hook passed the messages that
    i2c_smbus_xfer_emulated() builds for a block read to the adapter, alone
    and followed by a one byte read. Register 0x05 (0x01) as count byte:
    without the patch 40 of 40 failed (35 -ETIMEDOUT, 2 -EAGAIN, 3 -EINVAL),
    after which the RTC driver could not read the time any more; with it
    01 01 and, in the second case, the byte after it, 200 of 200. A count
    of 0x13 (register 0x04) reads the same bytes as before.

 drivers/i2c/busses/i2c-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..0a59ebe70eb0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1095,6 +1095,12 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
+
+	if (len == 1) {
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0


