Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE522606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XAvfuzbl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFRSJVWf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=; b=XAvfuzblMSkHWQ
	vNZZTYkd1KAKuChe9yToJsZZ+qlV8/UfZHsjGyLIIKz7QWrA1Fy/iicXz06yNqHg+my7X9XwvXNI9
	at2F8o2YvNjwSfdjWOMQD9W3dIQlypFQGr98psakQrwro+WeFiVyJHgsylPLJDaj0s6thf5cQhD6/
	RnW49toHOwO3S4pAgYvgFjIX3j8livP7aOGhCz0nwUSX1s7o4/IugqtLgBnqHMRHKrcVd6XbQ2Mya
	YX7hBLRsXRbwozlYHlkY4bHg4kHD2LUwORVTSwU7sQj9rj1iw1eyvy0iKrss9/WEWxTyUOCByxaYk
	5xhleq4kr14382vF0rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ0-00000002FUR-32ng;
	Tue, 10 Nov 2026 03:13:54 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIZ-00000002Emg-33pG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:28 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-4a76f63b243so1161969fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280406; x=1794885206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=eFRSJVWfD60YUW0TX3BONib0knh+0bFB2+OEl+gxF875QY+YtGjQrKdHLNT7His8uQ
         Thmcicg6f7gY64SJpXhPUzKo4zAoYxnyf7HtE7WUKrJUAKPxjIkn5FxoJYwGhfkLW5X5
         Ty5kJB+u95YY0legI3q3gDMggAzXlxYA+7ELAdbtg/XKd9vXh9CFpDNsuqf9PK5qR1GR
         o5ONE4Jwr51D6QAnS7lWUV+t7+XixIhlDDjeZEXB6r4INCn3lVfMdDE6mZWFDqA2LGim
         W0Pg0BhK0PEf9aDVjpdrVZHylZOmNF7tPR5rgAfDd1dnVbuYTF6jtp7KVgbOR7K61k/D
         5KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280406; x=1794885206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=T1qPrOGcMbi1we7LSF5gqFZmSdo4M3K9ny+l3i8hAM/sv7Oi/3TJMCgJG+Y8W5YSex
         nV7XsjKYGXOrQrL0aI4eroiUV5oqZEZFy4RsvJjpULyJ+7fUJCsIN0dFPC/JESm1DGvQ
         GmK1kzTuVHBdMzWcJ9x5Vyb7y1/56Aa1wVtLMTY+pdsksWNuxv4O/4EvZ9YgaHF5YP9c
         3HbD3UTJpDiB5x/5U1e1VMWk2jBfI/89ctB4lqWno85MGZOExciXh9IGyqyadS9ImZLb
         nA1YsC8HmG+zsbtlqQ9L4alSbJdDWy12jmkHd7DpbxmSgvNcTMSK9BJ2KFfyDc+rWsRn
         rekQ==
X-Forwarded-Encrypted: i=1; AL+hErHuH6fQb1pVo15GVtOhHNLKF2E/xqOAA6yroRfpyFWUreZodXE8s1EhJBFeLRQDF7NNV9NfgxHzZVFWf1mYewKc@lists.infradead.org
X-Gm-Message-State: APuU4Z9ss6YUVm62zSIDH/X7SSx9ICZj451OdZZpXb4CVs1I+L2PB826
	CyTLh5zyoEcJzdd4X23dIM1J1OUGUlzLqIGwfwGMhBwEpV+fITkSf+jl
X-Gm-Gg: AYBFou1Egq2jFtrMv/jzdChc+rcVTy7ah8iw+/Wd8ETVi4G0tqeW7snwikufD2ZkacC
	LDRfimuVEnmxQVnNgtXfcB0ur93tvG4y0dTo2H4xUMe9tD/IdjVrgixEtSeyP+f9gsM0Zn8nFnz
	H7GzBthFm803+1sn7uU/0Nx9JYl5NoPlF0f6O+dElG/EDGBf5x6lWdvxjvHCwCGJocoRArtLyYL
	d++4FGsQR0RdlW3WD5iaiNTZ3uqNo9UzfayLcaiHceoJ9/Yg9Z5fjGhhu5Xz1kESEHYaAf//YlV
	TsQBahcJ2f8JcZj9BdyD0NR9FMcluUVGSgwJaW5dAwhWh7E9b/UBrEFXdgjG4yjqHsajfIr3+1N
	E/h554Uo76ww5MhkxhgWbKGVwA3qrvFzwsEQFBvzp81IePyjwx8Jw4pHY/wxD2TdzYNmJM6LDdo
	gufLk7d8hWZmLEGyzOi+P0etZ4ft3PD3clSGoskcwG9p4N5emL/iyEsppTGGvtQ5e8u2DW6MOcl
	Zff7ydpMcCDFWY5vZuS2TCtaBQnQaciF5v7aSwpoNF9nh/IacXKBdMRX4eLl6eFssFa2d5STu3p
	GksRdEFuaL/+7RIVTprd40CK8eQeIQ+8+jiciDQTruUBo27gs4koTh4ptZBk6pKwb3D68LyefWE
	NMsKMngs0/hecPANeL6FPJRkmg4LeG8ya/V4bR4agO6KMiHKfedZCphZNKM0v9/8Jh0jAp4v9kO
	ioV8zOI+TEWyIz3uo+9ttEF3tqacZCi2+xKBd9OUqQ3Mh5lSlctpt1
X-Received: by 2002:a05:6808:150d:b0:521:561a:8e8c with SMTP id 5614622812f47-568813057e5mr726068b6e.33.1794280406385;
        Mon, 09 Nov 2026 19:13:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:13:00 -0700
Subject: [PATCH v9 11/11] serial: 8250_dw: configure RX trigger thresholds
 for Octeon
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-11-3f03961dae8a@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_191327_785215_B49CBAC5 
X-CRM114-Status: GOOD (  15.18  )
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

Octeon uses the DesignWare receive-trigger mapping with a 64-byte FIFO,
giving thresholds of 1, 16, 32 and 62 bytes. Its setup bypasses
dw8250_setup_port(), so it does not install the common trigger callbacks.
PORT_OCTEON also has no static trigger table, so rx_trig_bytes is not
exposed.

Supply the fixed depth from platform data when firmware has not provided
one and initialize the common trigger table before port registration.
This makes rx_trig_bytes available while preserving the Octeon port type
and register accessors.

Select DMA before filling in the default depth, as before when the 8250
core supplied that default during registration. Thus the new trigger
setup preserves which ports attach DMA and their existing burst sizes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 257baab5a3ed..31045128dcc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,21 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_octeon_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	int ret;
+
+	/* Preserve DMA selection before supplying the fixed FIFO depth */
+	ret = dw8250_setup_dma(p);
+	if (ret)
+		return ret;
+
+	p->fifosize = p->fifosize ?: data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -934,8 +949,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
+	.fifo_size = 64,
 	.quirks = DW_UART_QUIRK_OCTEON,
-	.setup = dw8250_setup_dma,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0


