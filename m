Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4BA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAH4UdgT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkOZZ3xC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=; b=pAH4UdgToanM2fiIZ4qDjEAkyX
	ULCilK8xZcAbzRLaN4ZXsgyqCNWaqlo+UN7yCfUh+pPnsafQ6kSCWdZgEAymm6DIYwedcPvjJEjgA
	B+X1cg57ABp2T3dc0YsmIbrBN8u9iibgYeRjyqFO3zZL+XyFcByhh738no+IOVfES45B9zPSVUcB+
	BdoeQhHFJlmokQbTT/wnICIROgB01DCUF9beoYN42I0rEdJZEcGQDoSQdv9no0ZPMb+zxsMHZz/bG
	WWXUVkQW1QSxFpQBwrz5+DpcFAEE8qY1JvQlVqi2AvElVoW0o+MPPygTKhodhrN0SyOFPhrYOM8t1
	rIZTUUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqfi-000000006Hr-41g6;
	Sat, 21 Nov 2026 19:22:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqf4-000000005fH-3M3a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 19:22:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so23362795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 11:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288928; x=1795893728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
        b=QkOZZ3xCybwnGgKLxgAoF9rS0Vb1ZyQ5XhA2s9Lz/klIr/WvRHiv6ysAt5EXsPX81o
         35xE8VKgU1teIzZ/h6fpVQtdOeZvLic9BNDBoy2dsCybZwYk+niVVtGETq9iD1jKco0H
         RT7cRVbDHU5qIdLpYSWcD/DhtPUBxtKspqRC+ulFuWQr5nR0WM+nGxO/weVFSrK8b2bf
         DtufOAz9k908v2h8XkP6GoQo72AtrfurSxubYPH8MEo2TUNWaHxHOY12IqZb437CN30D
         aXHi8DTKXzKq+oo+YkdbfoKi1QZlCF4MaLCfLWiP1QbrC2dMyxv7rxi6Xjk/bS1JcXsj
         /nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288928; x=1795893728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
        b=n8YgM3bqZ3mdx50nTP6kGF/uu5tqBrtxQVmCjUnACOknUBSzlFx+TB+eKSd38FQEtn
         +YEXQf9Hgw888kHoyjW/N1/sO2N0MxbH+Ve3sZHAqnz9qeyOOt+42WwiKF3gjKlcUFPE
         huj2wsp6orv4q3UCX33NIUf2D0Ou6+wgmoIvzuOjNDomKj7qXnt9axrxk4r1jq10Kv8o
         dPLp2RDD5a7+G/+xi2cCFxlmO/oMzRsTGGKWxNuzYpCvYUIN6UuJqqoyQdj2W0Dx9rwd
         BH/NPDrBjo/NqKYxORu+5ZdMIcnF8QP4CZLQzQUxeh0ITYg95igg1v2mRCKUpWdPLnmy
         Y30w==
X-Forwarded-Encrypted: i=1; AL+hErEKaHF2r/zI1tUl3Z0PCEbO3iuuZY50Ek2mvs7dGT3CK5V4WfN4PNTDhYzbQpPyXaaxWJo2N2w6ZdDQy5KjP5aE@lists.infradead.org
X-Gm-Message-State: APuU4Z9rFyWNk1yP3/gqcJPezZlYAZRJTkD+yd05wD2WmGEqI6/UVBRi
	+0Bt7LTm9/5xv+mmYfLnk9o7EjSRkkoXksjc5vGM1qy+emrc2hyN89Qh
