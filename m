Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647D606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tTlLmR3r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXbSLkYR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=; b=tTlLmR3roIdqfzxdJ/zH8Y7YPn
	TJdSUBlVhqYmwrtVZSEH9m6xHpr9rmWnVSLXZI/ZFJDFi5gUaa+5E+N4A9t0EOo/mA0VVTLiq3ibk
	OzZJcgkO6YFuV3l0SUNaB0Vyrjc09j1zCbYuhX0gcrT0obKNXUU0IqcVA0ogyzaWLY+oQ1OIg+zd0
	URdRvRCNxCrOTbg7UolV2raz/mEHrAcotRPH7wCzUJO1wuFg92NM1HEJ5/S8T3xQngGE79Kze/Sdx
	BGLho78LGBsk8NY7Axr7ZX9v4ZtqnqNUaWXrnpsbRr6Jg9r6MQidsEJuT+4yeQkbns7abZ5oIhX4l
	2QP9H7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp5g-0000000CSdS-3xjJ;
	Fri, 13 Nov 2026 11:05:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp5d-0000000CScV-2OQU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:05:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so8706635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567903; x=1795172703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
        b=TXbSLkYRjwNmnZI2YqUDX3fQzfxehKfl86MkJ+pEkTSZbLPISfBN2OEJvwxwHzxSo6
         PoKyqECVBfIcJO9O3+GwUok0wfPOtiMvemYl89xjfgazuL3FP1aSXB5H/W4u/+flItR6
         GKbZHXaRXZtUAz5kUC5xfuRrW5GXRA1Be5u4T8uQvK69Av8vvkOJiIEok0NJeIhjDPcB
         vDK5hBib1F8PfEd0IaI8eV13wx8ZZAQHN++HZuySRPMEZTglPHMH27ua41E5/Pn1n0js
         dfXIg/R1rxWvAwDV9pDSHImUSMg5w5DAwlMMgMb0AgNojutQsEsr+CyK1iBaahzQnZsP
         wFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567903; x=1795172703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
        b=yELQF2Jqn7nVNOR+j5mJ24Vb2O7canH96lASYW/e+H2X8nhdTHdl8mhIkSFIHd8prb
         G+JY7sdt1ekt2mvssppekh+xT0ILjQ0AkoL52TRXwaTfuzIRkEuNkmT3G2ROnLNHDHcI
         hVmF8wvRX/iHU9Xkm+88NZQ1NqkFUdCQ+Fwo+AKkLNjkA8HUVi3BA+FcQE97WyeLamgg
         6Ni2xribk3VsTP811yzvOYqKmycmR2sOI8KX2vuDT8daGOPAPYvrrxqbH/KkJz3syZNj
         E0CFQykS/3/rpWTNwtT8Y+wwckzs/RarpZf+Ps/TVHKVZ6FPupvw9Al4mmhMbp0gR4XK
         es7A==
X-Forwarded-Encrypted: i=1; AL+hErFcLzP2ihfhkuCvjq+dQcEPdQ8qakcJIJrrTeP/7RQhyel4qgw42L+Ok9SoYV/4G5IOYQq8Q3NCTu6+cqdxziqQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+kVaCmdAM6BMKshYuVy69uMXtmet8e3pHodaYlDiT753tXQllq
	G3uqvrZsncLj3IEKIzDLapUv5CohY/fZC8GIbZq/bUqa1/6hP1fm4dMv
X-Gm-Gg: AYBFou1T5oed7bU/kiReP/rN2F+rFksYOu3uXKYLPE9N0jXaU93cp8JCCjtCjjn9QK2
	mo5tpnLBzQJTPDO0Xv0YDf25CuIoiXrSeehoaI0BfR8moJaOavw9fKH9HtKg4dkyZrhQnvyPaf9
	XQTAOZ79PiDE9US1UtuQ5IrxmtrjmdGDhd2hfAuzCvHlTloAgQ4LhxBVg/99u3BcouRglS8UM5F
	cBpSgk4jkpPLqi/ArMjv+JenNRPR4yvO7Rg7ZL9jvv5ifXujzJN0ysD+uhCg1x3mfVK77LB9eAO
	npSLwo05ps5D/RwjnWZ4Tmv0phrnkRIGiYZzmuY7sTrYCuO+rUsMJ7/rgdwFrN3fGf9ydBxLVVR
	vmGrI9XWUzg0XgFHrr8CxR9+m8W7S1AiIzymUj8yoa3wAA/Da7oxbRuAmz/x6IehkhNV57HRzF5
	x0iG0duLdBdWe6n0DReeDIWozvExvYsU/UZdpT/0wHAZdOLmfVZi1ZsMH8pOK052yWOety9Z/hX
	Wh89JAROMXtl38b8ZyGGdziqppjQCS6QkAC8uOpekwuRCXkAZYivmCwXBBkHJSYHBJJ99dr1BwZ
	IlQdeHAOCw2hLUu7T4zCMjvfeMgwKqjplS0=
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr43197405e9.1.1794567903271;
        Fri, 13 Nov 2026 03:05:03 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm57515955e9.15.2026.11.13.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:02 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx: test the block read flag of the message that is read
Date: Fri, 13 Nov 2026 12:05:01 +0100
Message-ID: <20261113110501.1142036-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030505_626009_BD5375B1 
X-CRM114-Status: GOOD (  15.63  )
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

i2c_imx_xfer_common() decides between the DMA and the interrupt driven
read with I2C_M_RECV_LEN of the first message of the transfer instead of
the message at hand. A block read of DMA_THRESHOLD bytes or more that
follows another message is therefore done with DMA, which reads the
initial length and does not look at the count byte.

Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
Reported by the Sashiko review of another i2c-imx patch:
https://sashiko.dev/#/bug/linux-f62df5ed-ad96-43f2-872a-ae2c0100b73f

Tested on a Colibri VF50 (i2c0 with DMA) with a v6.12.117 kernel that
carries the i2c-imx changes of v6.13 and later as backports; on this
base compile tested only. An I2C_RDWR transfer of a one byte write
followed by a read with I2C_M_RECV_LEN and an initial length of 16:
without the patch 16 bytes are read and the count byte is taken as data,
with it the count byte is evaluated (here -EPROTO, the device answers
with 0x25).

The line is from v6.13, the patch applies to 6.18.y and 7.3.y.

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..9abe0a26c877 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1713,7 +1713,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			msgs[i].flags & I2C_M_DMA_SAFE &&
 			!(msgs[i].flags & I2C_M_NOSTART);
 		if (msgs[i].flags & I2C_M_RD) {
-			int block_data = msgs->flags & I2C_M_RECV_LEN;
+			int block_data = msgs[i].flags & I2C_M_RECV_LEN;
 
 			if (atomic)
 				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0


