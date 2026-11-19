Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572E5606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kLMa/Wkk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+hr+GcZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=; b=kLMa/WkkJ2lMdp
	hryKkA/iaWS4ea2sfOk/LyGVdJzzynPEqx9nf0xGVKurvvG4UT0nZ/A0HJ4C5PqmXM7vaRVcLcshA
	8iT4qrQQnMHS11OOWtxRlR33vHZP7mtozAbOPZ58wJIVsD19d1eyMM/9sBZQkZoWV/9BbZJMY5yfI
	dQUMJl0jjpo+vHJmO+/BQdIiaFHr/MncNTqMvOmL1+HOsPzTkwQiQgYHaaHSBqJy27Y5aYTTNFGJa
	Esm5xnvm3sBUSoxiOrdCEx5S6HoTW3zO+XFoh1Po0X5uldtLg2+2PixBQfJrkFg+IxE6ryui9mIe4
	/x9oq2ZbqiwBAclPGxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PP-0000000C6IV-1Tqe;
	Thu, 19 Nov 2026 13:42:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2PH-0000000C6Dl-06GQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:42:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e47347279so1349976f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095749; x=1795700549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
        b=j+hr+GcZycDf75BV58KR0BL26QwXlkyd9Sfbx4iSQDUvf+SQGR7JBYvgozsNgc4kO2
         fY+aVgmCdfOGc4E5wtVgI6z0LO2USVxujlaohs24cQg/7RSx8jFrueAQGZuWAo0Cz6VA
         Lw8WkvMLnwsjim+gR1TpDhhuwFqtUfQhf1pAG4OBAoVMoh7Wb97kCtvsVbUzaVz6jUNt
         cMfwI7fLocCC76l5bq8m1CBzHh0nFy+JKJcfCZPKZr/WirmiLvYjbJ+AhK42jfL6tW92
         iPAS4eXS878T81EvDXZ6Z9JV0b5pigwVT5LAsSx65FSaF9hHrUzOaPA0qXIa+5xh1ArG
         xB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095749; x=1795700549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
        b=pu+wuKl6Vqobs1qCgMrZ8XQwW3sGMtVeIHlos8rd8uMWpE+B2LiS1jLDlPpNsWN9Kn
         XNjGYd8JSQMoufHSILmuFXrkUh+sPlpnSV3LuJXn7A+YKkIPdGX/gDKb9BENIqc96eBK
         7OZKsWVj5+8NK+SoAwwrfPmezILNRO5fNXraU2A1cZyPXEAV9vso+DDpy0/N93SKhmHX
         rlcYiyVdW0ZwCZ4Rq7mvcJZ5Jk1/DOCoyxo0aZHnYqwowxDm+vlNVdM+G5HGmdOLBoaj
         bMc96FHr0rvCkvtOk/X/ataw9hhBiENtccirRKJ7HCMrev+Q5vdSuO2mcHsu5g+IoPfQ
         D5TA==
X-Forwarded-Encrypted: i=1; AL+hErEUYoTz3B3YZ6GLBcqOuNPPRr+ClvSlrl/CHABUuvvHZJmYDQgjVrWKk84f1GNBBjX+6rl1js977QkM8Ozu/1x+@lists.infradead.org
X-Gm-Message-State: APuU4Z/VMp/0EVkMkEOA79YBhZ3UMWjSY1feol12FwbI0TLcZAerEJer
	+XVORTOusW0WI66AvQRnaF2J/8//IyZ3VT85XJdHQVNLENt3Aiv5/VTd
X-Gm-Gg: AZFdTZd6SBDRbr5BmiEiuGqufk8pqd0RrKP/Z6HTvnZsLu8riVDSAWodkaJLky/9HIh
	DdbDefymewTpSF1hI/kzIbOUgIU6ZsPpM6JuuAHefaBPNwj1ELdUvQ1MoIEtvkjl2jipytNHXT1
	YX+3r/jW7niHE0+JTIhmAZ2AK4SMgfEsu8vf7f/kLIIir/5ei+EPIg1K6i4Nn/T/8GTDOSdFw6e
	ueyGL5YVXLsHV+rwzb/hN4Z/zHtN4iXCpaWiR2upw1n0fcfcxjpQ1cTn+GlXEnB3p29Wodzm9/X
	6Y6ebHbW2XpsDyeMGzsWz0AUA3wUgCr5WVyWVtllvLxCUtHq4S10Ibn34ihvoCzgIVv5jUi8nnH
	GiKNH0dYKJY3Mmg/MvWPSSr6c/YOHLlnxSV/sFfuvI6zg+NTkpryWuwXrTHFumEJpa8rxfj8BKA
	2JQom1Dy9cJdJ/2vQeyMaGiJRUysx90OYdhqZNqGMLnql5vYSBV6H3cyn2itf8qSXJ52QWK5sYF
	9CGFQhbfWZxw+o7DgG3K2apGeTSnW+OIHokfQEuoebGAarqKpgV6F9jnSjDLSXoqPzmK44gFlYR
	HstMhWkbZaIKk7fERU7CR8rRhkUWOrimPpQ=
X-Received: by 2002:a05:6000:4815:b0:4a6:bc53:247f with SMTP id ffacd0b85a97d-4a6bc6269c3mr11252717f8f.48.1795095748613;
        Thu, 19 Nov 2026 05:42:28 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:28 -0800 (PST)
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
Subject: [PATCH v2 1/3] i2c: imx: do not carry the interrupt status over to the next transfer
Date: Thu, 19 Nov 2026 14:42:23 +0100
Message-ID: <20261119134225.265242-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_054231_089424_D9B540A2 
X-CRM114-Status: GOOD (  13.25  )
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

In DMA mode the interrupt handler stores I2SR in i2c_imx->i2csr and only
i2c_imx_trx_complete() clears it. A DMA transfer that fails returns
without doing so, for example a DMA write whose address is not
acknowledged.

The stale status stays until the next DMA read. There
i2c_imx_prepare_read() calls i2c_imx_trx_complete(), which finds IIF set
and returns before the address byte has been sent, so the read returns
0xff for every byte without an error:

  i2ctransfer -a -y 0 w20@0x03 0x00-     # unused address, -ETIMEDOUT
  i2ctransfer -y 0 w1@0x54 0x00 r32      # 32 times 0xff
  i2ctransfer -y 0 w1@0x54 0x00 r32      # correct data

Clear the status when a transfer starts.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 89f2b764bbc4..f20727ffb5ce 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1657,6 +1657,8 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	if (result)
 		return result;
 
+	i2c_imx->i2csr = 0;
+
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
 	if (result) {
-- 
2.56.0