X-Gm-Gg: AZFdTZeIezZazqA7i8HsMQKrhQEtPjP64/N/mkqRcTjmkfzcTwjw3GJfyw1dlfDyldV
	xPnayzCDoyr+y9F1mWujUsV9Lx5tXaWiobrmrT7UwiSTrFelLnLRY2wkDgH0oTCB0PWTyo5eAXE
	Aeq5hhBRh/W/disaIa4bBRM7p/er7hWbgoetTsPHksF2lkQhpTaOJXRMKzdvoN/y48wAfSc75Og
	gxABSjHoKN9yTnsi1gSeNAFonRpuohQqTabuVF+gZx2fwP2CbzHwIpM5RzddPzfyhHqyfBbb/cO
	MwMNebPqUrP5lihNbAivBmP/FfCgrvbDwNU6y3+BFZQ3SFzlLXcXrTnD5S8+boST1LNIEStqmgt
	w2mwTbVjo0n0Pad5E8LIl92hzwz5rn+vwQjhGdjGoaOYnyc8neDoK+IGaLGIz2e59vvf/osN4AD
	I9H+/t0mJ4ZMZNHmk8Z/XmGuYOm/7xtMo1CPbQYbnA3Lrb/x+76nG7QMuyLeuWyKtin1WyLu84p
	uk6kw0I8y4imbOpopzstWiIdSSQmCYX3AmG8tR/vzsi70cB9DDRWh4EyJ8fdeyPj8QwHa8F3E5V
	z7uVGuPWVf74N8UABk5lYoqLPJy9b3zSJb8LHC7cmeO81vMLYnMFMXu6dafiI/fA+Q==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr160908755e9.0.1795288927966;
        Sat, 21 Nov 2026 11:22:07 -0800 (PST)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm67560085e9.4.2026.11.21.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:22:07 -0800 (PST)
From: Bramuel Barack <bramwelbarack89@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bramuel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH] tty: serial: samsung_tty: fix -Wformat-overflow warnings for clk_name
Date: Sat, 21 Nov 2026 22:21:58 +0300
Message-ID: <20261121192158.44872-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_112210_884649_856ACBE2 
X-CRM114-Status: GOOD (  11.39  )
X-Spam-Score: -1.9 (-)
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

MAX_CLK_NAME_LENGTH is currently 15, which only leaves room for a
single-digit index after the 13-character "clk_uart_baud" prefix and
terminating NUL byte. Because the clock indices (cnt, clk_num, clk_sel)
are u8 values (0-255), building with W=1 triggers -Werror=format-overflow
warnings at the sprintf() call sites.

Increase MAX_CLK_NAME_LENGTH to 17 to accommodate the full u8 range and
replace the three sprintf() calls with snprintf().

Signed-off-by: Bramuel Barack <bramwelbarack89@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d636..40a21e6825b8 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1336,7 +1336,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
  *
  */
 
-#define MAX_CLK_NAME_LENGTH 15
+#define MAX_CLK_NAME_LENGTH 17
 
 static inline u8 s3c24xx_serial_getsource(struct uart_port *port)
 {
@@ -1386,7 +1386,7 @@ static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
 			!(ourport->cfg->clk_sel & (1 << cnt)))
 			continue;
 
-		sprintf(clkname, "clk_uart_baud%d", cnt);
+		snprintf(clkname, sizeof(clkname), "clk_uart_baud%u", cnt);
 		clk = clk_get(ourport->port.dev, clkname);
 		if (IS_ERR(clk))
 			continue;
@@ -1778,7 +1778,7 @@ static int s3c24xx_serial_enable_baudclk(struct s3c24xx_uart_port *ourport)
 		if (!(clk_sel & (1 << clk_num)))
 			continue;
 
-		sprintf(clk_name, "clk_uart_baud%d", clk_num);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_num);
 		clk = clk_get(dev, clk_name);
 		if (IS_ERR(clk))
 			continue;
@@ -2326,7 +2326,7 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 		/* now calculate the baud rate */
 
 		clk_sel = s3c24xx_serial_getsource(port);
-		sprintf(clk_name, "clk_uart_baud%d", clk_sel);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_sel);
 
 		clk = clk_get(port->dev, clk_name);
 		if (!IS_ERR(clk))
-- 
2.56.1


