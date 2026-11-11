Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369760A2619
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=reWEwB1D;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s+xaSvAi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8CLRxjGrgnc3g9yFPsKCLb5zi7Ab6DJWbbm7vTXq7rU=; b=reWEwB1DRB9pnH
	gOXmBhayXwnN8Jd+5AzfDIbPyG2QZsXFKb6PaN8t6lX5V3fG2Amna6WF6dfZWuKBOmAeOPOaHlrej
	AbIFFKplGyqYcLqb29MgOGsc/CQ6W4z9nHALBew3myXo1tqS+W5nYfeSx8tCbVj8WI0YMth671emy
	Zag4+/uFtpdpsnt2hSS+Uf35GPh50pWtl7qn1LzD20Trg7bqzF0ykug0sfAkP94wnf2yr+FZOL1Fm
	roGBvqaI9kTjJ3qKurhaMOpBs54JJZFtTt0FVSDQLAqNgVF9b0dclBCXJ2FHpjhLNcXAn31KGLQqB
	pfArbEk8zsK2HlINIF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDr9-00000007VWj-168V;
	Wed, 11 Nov 2026 19:19:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDr4-00000007VVF-408k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:19:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so22261725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424773; x=1795029573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CLRxjGrgnc3g9yFPsKCLb5zi7Ab6DJWbbm7vTXq7rU=;
        b=s+xaSvAigaUxlQi0gnwWiGF3q5RdAZi8Wb6pXv5enc9VQLeqi0h4bdZex8WUWYWImw
         KhM9UCIEv1iFpJnZIk6/7dUG09sh+3p32ATizcZ3P6frfA+clWRZa+ZxJ4hA/RMXRPuE
         j0fx61SjuqXm4YgxYQGGEGNxsEylgh0PPVyEzOHrOcK1Si7OtxUrprMb4aeINBSwH7fg
         ykCWbXheKrDKKP+8on1+Uz/758QWqtlJ/AlGHYOOiNrt8vuA4a2Up7MlCtg4gG01icqy
         JaNzyH0/s0gc3lOuq8X6z0hL4GPsWh252X09ddwsH33vPCNq0A32fZKArZjKB13FnMAz
         PjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424773; x=1795029573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CLRxjGrgnc3g9yFPsKCLb5zi7Ab6DJWbbm7vTXq7rU=;
        b=AjkZFPEv+ZCZSswE6+Y5vaOiM2j9UCAvH73G+/8HMMqEVuDC58+aivClwLp2Q0wM1C
         m61RE/3uSHA0fA1RTkQlewvxDCIiK356eQGqiwFOxXS1szkZSD1Wr5NyaKhypxkEVRyU
         e5hpNxvL+FpmEea4DGeIXbrewWXEBp4fCdXrguq9KZr4zgBRr10qP4ow/ja6gStc4JoW
         0ciWxhnOnsnGfXvAAnq1cM8gssMi43/lNuNy0c8cqXr5hAd91A4tg9u78SaJCtNt0cQ/
         iBCFgg4EQSkQ6sZ/5M4I7v82GfryREioDSAJgv2pFCTfuz1YgIckFDIvS/pt8ZEhmpjs
         IRBg==
X-Gm-Message-State: APuU4Z+YeIg29Tg52BZ/mxLyL/0xJMxJ3TkVAGGoz4XgaaPhN/azhb3/
	ru/NW0JIRaJ6CGhfsnbvhV53LupZ3mv0N8jHBGUoCgAuRMODogOmCoaD
