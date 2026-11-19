Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vuz2soqu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hl+0393y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DUHaQOoN9eliMKXTBs8DaDAMBqFWvPB/4qsL3rM7sCY=; b=Vuz2soquMr0/h6mhTnJuIfPhpb
	15ICcdFOo9+jsVYutVXD7eHigS2yp9AYCn0bKZKpfBNfDY8PyXye45gb5/RQ9JWHUJdU38H9fvhRY
	Tb25DxvaCh+hXKwXBtJ9ncp2Jleha25hSAV0QTQx+8z7D/A2tXpniTwpdk0mc9SPe9Yq63mIY+Nfe
	yOY6+PrXt2qHU6IcxApSnLhFZOrsiNcEAp7+LBwIdbYqYn1qbsIB794zI5A4T2lcEvJr37Gk3EzVI
	rPgy2A6qvG6erdmnpO1Lr1k8r9m4gEA86Wj9/rJYOMhF4ZqfAryqB5Clqzp/YyMGAKw9Qc/qtUkjf
	Dc+O2tKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1pm-0000000Bz2Z-3wvh;
	Thu, 19 Nov 2026 13:05:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1pi-0000000Byyz-3ULs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:05:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so21275355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093544; x=1795698344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUHaQOoN9eliMKXTBs8DaDAMBqFWvPB/4qsL3rM7sCY=;
        b=hl+0393yKYuCQ/m0Dd+CFjlo0DkfF1sXVoxMvcjxeUc76fHXlLvuNGsirTC8Fbzjjj
         Zn435/WHMpiHEnQFW/YrnIiogwJdCKe+0vNI5/TL5bax0IrlRAYFdDuqI1BTS7lT2fZ0
         txp5+hP4X8TXd+lMUWj+bwlrFmgxROJUJHJT/AxsVC/bYRrlTGROXRO9EWyz6739LKJ8
         EceVh7JOjR4Mpfn8qSHN9h5Eli7U+n3cdR7QWGXusvwv9mEck5guBKhKG8sCI+SK+1a9
         0jCt2EVhki/8NjiMulUUgItrxwzQeXoKsxeantEbdFdbWYpMQQ27wZHN5zRSlhLzuir9
         gZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093544; x=1795698344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUHaQOoN9eliMKXTBs8DaDAMBqFWvPB/4qsL3rM7sCY=;
        b=Ml9UX2fA7sASqIr+qMsOuC4Q8d/C4Zle/7tqeJ48e2VuxER5JxoINdZ6ICMHUTJ/bN
         nheiwe5Xl0jCW9xX71S2AiPzgsXux/PAKTtuuUz4EWS821hi1obrZ+NIHBJa/IAOZkP9
         vT3RxUIZlDOfKwJg2JhP+1GrTP5uCJ6kY29a0E5DSYucL2t4+by3/vrqnA9tVBnNskV+
         YquQL6cgxuHEIWU/g2ycVmxfp7dOEUWYObdFVVXL5xg2kMHZDsHK8Yo9X3mzMBMmoWTc
         k0aeeg5QjJu9aY1DoKLij1bSh+WQiFY8C5WLl34bC0JHRbiDoLG5zmf3sHEgR32YBKZf
         g7Fg==
X-Forwarded-Encrypted: i=1; AL+hErHtIAV6AoJDMgIJ/nRes5k99v5O96GFqzLhTr5bT3Oqm8NKqdGfU+975elAWr8PQ2rsc/RUEqSE1nx3Aj4hTQ+e@lists.infradead.org
X-Gm-Message-State: APuU4Z8dzqMJ/+y5PgKMcf5qPcgJ/OQs0nRd5aExZUC3vWlI21mA90p2
	NSHPLi0Q8IsMJkSsfjiJ8mrOMqUSLE9k43TJOkBWV6CF3AxsszhLDjAk8d54jvwp
X-Gm-Gg: AYBFou0oXrkJUOtdwYLQeWZ5DfpOqor5L5A2DjrqnyGIFwhEEW3lGPNRaYBHYqKrJuM
	v3dICJLmFtBNPp69L/ix8P5uwUGXUMXUdOLngbkK6bRzqMB81+6MYUsxK64CYe0yQyKjFWpRvKY
	L6yyiGNaXzjtIeN32G0dzNUFClFsY4MXidXg/sYqlgARMyNmgNQknbTwmaWHpqDeG4oQ3gVucMp
	yTAEw9G+lEieKomTOnSKfWd3UyimUXteu/kgOVujD3Whi7+2bO5J0dmneKVR4OOc69riZuBB9aZ
	pIV4+hXYDhQlVCy65nU5EaGbf7MXNGEmvTygVYzVyAcNY0ZyyALrGmGKAV/jDMZzvMYdra43HpU
	m6Spw1K6xEWvFsCjbt4LDHZHcJ0GzfKDLJn0WHAm+jHCCVllLpZjQQqvHTp/I3UNtkWT5YAQta3
	ZvSjH7/5ao6DjF4inrDh3w9n+H/9EBQAT3VCcxx5jovysWtu6Qy6jfNB/2W+qQjwpDyWAtxMkJ9
	kTEP/rNw4DYKUFnk+M8txAmxrFmCycaaT2a+KkiR3mklHCURwbaGTkP6PMmq/5T+bLSc0JAVWvR
	H0t4ZmOJyclkWvqqyvggrGf64XUMPzda+ac=
X-Received: by 2002:a05:600c:4e44:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb7da12957mr112752995e9.9.1795093543797;
        Thu, 19 Nov 2026 05:05:43 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm42546305e9.3.2026.11.19.05.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:05:43 -0800 (PST)
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
Subject: [PATCH v2] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Thu, 19 Nov 2026 14:05:42 +0100
Message-ID: <20261119130542.180192-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050547_781435_4A40044D 
X-CRM114-Status: GOOD (  17.47  )
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
count of 1 and no PEC that byte is the last one, but I2CR_TXAK is only
set in i2c_imx_isr_read_continue() for the byte after it, so the last
byte is acknowledged and the target goes on sending. The read fails with
-ETIMEDOUT, the bus stays busy and the following transfers on it fail
too.

Set I2CR_TXAK after taking the count when the message is then two bytes
long, as the read before the interrupt driven state machine did and the
atomic read still does.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Changes in v2:
    - Test the length of the message instead of the count, so that with PEC
      the data byte is acknowledged and the PEC byte is not (Sashiko).
    v1: https://lore.kernel.org/r/20261116124430.1358948-1-mehmet.fide@gmail.com/
    
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read" and
    "i2c: imx: keep the error of a failed read", with the M41T0 RTC at 0x68.
    A test-only hook passed the messages that i2c_smbus_xfer_emulated()
    builds for a block read to the adapter, alone and followed by a one byte
    read, with the read message starting at a length of 1 or, as with PEC,
    2. Register 0x05 (0x01) as count byte on the interrupt driven read: v1
    read 0xff in the PEC position (40 of 40); v2 reads 01 01, and 01 01 00
    with the PEC length (250 of 250). Count bytes of 0, 0x13 and 0xae read
    as before.

 drivers/i2c/busses/i2c-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..eabadeb47e2e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1095,6 +1095,12 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
+
+	if (i2c_imx->msg->len == 2) {
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0


