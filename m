Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF5B606A881
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGxfLRE1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBZ3aABO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VvrdohMl1QV4VMTfBknOdBjsvgvvJgr+uP4Xo2NyrYU=; b=XGxfLRE1ddp2X3
	3K+Mkg5nVniBkNvgN4i47lmLEOvO4pYsVTRJud5xa2Z3toJl0AvLcuDXOEbvJNwTyRROq6ZMzxRZK
	wTzLCOgtdjNc0qneU9o+pictYFw8m4ujQ9z8chusNOYfhBjiOe/twPF7uyBrcJivzhTJf4YHRkDtv
	PEl7ZHIeFU2HfrvjUrlkULpImszvc0tBGc5AXSNrn/t6+0SQ69CGlp057pWoJPwgUewCrMEAjIt5e
	YhQlM9dSn1sXxEa04K/HVGNiMF3Sv90dIrQHXlCgtF9jmica5Q8/OLQKRVIOblVDYD3y0Y1BrdAYR
	qaAjsf0Ncmb4pSyN3RQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoO-0000000ASn1-19Do;
	Thu, 12 Nov 2026 15:34:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoH-0000000ASiN-0gaH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:33:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso28695085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497635; x=1795102435; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvrdohMl1QV4VMTfBknOdBjsvgvvJgr+uP4Xo2NyrYU=;
        b=OBZ3aABOfzV5VGr7VXME4/xdItnk+NZjvJeKVQpjExt6fBJ3ghywABE5CBKIADv67M
         A/8vXykc3QxgEYKY31D+yrTJqWve5ShxvPdxDoSjQkRX0Z6BSBNR2Mfm48pwCfOP3jaZ
         tCfKObi1UCrY4kzYAAZBv6NtVO9wNWAeQ6sq5ew7748FAusU6kp1mTXvQoyDDMdC+XYi
         6gu/Kej3HwJhU57qu/TQkEbKqsSPRSc6vN0f8iVG+BlaE/P8Ku7/9Pw8Cdem19esl+gg
         zX5ZtpK3C/DdA1RMvThg0Ygx/oFqD4AvXSfr4MDSdGy7doXsOv/O5rq+4qLuUAVZ7Suj
         t4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497635; x=1795102435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvrdohMl1QV4VMTfBknOdBjsvgvvJgr+uP4Xo2NyrYU=;
        b=KzNYqevRrARfdG5bAN8H1wQVP3YsQfrbd1/DkSNZIqecQrlemlH2kTR3yZ3XQCy5zG
         s3WzOr9yhRxvYhKhGftH8ATLiiUXMi112MH4yYGCWGCw2sK8jUGDV0hC1noAU4V71CDM
         9bVkJw5AHGWP1r9UWM5dbEcRV8gfqmI0osnkC+l9Hj2o6uuXIR7j14wi5zOvMmsoE4+I
         FdOikIgQY6ZkWfxzTs+AgpKevYQR+Kto87h7KN9wCS2lVdNg/tM1lK4rgGqHxG05dvvR
         hwFhIfpmqH+sKHpuoQwf2Tj9cej34jA5uap/vqo2i9piKXgbpCwu4vfUzokLy98/FbWU
         /87w==
X-Gm-Message-State: APuU4Z/ffMauhVPVLSZgOqowC+iuezCkrbHKxFF+rGXZ68WJMADHKEqu
	i5dgW70HCGn13G2zdE2rY4xR38cggaTXVbOXryVd9XAAqh7D5QUWJbbD
X-Gm-Gg: AYBFou1w6GJda3UTBByz41h+gwJ7iZkAD/9cgT+gZ14BGBy13yZvPWbCzTQeAAu0Waj
	gBIfLSoNaqzIiRQufx00peDnhAl1Si7iWr1Gx/Q5UGn7u3zdHMuao1GyaokTVNMxGfYmFVbyfcy
	s2XjGFGIqQ4mQD2wLAadkz9ZwWlaluTcj97Bpz70LI+4h0B+T8JKJ3ngG4RRPNqm52RspBoFsSH
	N7QaKkKZf5hMBWjnIlHNoQ1/LjmQ1y7ZXK4OUMJ9WTbkXR5WB8J+xC+JRiEJ0uYJ7P1vdrUgzqJ
	Flgo0mzbHG+tOshLLOWsL7NKv5SYN2Bx1i2QY9D5dX3jbVTX3KGG8xvyQIG7J26O4gTUV/wdwFj
	lEu0S9w8HyppNL64JZQ1qRasz9D4+xrzdL9YevV+DdWCtKOTfn2GPbWIaTRdE6LoHSFf8jjMG2o
	XT0+kK36+OIk7AkxxexJTWPE/2vo2hYBC2LjQjPlFeoWd5P0Ry4F+vv40KBCrJ0surSz9Jqyw39
	29NP0QtxKDJhkE0HK2YI4K17sq9AFxL5QtEXkBBdpyXzV+KOJzaLcZDtLouZtEsAchjCan2qqoC
	U3vsjr9GOOF1kBFSV+YbdVP3e/YFZNjEvjQHMU8QsnF2xVJKQQwbp6w0BxoRAoC5AMO6FJPkgZB
	c/ZcQDh0=
