Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B27606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DT+Q23fg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeM7FaOf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=; b=DT+Q23fgg892jVsJwxWmwVjDSt
	pu6vDkc9eTvnkexvAQnhVDegJ1x6MnWcJyZO8G6yyld9iQMN9yKCnsTjjQBjZlu4E/5hcciVU+lPr
	/h+9oDav7jkVF0wcMxj+W9b3HbC5UtTStwqn2IMOTyv/Ki4TwRwD2qjDvHHGsgBbT2mhiNECYT1WV
	pxedCFRZK943kkcHw4Rw6Q8GBWABWYQgnpf9UCIYhyGI9o+sjpelpCVwNxMxs1bC+kDm33Rlgn7lF
	WO32ZJ3ff3V2LzRYuIySBUEujAo3w1OXHi+ID5Ja/vF+4A8E6nEal449eIsLeoIrolV6EMSOadmYH
	+4YIGS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvnm-00000002LNU-0HZe;
	Mon, 16 Nov 2026 12:27:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvnj-00000002LLU-0r5Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:27:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so8188595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832029; x=1795436829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
        b=GeM7FaOfNgOTixyXVlzsh92hP4lT9TyA0I7yWcdW9y4o3iB7DlheCRx3KpADf1MnOm
         zd6QoP1innzGMxuOcx1RhbGi0GUBDH0vZ5qn7i0SGRZvNAmHpLq/y+rZdcCN2c3iTGa5
         2Lglps/oqkkqycZakH74KR8Pv0CupVAUDQ0aEvidHgOzJpSr1aKAyp5Y9alX9nV/XkZN
         Xd5hriGXbx48J6GUJknqoBDipNvuwh/bCJYCFbUXl5qK8s83uuEwxTiyR03DEqszms9u
         KFOqqHLECORviAU8rc0AY8eDR8dLzdN0UXQd9l8kJR6evPtdoQuJ3Ysia7ZDNX4oqK/d
         chGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832029; x=1795436829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
        b=J7ifropBw7R9hmDS2ijNCNzzMJEDemu1eBpo+e3lEAQGKVJcR7Kb+IpVY0baSqkvjf
         rQr7ZgKLJpJv74VJM3mqVb2CeSfg+aiOMbKvRuollvuNnfstiTSnlsLTSk2FKtyX011W
         mqYfbeX8P8N+Sq7I6aJLHtTF71UmyFW5kQwfSaNZhLsSSuiR89ZaTwoVJcrof2wsYXmp
         dEGQLHLj6fjh7NgOt8aDYrO8EWJvIMe+zmspbNVStwbbYhPEmkElyPItHXvY47Up3oTP
         1n4DMW0+2Qi4B84HZgDj1Xrm3txEIT+7gt/CJD3qMe52X128vX/wPd+hmYLnrhlCtwEh
         slOw==
X-Forwarded-Encrypted: i=1; AL+hErGF+1kwmzE1tw3q41mntYloTtl7I5I00K/MXrbCtsEtFldj6WgbIc3qavCebyf9iWECDd3eE/0rS8DvLNA4Aj9f@lists.infradead.org
X-Gm-Message-State: APuU4Z/iuX4wMlpKc9ZjqqUCAms9rdzXuZ/v640TEnv6FVyLdkwW7NWO
	Qr3QfaNdx/8jPg8vHRBUs4m8Bgur2Dw5cQuPtr3wstU3dKr5AuuwTRZo
X-Gm-Gg: AYBFou22m9KTeALZ48Bxg7TSciqIs7ZqqcF/NXQLV/ytKGPhH7G0liGllsJv8+4BXxu
	b9j1+HFzhZUurnKU81jN5VbPP/aD2Tc1hYDF4SCyUpfuCx9jHEoitJAK+mt7TfcRM+IeOBx8RRw
	XTyCYsRiC0mZgsv8zF4ztsIuglj8kF9ddCgplv3Svwax4CkViPNXYXzu/Xu3F3vr6hFLb2IBiHT
	sR4ChKAViXfhGXC470AaDonE6wc8cnDcf+eeLjpemRwTK0aVHdNzBP0lh+FWWIvXLUZQJ9ELzsR
	CkVmshvsuKKzMbHaVdOgbQQQAop2RJhrRYcz4xUpFxRZsWwImsyFqfIMFSWKIRlIrPdfZRfOVrv
	ZNc8FdlbQlJqpIb+8Ck19YY8CKktZcFQOP2tfDt/8qC6Q1QTFcVLC3dE7k7JQl8vuaFp1jq98cw
	Zx9+RjRyYulZu1CvjwhVACL9HODblibCGNaVK3Z4J7GIwFQW3OFXkpnHIMtlDC5Jltf6z2m1Yy7
	iQzr9EcaLxQdaNvXE/tskrR7HXZ1aZpa04U6I4jhz9rFPjx5+9Ix36tYoCLAIvZjQCaBZhXIA4s
	Q1BFbzFHc368tHgFJ06f+MCON9bkkkLFXEA=
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb6ac06e5dmr82826765e9.29.1794832028780;
        Mon, 16 Nov 2026 04:27:08 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm171999685e9.2.2026.11.16.04.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:27:08 -0800 (PST)
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
Subject: [PATCH] i2c: imx: acknowledge the count byte of an atomic block read
Date: Mon, 16 Nov 2026 13:27:06 +0100
Message-ID: <20261116122707.1349139-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_042711_265047_E117848B 
X-CRM114-Status: GOOD (  15.84  )
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

i2c_smbus_xfer_emulated() sends the read message of an SMBus block read
with a length of 1 and I2C_M_RECV_LEN. i2c_imx_prepare_read() clears
I2CR_TXAK only for a message longer than one byte, so the atomic read
does not acknowledge the count byte. The target stops sending, the rest
of the block is read as 0xff and the transfer reports success.

The test for I2C_M_RECV_LEN was dropped when the read was split into
i2c_imx_prepare_read() and its callers. Commit a5d0b9e32745 ("i2c: imx:
fix emulated smbus block read") added it back to the interrupt driven
read only. The DMA read never gets an I2C_M_RECV_LEN message.

Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Reported by the Sashiko review of "i2c: imx: test the block read flag of
    the message that is read":
    https://sashiko.dev/#/bug/linux-09e3015b-fc03-4410-809b-82964cdfac9c
    
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base, with
    the M41T0 RTC at 0x68. The core takes the atomic path only after
    SYSTEM_RUNNING, so a test-only hook called xfer_atomic() with interrupts
    disabled, with the two messages that i2c_smbus_xfer_emulated() builds
    for a block read. Register 0x04 (0x13) as count byte: without the patch
    0x13 and then 0xff (50 of 50, return 2); with it the next registers,
    the same bytes as the interrupt driven read (50 of 50). With a count
    byte of 1 (register 0x05): 01 ff before, 01 01 after (50 of 50 each).

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..1a3fc245d6ba 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1283,7 +1283,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
 	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
 	 * length is unknown
 	 */
-	if (msgs->len - 1)
+	if ((msgs->len - 1) || (msgs->flags & I2C_M_RECV_LEN))
 		temp &= ~I2CR_TXAK;
 	if (use_dma)
 		temp |= I2CR_DMAEN;

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0


