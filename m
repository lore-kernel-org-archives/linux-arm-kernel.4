Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA06606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w8bjUZyK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnSbcKS4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=; b=w8bjUZyKH9spsG
	/lpdSDqkPZ0Pww9Jf3KlO6VOw61OXv+lnhEDtdCLtvr+1jNbFiNmBTeLQ39bRU1fZtRyyAaMrFoEP
	i/Q6gYee7THFhSn5aY/un4p7aX9YTGByC2xTzE0vd9QhvBOB8tyuraQlLLU4pUtc7pyc8HYsjB9tk
	tLZEBWIP7UjASX1UDD0HRcIY6DMLtR4Wp/9wKMvf49f+kNlGAviSWeqqb01RcCZ4iqYhEewdbtxA/
	iV12UujowqVUpTw7kYowMWroV+Kojyg6TbqQhEngQreRspA5N/QkGe8ctyyB6OwXAkHpJe2Yuw+gb
	gagziirfvQCQSvUc6lLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIR-00000002Egi-3fME;
	Tue, 10 Nov 2026 03:13:19 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIM-00000002Ect-05tL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:15 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4e4a4d77e5bso914998b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280393; x=1794885193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=SnSbcKS4yyEBEto5k5jqZONm4lflntsvO7Cmqdos35OSOtBO8DBgjhHzzv7t/b7H9n
         DxHQTZo37C4sxouxl8SnWPlWNDLXjIZ/pU5mSaQ56SyDUEJa5cWpDxk6m2/4TLCDcokC
         zPnTBq3YXY2TEibtkE1pD4sLjCbi24QjvkuXZ/lSXUYM3Dzj7ZBT5FBf1b90eNiNekHU
         0tWLTvdSFWdczscsa4OISILbFv0YI/33jTtmyEtNlpmw5sAIZKLL/Qz0E6KsWgzehQlh
         /3W/y9vrFoOiNf9BWGEl9l05UwBpgr2QnHPqvMykPaohSo/OwvlRTYOQNNERmExO0RIT
         q/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280393; x=1794885193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=FuGHYM6T3gsobLtH9z/MKG2hJxZDYz2lx0pQwbutpZbsZxZtqGIhJDE/HQD16Khw9a
         vu/QHT1AJDdd0Uxg768Zkc9EFhZH6uC4CKmaVTRHBkBorrNcRq0LpG8QWlp0w/1yPeOq
         woHpG/s6IQUmigJU9mhGxIdeQznYiUkT3fEarGjXtVDv1UDVlgEPcv3e6x1NepQ7ACwy
         Qz6+o0wrU1eBJSsjurz7x4Fyj81U9Q+gVWt7xhPP5f9p61kog6Hgqg58bRgLniSbhHWq
         ova5zOS+vRVAnnN6Qt9bYSir/EzTniPQ9zESNuYjKon6mWiGEd0ax47lzU9EI3mGa74U
         Fplw==
X-Forwarded-Encrypted: i=1; AL+hErE6Fdzl1FP3Nl1xQ4Fm2XceT9cMMtdTfZndP/kvT9Nx28dB1r7uSRwvafVyMGeoi+fsqJkaAc9hDE9FI5lmTUzZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/X/rTBIJvvH+w7wrOuTn/tA56e33d6lL9h3nGbnvv0a3kUu3Kp
	OKxVmujpW9qCmf5E75rrwY9wHvyxujgtS0hH/Gtr5OyG7MYZfyy+8ipg
X-Gm-Gg: AYBFou1zegk8q5x9zjE+oR+GersbGcs055BymalJ/KALRoJvDueMkzKnViWAYFSAy17
	R07fXNasg1mni64P1WkL5g35dUlR6r7R61hINBJ6s0fT5okf8fdjVrkorTnFMwqejkrC7TA+mnD
	wVa4C1d/gtFjfKQ0Xqp5TG5VQ2fGx6qji95odZQX7tdMA6YPk4QN5eb48YiqFEQpPjyjQhblye+
	EBXqmIR9Cjs6wb6EhGFRKWSWK7XIVSaUpkp5hX6AI3s5AQKwciqrCRCwOMs97akAfRWuFEaeSSk
	2LKvjEhpttwZJ/AUDnJB8klN68WEBLcZ0zbWCbUxXPB3rbR4QKUWa0J2cJbXrZ0VmcwFTpJ9s1f
	smGFRrjNWeY5a4Fc79cLQQG7PpQa7NLwmv2S4NMv34B2QOrVjoEHl1iOujbEJFpeX921I34nto3
	2Y8sjTQjq7htxTieUvjuh96ZPvaJbO29HMxKSihFyioASupfLUmmCSONSV8V2qk78LpA2Q+ZDOY
	HFJK8GQbdp1ajM3DPWDdszX6E69HZ5YPt/aLirJggB7ujIz+OrYu5nmd6pIRmdwPzwefzDM5zt8
	wZ3k+N5y3TotTU5fWk/i+vtANzO5OwTb4kLo4TplZSQ/5mxvVmORfGYw8dwP5PfIRQwV8CGoulQ
	pJEdzImhv5t3DRnTeAn5zibcC61qIzqKqSBdja/0QBTBycP+nVChtYB0fOQeG2jWRX8EdmlrfD6
	Q1pp3AY6QyqMN7abwkp6y27db0kQuSQDI/I/Ioo7qkuGMFBC97QM5d
X-Received: by 2002:a05:6808:11c8:b0:568:195a:3bb0 with SMTP id 5614622812f47-568812d0fa4mr697292b6e.23.1794280392814;
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:50 -0700
Subject: [PATCH v9 01/11] serial: 8250_dw: allow port setup to report
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-1-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191314_077291_EDC09300 
X-CRM114-Status: GOOD (  18.36  )
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 4 +++-
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..8fffb1f9ab0d 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -766,7 +766,9 @@ static int dw8250_probe(struct platform_device *pdev)
 	dw8250_setup_dma_filter(p, data);
 
 	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+		err = dw8250_setup_port(p);
+	if (err)
+		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 91b3607b64e6..4a06dec6e263 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -208,7 +208,7 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
-void dw8250_setup_port(struct uart_port *p)
+int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
@@ -250,7 +250,7 @@ void dw8250_setup_port(struct uart_port *p)
 		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
 	}
 	if (!reg)
-		return;
+		return 0;
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
@@ -270,5 +270,7 @@ void dw8250_setup_port(struct uart_port *p)
 		pd->srbr = DW_UART_SRBR_0;
 	else
 		pd->srbr = UART_RX;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7191cabfb086..4d32651956ab 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -100,7 +100,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
-void dw8250_setup_port(struct uart_port *p);
+int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
 {
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index f1b4b975571a..7ace0515038e 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -350,7 +350,9 @@ static int lpss8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	dw8250_setup_port(&uart.port);
+	ret = dw8250_setup_port(&uart.port);
+	if (ret)
+		goto err_exit;
 
 	ret = lpss8250_dma_setup(lpss, &uart);
 	if (ret)

-- 
2.53.0


