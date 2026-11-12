Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A6606A89D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tOFqz9G1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heSrKbhJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gOHeB5d4ws3WTTlDcSY7S8wi2CUUdkygOoZR8h/O8BQ=; b=tOFqz9G1GjtW73
	RF9T62tK5w2S1wRs4dDl7N3Mfn2nX0Y8XsOWe1yY10UVUF2L3bS7TXMj8OgRPivY4jQeTkq5oGKSU
	yrvbU162tyG625fZNlHK+zQ/mF6/ozXrh+t3CkCYvtGvzT9FDNGmVuTnighyh3H9a1dXzLCz/5pYe
	WTBo+zT6tbkgKZNX4KEIuSMUeXCFCtrKwwvZdRIq6fPsL/CL0Q1Ew+uEg638sN8sWyKocSQoZz5JY
	BvsBBqaYy34j5DUfiY71raeVhZgtydEfyQ5SSykEWiF275+Z4ynPrPruGwz8SKsWXQNKAp1sU0juW
	FNYTr+Udixg3SCkWJqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWo9-0000000ASfk-2Qz6;
	Thu, 12 Nov 2026 15:33:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWo7-0000000ASeT-0QvM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:33:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so48138925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497625; x=1795102425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOHeB5d4ws3WTTlDcSY7S8wi2CUUdkygOoZR8h/O8BQ=;
        b=heSrKbhJusyKcI26wGj+o0yGmPjYcUK1J8DOKO03mfAozBWo/RjRGN8NBX4M4PSOXw
         xrBQUMK5z2Xj9AH7Uxlp+dB59S92D06omCFcu7VR3tYxAipMhrZv+GtFAwZcsF3dO9Ub
         bnMLsRwcEkAjSeaSPhuDH1oBL522aHOWpBH8yEQYj0bOKP2AbroF5raMiRNc56nDmlLW
         wbdbCU8JVQTuiI3eqGa/Ep0oWE4b4Yw9hNSaSn4082dA4vcasioDHkr3D+rlpFEI0wzE
         ObvkV93Ul9ES9KIuERk4XNfnt53FKnNrsKzcvXGo+kbt2sE6OKSaJkhEA6feoVhtg+KJ
         sRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497625; x=1795102425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOHeB5d4ws3WTTlDcSY7S8wi2CUUdkygOoZR8h/O8BQ=;
        b=puK2O0GjSeIv0IVBJ2z7zNjWQyL6uHVqx7CcABf3M/G5s+LCupih8geWo+/mtSQfOc
         kTBFtiyaLAF3cO73MLJuFXvu5yNvNBXqrw+zGKDX7f40OwtNVKz2zBON4v4xBwuY80UO
         FBGmtrnV/mJ/5sviFALiJ+kkZy0MhE3dkQPT4UlXzjoMPulNK84rBwSD3pnJZ0X7hvIe
         ZDe9b2/ZkGFoiattYq4KGfWd22UMo7QNh0AYRGYm1Yf5ZiTrqVjRt204uxyrChl0pHaA
         Zmt53/PP45b0GghJon99oB0wbQuLl3sNvZ+XufQLC4B0NZ9zKC9Q8JID24N3vAURVBe0
         FZEA==
X-Gm-Message-State: APuU4Z/a45oXnIlf/hClQiXmaTATD3vgm3yVXivleJ62NEe14EXlvP90
	ufWGHJyHtkew6lm/EZwc/fdUO5PsUQD9+hYyQvfEzMq5xb3E34A27qdS