X-Gm-Gg: AYBFou3GZcgRcolQ7hTDUE1Qkt1vZrs5KyF4sAQy7jRP71RmDfpys+OkHAaRaXhp5GT
	biMYQ5o5ZbjxqLryEVsuHF2ERifr5i5DkcScjzClAOAaRfFSKku42a9Q+6qnIzBaBKTJaJIHhLd
	YlNnHE1gGshofbz535gTK5esvoevKIZyvkhna2ZLZ8iEwwFjDtUrelHSDyFEJmZ+Kjv3e236ovW
	i4NuJIEgOs2TAhRwGLnof/XbBVHd8pkL5u0uQ8rBqzvAFEM9yvBaNo10drWG6EsBOYcXlddPh/k
	MRUe3ETMKeD2VrFSZBYzqmiuuujJsswOWq8BjxboebthtgQ3+5oA8h+UE4EDfppWWKeUkooVt5q
	nKEXUaai/ck7yfsMu3TjLleIotN4QOx8uq/F+O7OfkfCS2KaOR8C3Zx6+3NzyUZV5bJ5ufMd1rm
	UFFAI/Yn3aoOt7BBHFFmDKuKDxsIRrI/CKDCUm2pWYWkXYkZAVRF21x7nP/82I8z7izJRt+Qn7k
	4H9Kpm0OfuT8pXbl8DIJUJWEKon3AiVxk531DPx9ps0BBl9L4VkVYc9Mop4dqbhOj5LN8Biiems
	Bsob14dIoasTErXbUyZAjkAHc/RslzeeHIR7+BnHzrOQWxb3kwtrCQRXF1pWgd5vlzqpxvTqSaE
	3/7Jh052G
X-Received: by 2002:a05:600c:3f0a:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ba091a5148mr63037045e9.0.1794424772838;
        Wed, 11 Nov 2026 11:19:32 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:32 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 23:19:16 +0400
Subject: [PATCH 1/4] serial: vt8500: Find console ports in the serial core
 state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-vt8500-serial-cleanup-v1-1-b33594a25f87@gmail.com>
References: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
In-Reply-To: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082; i=alchark@gmail.com;
 h=from:subject:message-id; bh=p/31Oy3JuvkdbBOoFFziUsr3TcuAESl+1LC0x6wy1PA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b+/eAJzGzMbv4m/V+obwQmrEr9/SZu88cLqA/fPf
 dAqqzk9q2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpdhZh+CtZE6Fknnt3ucVx9cWJgpt0ArYEB3G0BkqHRPB++qJaPIHhr8Bn199
 h3+tb8ye6vRPyab/pdz0jvTy0rpfxzrbFM6qVuAA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_111935_029142_193979B4 
X-CRM114-Status: GOOD (  14.95  )
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

Look up the console's port in vt8500_uart_driver.state[], which the
serial core fills before it registers the console, and drop the private
vt8500_uart_ports[] array that only mirrors it and gets in the way.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index a7f167a73416..6c53e108756a 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -444,7 +444,6 @@ static int vt8500_verify_port(struct uart_port *port,
 	return 0;
 }
 
-static struct vt8500_port *vt8500_uart_ports[VT8500_MAX_PORTS];
 static struct uart_driver vt8500_uart_driver;
 
 #ifdef CONFIG_SERIAL_VT8500_CONSOLE
@@ -472,28 +471,27 @@ static void vt8500_console_putchar(struct uart_port *port, unsigned char c)
 static void vt8500_console_write(struct console *co, const char *s,
 			      unsigned int count)
 {
-	struct vt8500_port *vt8500_port = vt8500_uart_ports[co->index];
+	struct uart_port *port = vt8500_uart_driver.state[co->index].uart_port;
 	unsigned long ier;
 
 	BUG_ON(co->index < 0 || co->index >= vt8500_uart_driver.nr);
 
-	ier = vt8500_read(&vt8500_port->uart, VT8500_URIER);
-	vt8500_write(&vt8500_port->uart, VT8500_URIER, 0);
+	ier = vt8500_read(port, VT8500_URIER);
+	vt8500_write(port, VT8500_URIER, 0);
 
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
@@ -502,16 +500,15 @@ static int __init vt8500_console_setup(struct console *co, char *options)
 	if (unlikely(co->index >= vt8500_uart_driver.nr || co->index < 0))
 		return -ENXIO;
 
-	vt8500_port = vt8500_uart_ports[co->index];
+	port = vt8500_uart_driver.state[co->index].uart_port;
 
-	if (!vt8500_port)
+	if (!port)
 		return -ENODEV;
 
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
-	return uart_set_options(&vt8500_port->uart,
-				 co, baud, parity, bits, flow);
+	return uart_set_options(port, co, baud, parity, bits, flow);
 }
 
 static struct console vt8500_console = {
@@ -683,8 +680,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	snprintf(vt8500_port->name, sizeof(vt8500_port->name),
 		 "VT8500 UART%d", pdev->id);
 
-	vt8500_uart_ports[port] = vt8500_port;
-
 	uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
 
 	platform_set_drvdata(pdev, vt8500_port);

-- 
2.56.0


