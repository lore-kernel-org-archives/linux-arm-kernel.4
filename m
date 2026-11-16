Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4714606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2Vb/G2g;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dalqdtyP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=; b=f2Vb/G2gMecYVkUnkjCMYwcXm/
	51x17saZDJ/hjXkJAvmuP3gyYE93+4BJrOiIwQYLSMaxRoHtFal7iFqClLwDuWomZvU39mfASodY+
	CTUs/pA0qM25GhKIf75qRQ3Kc43I8UMopJ8KmSLs8hYboqBc4BDbIE5h4zi5MSVfcQL351o41uX33
	yLvjLE5ce2c+qmkCj9jb0AAQZIk2nbPNXNmNtsaDntTgspN7L+BSpQrnpvwQt2wpfuGZk6Ogj6+Ly
	wwlsWaP1zqkeL2znVif1AkUva59HILRleJX7cW7trTZvJPrZf4Myw7lS6P09kynhyIx4zvAsjspup
	ZAwl3UFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJL-00000002VZI-1YlN;
	Mon, 16 Nov 2026 12:59:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJF-00000002VKX-096R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16787925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833983; x=1795438783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
        b=dalqdtyPYkxB9lDn5hXA8Mm43MawLUxLF4xjCrZqDRtz/E8B168IYsA1dkrCVcQxRA
         9toLRMawt56Uz1ZIC9dvgdLfqiF/GrYut4/hhnKLU2XiDnxRiivqvSn7loeOEnCONHSP
         qvOdXeNFIzujkAnxVQQmS/klKIWeTRdjZbnoKN3ETkA8k3beV1jh4AQP5b7ZoJVwIKXR
         z3C0o3SceUYoeYfifXaCjtj44rKaUH5zscH5c56uhenvShhaK/xlUKeLhPU0GGkr1/Qi
         FJNs5Uh2cgiNjjsZHlPLRzoKz+Z8KmUWKrJR2qiRuLzqu2tktZFIUkjyfVoQ2TTgaVse
         nOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833983; x=1795438783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
        b=AZJ4Uxeo5t/dsUOfCRcBRtRk+Y0ewTOysILt7pv1cuB0aJqs6+0t7UzXXjebKlttBw
         57A7IsjFG5PvoTDTtqfTvS2EvwxIr3B/vw7BEpZiNyUZ6SQWUp85NVSJ2Sw0tunEjIJ5
         qfQWjj7atNwcGh0nnBFUL+0qclJVe1eKYh3A3XZcFXdmtmkwCBgn7sfbe8ccErCiilk3
         HJlWwGgTXzppeUxkTXlOKHCopJIHR/TMlV8sSNXdpRZHVFHxWr1U3CjJrIsiDwfiSVDC
         RIz8uw0EUYa3Syd6ntZGVrS7FBvvPgOXRWa8xlvIJZKqk2rzDKtGEf+AlVokUsv7o//V
         nCGw==
X-Forwarded-Encrypted: i=1; AL+hErFVwg7oA4vCvfFNEZdZGdXUzFiAF2u/dGiv9+8WehN47KJe2w8c0tWQuRDE6qpNuXSLzgrYA/jGqr8weAD1UsDZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/hUxOwNyRP05jZuC/+3z2R+gPTRtbmBkzZZ4BQdwKNEA4zD1yP
	IRgkPc5HM5jGW0WV9H8weXoamfC+QG8rQU/Yub7GEvYg90pBsh9GBTCF
X-Gm-Gg: AYBFou321wOWN4edGlvA7jMN4rt6jELfp18DMorkY7BB7M+IdlfBY9LnDwuz9aL12b+
	6DbT6H5QOkn1gG3M6WiKNBHfBCrwlG90sujH7N6aDp/2pMCD1+3hepRb0V0HuIJk39HxDgjtJqj
	/WANchV/PLE899Ix6AEJJJKrgvpXZJkvuS/JoL9x8UvhWpzREwpH1jV5NdJ/Um064nzCwAGuLiu
	ZavdAc4n6v5lOqSVGaecm9ROcoouLS7dhx7OvBDLrKz8BTG5cFCurs+ZDXOaKL2WBT77ZQ3rbqz
	INcWiGJTY88AKWgjXnNHn/8TnjLpuGBaF3gjuzLSF6HtSOPaCDlrxBvghtx9iqSD+t8fqeA1nxo
	ycj6njZje6a73iHAVFR4IDLyWIEGgjcjbNdFhHAW1QTe6j+Aw06hJ4ta2m/NPpZljaflzkXGgJw
	rNMhEJd1TKtYiUvYQSIbGYqLrIF/a87EbFRTPbgVS5zupB+1Q4Q+stv9L+0N6EZFFBbgz5wfrD0
	4Dian6PVK4RQHXJ93AWvlCm/s1sOPB1U39MW5kCLRQ5x+0XMk8rbs4L3p0T6VRWoqTsg8mfSOvQ
	ZuYfmJ+8pm2KCA2+QDc2zkNB7vk07bWPJ4s=
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr231511055e9.12.1794833982968;
        Mon, 16 Nov 2026 04:59:42 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm205471805e9.14.2026.11.16.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:59:42 -0800 (PST)
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
	mehmet.fide@screeningeagle.com
Subject: [PATCH] i2c: imx: keep the error of a failed read
Date: Mon, 16 Nov 2026 13:59:40 +0100
Message-ID: <20261116125940.1368194-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_045945_088120_0E270CE2 
X-CRM114-Status: GOOD (  12.37  )
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

When the count byte of an SMBus block read is larger than
I2C_SMBUS_BLOCK_MAX, i2c_imx_isr_read_block_data_len() sets -EPROTO and
fails the read. The read of I2DR that took the count byte has started
the reception of one more byte, and its interrupt comes in while the
state is IMX_I2C_STATE_FAILED. i2c_imx_master_isr() has no case for
that state, so the default case replaces -EPROTO with -EINVAL.

Ignore interrupts in IMX_I2C_STATE_FAILED so that the first error is
returned.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read" and
    "i2c: imx: do not acknowledge the last byte of a block read of one
    byte", with the M41T0 RTC at 0x68. A test-only hook passed the messages
    that i2c_smbus_xfer_emulated() builds for a block read to the adapter,
    alone and followed by a one byte read. Register 0x03 (0xae) as count
    byte: without the patch -EINVAL 40 of 40, and a print in the default
    case showed state IMX_I2C_STATE_FAILED with -EPROTO each time; with it
    -EPROTO 100 of 100, as the atomic read returns. Count bytes of 0, 1 and
    0x13 read the same bytes as before, and the bus works after each
    failed read.

 drivers/i2c/busses/i2c-imx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..c7fef98934d4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1142,6 +1142,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 		wake_up(&i2c_imx->queue);
 		break;
 
+	case IMX_I2C_STATE_FAILED:
+		break;
+
 	default:
 		i2c_imx->i2csr = status;
 		i2c_imx->state = IMX_I2C_STATE_FAILED;

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0