X-Gm-Gg: AYBFou2riJI3SBwsXF/aWr7HH/VZr55ihCw/gdtgJ2RWTgnKAQFk6ltqUFHjURRN7np
	Hl+N7IOt+6TKnlhnHDQ9w9ghEklQf7v/R8q0kRtwv9m5moV32FXrNb6s5sUV3HNao7BAZyW2loZ
	yfZkUqy2EUrCo91uNwntzVPr9dDkuEgoMOMufJ6BhCSt8nufuCF1DKGiCZkcpSqWDuWVDEatmz+
	xWylSI3Hl8PgrafNfxdlaT6m7oMeqMHtNQQumGSFQ8PDAN7iSEUWqEElbt3grNZzcz0En/Th/72
	jc4t8sSt1SDfpoB97w0oD4oy1V2eHX3xELWckic4kd6ra5NPPqyl1gP5BMPx3Whwh/7reFkADQe
	PqgIq4V6TQko96Yq95pfxgsS3IZ7BxHjLkKgnWA+icoCCjzp7C+AuifR8JfcKvtW0NNV5MrjJns
	HDwuUvBhmzOBMCNKNZqsjjZt5xcDhumTuhM4Og+T1vuZiWsK4R1UpbESL6CkVf7oekoPnew6HpU
	mfrsU8AH4PX1vwxBkF7acK1/mQZ9/rRN2U03XCwojN3fxchbzaa3UZiwOnD1GrZTaJkGqD7Q2Ky
	ksIL+iEVm8/C8vwTrUte1Pz9iUGJCR/dVPz55lV6RtCLz5Rj7OfgRvtV+7Ag0loa6eHUKvsucc7
	d4IXoyg==
X-Received: by 2002:a05:600c:698e:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4ba09383e08mr115598955e9.25.1794497624825;
        Thu, 12 Nov 2026 07:33:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:39 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:09 +0400
Subject: [PATCH v2 1/6] serial: core: Add uart_console_port()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-serial-cleanup-v2-1-36b258e0c0dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2599; i=alchark@gmail.com;
 h=from:subject:message-id; bh=axSnBeslNCexms4qsSumKGe3yRSirau1N9EJqbpzpbk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veP5wMhIM9FtplyeqkXsedYffPteyhVOmmASsXyuS
 Jxn1WbLjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ63myG/1XZLH2TLTLO5O8+z5x1/HQnE88Lc87Z52/d8FRaFaR1dgMjw0ebfaE
 LKhm7D3sl7Tf//nbfL5OJzVcm3dM0OaDitTCghwcA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073347_214420_454A90C5 
X-CRM114-Status: GOOD (  15.90  )
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

Console ->setup() and ->write() callbacks need the port behind
co->index. Most drivers keep a static port array just for that lookup,
and the few that skip it read the uart_driver state table, which the
header reserves for the core.

Provide the lookup next to uart_console_device(), which already relies
on co->data pointing at the uart_driver. The core links a port into the
state table before registering its console and unregisters the console
before unlinking the port, so the result stays valid in both callbacks.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/serial_core.c | 21 +++++++++++++++++++++
 include/linux/serial_core.h      |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index b06d2649be34..683ffb4fda92 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2890,6 +2890,27 @@ struct tty_driver *uart_console_device(struct console *co, int *index)
 }
 EXPORT_SYMBOL_GPL(uart_console_device);
 
+/**
+ * uart_console_port - look up the port behind a console
+ * @co: console whose @data points at its &struct uart_driver
+ *
+ * Serial core registers a port's console only after linking the port into
+ * the driver's state table, and unregisters it before unlinking the port, so
+ * the result stays valid for the console's ->setup() and ->write() callbacks.
+ *
+ * Return: the port registered on line @co->index, or %NULL if there is none.
+ */
+struct uart_port *uart_console_port(struct console *co)
+{
+	struct uart_driver *drv = co->data;
+
+	if (co->index < 0 || co->index >= drv->nr)
+		return NULL;
+
+	return drv->state[co->index].uart_port;
+}
+EXPORT_SYMBOL_GPL(uart_console_port);
+
 static ssize_t uartclk_show(struct device *dev,
 	struct device_attribute *attr, char *buf)
 {
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..9ac1ce1c10b5 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -1127,6 +1127,7 @@ void uart_parse_options(const char *options, int *baud, int *parity, int *bits,
 int uart_set_options(struct uart_port *port, struct console *co, int baud,
 		     int parity, int bits, int flow);
 struct tty_driver *uart_console_device(struct console *co, int *index);
+struct uart_port *uart_console_port(struct console *co);
 void uart_console_write(struct uart_port *port, const char *s,
 			unsigned int count,
 			void (*putchar)(struct uart_port *, unsigned char));

-- 
2.56.0


