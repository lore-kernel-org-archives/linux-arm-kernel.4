Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7QDlWcg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6KRdtbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=; b=c7QDlWcgoigBgD
	U52IT/o242c/+Kd08iFYoXra02bWsf7P3G/EINGtXKbAxJz4pY3UyKiQhrAskmpP4EjcwdU778CIg
	x+XMlO2QcIwJZbFasFcD5mwfew+PHDR8TJgvpLo4R0YgRem9IikKkBoOKDiiydibdhiYTULI28HmW
	LIic3ZzLRTSycofyyk9Glp9CT4VPMmI9JV4qJ/z/pGdEfeOqGBFh2E4kdzGrNohN23/B3gWUh4qJZ
	XCI/gpik1qP6mFqbuMlFpd7+H+hFN8pCXlK4Bh6zW8YEpvGaJ+1tkvG5lXvVOCuiBHkXVuze3B3ZL
	g1abq6r0pHLkR3ZlPowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlmS-0000000Bv9q-38ih;
	Fri, 13 Nov 2026 07:33:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlmJ-0000000Bv7T-0zdR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:32:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-497614c95f0so251427f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555173; x=1795159973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
        b=k6KRdtbfSJzp/Xhyvsg78pmFkOtAy07g+b47sUJxLuBV9gs4PlKZy/5EUFOrAWcLcD
         SKkyoXC960WgPOlprHEnt8Tl/iNmv57Bfvfe3et8gtBYEVINsaI9aX/X3RH0nVlGyl+G
         E4R9swhUUmTqomUZjfTRpZWla2QgrbrDugnVsnK+xA4JhRqKVU8DbP3ecYV7o8AcRPVH
         kTWL5rC2WArDk52JnlE5ivkNBhficH+FgzVUH7fu6wGTlUPZ0uO+5Uq4one46rVruOMa
         uS7umviJmoH6Gvd2fOQp9YjdLyC9sRCKN0hBlGpuRg2nX46KxRZCREnAob3V2K2QbpjN
         VF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555173; x=1795159973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
        b=FCk6BcappWjecvaerDYkHhmst+OEBRLgEO7spH0RUUZ5ZEFBsdWXlwR40xHBu7Xv88
         GTW3762zxB2jcw8UF1VjVdMfufTOGMWxmIwbNyxwsd/uEdVqCmPkeSiaGwnEhVlyaGaS
         BpAjwXy6iZhi5tQv2eDGUTyvPB4CmqJKyqsSjWqY8rKm7WunHTBFGnZJ+VdOCAtK0YfE
         AYTyt5agdGgyIS8X4UgtPx36Tni1Gj8YHzz+JL/JJ9rpXkEz1bbEwngI97NZSFxNBSbV
         ciTHYA1DRC4XJyBirsppQbuNyRYGDtBa8qVqJdrzMM2WghLw5YiI63XvYF0f+kzMk6Ps
         Xmnw==
X-Forwarded-Encrypted: i=1; AL+hErG7MoE5Nl6hLwW1E2qUmZHWi0d3qIMp0mKqiZe42sNOGBU3toV76senuOFjqmmiCCrtVEEmRLPx8VYmsGKHonY5@lists.infradead.org
X-Gm-Message-State: APuU4Z+/WSWJ1ja44gm8Rk0oEfYZMhsja+GyPEnRib786zfCMXcsThTl
	bT0IxO0llAUCbl63fbFiHuC4iVaDnJxJQyPFFM6/4Qs1yaGwUn5jZLTV
X-Gm-Gg: AYBFou3enr4fXY7Bn05gpM3M2ZHzFO9AUJDMbO52G0meWNHRSe7UBb+YfbnMZI4AQ5M
	O8JNS4x8nkvmBAsHRkXCT53+RWQjCNUhxd4A1/zHZ+9045zhPh3B9qrI5VOxmspISceml9HYG8h
	r0Z9o0eVN92T0W/C/YEXCSDeIFXdnZe/LuTjYAOy59woVdXdnvMio05FmhET8pl4URXtk1sRulT
	bcBklde7SZsppLYJuHdTNIXlaCG0ujFtDXpMTbXA+8k1w86d+4Sp5X5deChvJhKGET/RJRlH4Px
	1iiWXpLytZtt9wqbuVTAGbONAQuasOlaEPTX+hRCcNbGlKCMPZIc92L9J3nwWlxy8UPV8+xkaOh
	sdPZ2cHGTUjF9Y9EsAILGpkgEoNboYXIJ+XfNNyR7ZZ8oKwFBh9Vb4hNBK+2wezssBeT00vhF86
	laoJN6Au68MyYw0Hj67p8h7t7zuEFDXXlcNlfkjUuIEmoE1iK4PZj4/QHj4IhXQxFOP2O8WrVUP
	+ihFpC3ZCVi4dPU4raEyBWgKKDK+ugmp8p7K0FrulUibM86zQcZqS/JilQ3HM/+T9nhZFSV7fEQ
	cFbdFaCrPsNZOjG4IMoG5yxbbS5+IYAkayY=
X-Received: by 2002:a05:6000:29d3:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-49c73259d1fmr2428976f8f.12.1794555173288;
        Thu, 12 Nov 2026 23:32:53 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:52 -0800 (PST)
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
Subject: [PATCH 1/2] i2c: imx: do not carry the interrupt status over to the next transfer
Date: Fri, 13 Nov 2026 08:32:49 +0100
Message-ID: <20261113073250.1037215-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: <20261113073250.1037215-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_233255_324414_12BCD9EC 
X-CRM114-Status: GOOD (  12.79  )
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
index ccf08cd63151..1987a0fd8132 100644
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