X-Received: by 2002:a05:600c:1c01:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4ba09395574mr132571925e9.35.1794497635084;
        Thu, 12 Nov 2026 07:33:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:53 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:11 +0400
Subject: [PATCH v2 3/6] serial: vt8500: Look up console ports with
 uart_console_port()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-serial-cleanup-v2-3-36b258e0c0dd@gmail.com>
References: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
In-Reply-To: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052; i=alchark@gmail.com;
 h=from:subject:message-id; bh=3liCMnx0+/nFxGsSTGfQu36lLL1bgD05zvuvM2xQkgE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9vePFvWXRnptJkmJnv8UtXvbDco7zgzAHp9aHWw6Zy
 nEV37A92zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUH/rC8L/sSa3g6x7lMwryTiW136IWf8zIrmGN2nTRQXWzZ6yUWwLD/2qp/a/
 yOLe2/fzZn/esX+xGv/XpkrhOx4NRx997H9nByA0A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073357_294866_7DF87544 
X-CRM114-Status: GOOD (  14.84  )
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

Ask the serial core for the console's port, which it registers before
the console, and drop the private vt8500_uart_ports[] array that only
mirrors the core state and gets in the way.

The helper also range-checks the console index, which makes the checks
in the console callbacks redundant.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index a7f167a73416..4abd4a8d5ef3 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -444,7 +444,6 @@ static int vt8500_verify_port(struct uart_port *port,
 	return 0;
 }
 
-static struct vt8500_port *vt8500_uart_ports[VT8500_MAX_PORTS];
 static struct uart_driver vt8500_uart_driver;
 
 #ifdef CONFIG_SERIAL_VT8500_CONSOLE
@@ -472,46 +471,38 @@ static void vt8500_console_putchar(struct uart_port *port, unsigned char c)
 static void vt8500_console_write(struct console *co, const char *s,
 			      unsigned int count)
 {
-	struct vt8500_port *vt8500_port = vt8500_uart_ports[co->index];
+	struct uart_port *port = uart_console_port(co);
 	unsigned long ier;
 
-	BUG_ON(co->index < 0 || co->index >= vt8500_uart_driver.nr);
+	ier = vt8500_read(port, VT8500_URIER);
+	vt8500_write(port, VT8500_URIER, 0);
 
-	ier = vt8500_read(&vt8500_port->uart, VT8500_URIER);
-	vt8500_write(&vt8500_port->uart, VT8500_URIER, 0);
-
-	uart_console_write(&vt8500_port->uart, s, count,
-			   vt8500_console_putchar);
+	uart_console_write(port, s, count, vt8500_console_putchar);
 
 	/*
 	 *	Finally, wait for transmitter to become empty
 	 *	and switch back to FIFO
 	 */
-	wait_for_xmitr(&vt8500_port->uart);
-	vt8500_write(&vt8500_port->uart, VT8500_URIER, ier);
+	wait_for_xmitr(port);
+	vt8500_write(port, VT8500_URIER, ier);
 }
 
 static int __init vt8500_console_setup(struct console *co, char *options)
 {
-	struct vt8500_port *vt8500_port;
+	struct uart_port *port;
 	int baud = 9600;
 	int bits = 8;
 	int parity = 'n';
 	int flow = 'n';
 
-	if (unlikely(co->index >= vt8500_uart_driver.nr || co->index < 0))
-		return -ENXIO;
-
-	vt8500_port = vt8500_uart_ports[co->index];
-
-	if (!vt8500_port)
+	port = uart_console_port(co);
+	if (!port)
 		return -ENODEV;
 
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
-	return uart_set_options(&vt8500_port->uart,
-				 co, baud, parity, bits, flow);
+	return uart_set_options(port, co, baud, parity, bits, flow);
 }
 
 static struct console vt8500_console = {
@@ -683,8 +674,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	snprintf(vt8500_port->name, sizeof(vt8500_port->name),
 		 "VT8500 UART%d", pdev->id);
 
-	vt8500_uart_ports[port] = vt8500_port;
-
 	uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
 
 	platform_set_drvdata(pdev, vt8500_port);

-- 
2.56.0


