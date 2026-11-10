Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7C606E607
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cMXDi0uH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnR6duLN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3G3CWQIL0JbSsmfNksLi3Fp/1YxbYzf4T7l8kEzH84Y=; b=cMXDi0uH54iGA+
	WWrd32e3ZGcOsfCLfpWNjQH4qI4jNPuHu3TF4UBjgQqeHFmpyni2Q3GQGgRUIMX+l+hWoWZZX1chR
	szX7zOPrqdOToDJyUziU0k1/rxBnJwxoaQ5W/pqEP0F3uo1+CHbnCao+zpRbMtrvO2qH4JqRxDC5L
	LGa9Kaz+n4E64OzBc0v0kjUJERBfWbxVf3UK4sBWGURGCompdw1F9zl5YMo6ngksP4KHk5tvOyvSP
	7hhWOVJy46MC9czTdcdDt7D5lmvWE/Uhut+/URhAMk1lJebTqE7mgJF9sxjSkMkSGCc5YsLGqgnoU
	DJgH6PF+zU+L4Ekc5AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIb-00000002Eod-1tAx;
	Tue, 10 Nov 2026 03:13:29 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIS-00000002Egj-0u7K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:22 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4f48d91ba7dso874933b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280399; x=1794885199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3G3CWQIL0JbSsmfNksLi3Fp/1YxbYzf4T7l8kEzH84Y=;
        b=QnR6duLNeD4C4zIAxCaeNyKlfAVfwJfxEQ8vFp1Wok9JKIs2nigFoofpvVtxe1LEG4
         LNS28lHHvxrB11DU5/yMdCVniYRTWcqLeb2c3gpmU9Ss4ykqb+r5fjRTSZ4ltqPid2g2
         +1vtFDkruA0i8vW1Qc9sVpEeKwJE2S8tM7A3p4HhvkOJ+lbnl0ldkr5JXvTUcyTwyfzW
         NbSzc2/7r6pOKA/3C9mFOhUh03URJa0IezSH/ahyT/25nEzWJoZCYmasdMQRlCag7qsV
         y99owyS3cTuHxb7A7lkzQIaoL9hRBJhE2lhjZV46KnN00DcYZ1f5OvIqAbdo8vjrqDAk
         1n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280399; x=1794885199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3G3CWQIL0JbSsmfNksLi3Fp/1YxbYzf4T7l8kEzH84Y=;
        b=Ru7bwrur8HeryxO98lOiMTxaMkrMkZ7KDDnK7fMU+YihkHLdtLFF72N8ACyH30SAul
         HvPCehnfJXq/05+IBxU/ZmIK6LLKu7F+d/IuCi5GrVEf9F5Yo94lzv2uu5e0QiYnVEdI
         wHo/awaIGHztrL/lapbFylA6yXNWj1+REFiMV2Qe1jz0+FuUKoO8mRYSzCt2L+ZYFRjJ
         ki4JmK9sMb8kKaMp2yYyYxsfItYQfXRXOTXUURqm1VjF/cbhPOB7gm852rN1mRGd5/TG
         bl+cMra8vhCJ0dIKoCBAUPxFz0dz3OPdfq5biDIbmD8mJDG4W52+LzNA2wTmjwfYmK9B
         /dDA==
X-Forwarded-Encrypted: i=1; AL+hErEw5do1M1PGI7oVlcd3NG6ESF0VnkVNrx1VQIyJoDqUQzSuWTdGriClWsqBdNpbJwLPeV9s9HtDLaGR5Qvdqu0k@lists.infradead.org
X-Gm-Message-State: APuU4Z98sx4sguImhdD6E304VCjzoBWcOl/s94Tm04Jsb1FiJqqJBv4L
	lOP3r+uT+zH2RsGyWE3UEsmjjQeMNzA4AcGDy0vv8rsj4cmFToLaLOmm
X-Gm-Gg: AYBFou1EWqIUIGQrNGKkwiY7A5WUcR37JnldAsMOGtHntsxPVa0FRc96gBG8vr90P1b
	eLy48diQeKYSaIGltPW6W8Wyzy8g/Mt8UbSujRejVkraenu9Vz8Rb7bN7EssmpfYfOc2N6MCA9f
	ueU6XJf4qkeq9ijqAvewXvixHjM6FHUwOkT51pVmKFP/KW35AW0mBLZM56GQVaTqKH56xZYLbAA
	p51zfz0+SY58RuqU8i/o6e2dBg/1zJcXlFTjubuCTn9uaI+zT467mby/qfVPUTq2QtPw4IYWGAg
	YRTTG760RPdMvJqwbNXod5gL92RL7DaruOF3RuQ0pGJYyDmNnvNpMfz4T6D3fFe4DALAJ5C0Q7J
	Dk6jMsDZj56vIR7w3C6vl2F8RgwdkdB70g6ozBaUkEhY8VZo130ZQNJQnwffPrtcNzWJzlWL2BU
	AdwlEx4RR8xM8uAS3ZLCbFFoC+QJd8PGIkP35awwSzigqzJIMJ2w+XMw0f0pEus4gSxxE+vqRXK
	4i7X3jRGgrUTq5lXv0Poa5dZtWuRCmhmECjsK1NRiav7p9CbiifvSrp5D2wYI6us5RTuLOIem44
	1kUq4Nipnav8wHdJWMZD8CTamT/z22olHxKRhjtAfk45TyTv0diY7zYovmNF8Hsu9Jl1uLtNI/A
	2k8Pj5B+paYQ3nH/LDMuafJaOyEDgSsfaiFyZNXv67l7ECts9Dn+Xd7Za1qwL5IxqLcAdlVn3Wo
	FpfobtKQjEgxT5rVuSq04Zpy44CGdGg77Rp3Gh/tsDk5q93vNHEB3Q
X-Received: by 2002:a05:6808:c22c:b0:568:e61:dd02 with SMTP id 5614622812f47-5683cccaabcmr1071675b6e.43.1794280399379;
        Mon, 09 Nov 2026 19:13:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:55 -0700
Subject: [PATCH v9 06/11] serial: 8250_dw: derive RX trigger thresholds
 from the FIFO depth
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-6-3f03961dae8a@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_191320_851736_77C315C6 
X-CRM114-Status: GOOD (  21.06  )
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

DW_apb_uart uses receive thresholds of one byte, one quarter full,
one half full and two bytes below full. The generic 16550A table describes
these encodings only for a 16-byte FIFO. For example, the half-full setting
on a 64-byte DW FIFO is reported as eight bytes instead of 32, and a sysfs
request for 32 bytes selects the 62-byte encoding.

Build a per-port threshold table from the discovered FIFO depth in dwlib
and install receive-trigger callbacks for CPR-described FIFOs, including
LPSS ports. Keep the setup helper available to integrations which obtain
the depth without probing the optional DW registers. Validate that each
threshold is positive and representable before constructing the table.

Serialize FCR updates with termios and the port lock, acquire a runtime PM
reference before accessing the device, and propagate resume errors without
changing the shadow or hardware. Update only the trigger field so changing
the threshold preserves the FIFO contents.

The FCR mapping is documented in the DW_apb_uart databook, section 6,
FIFO Control Register. The existing default FCR encoding is unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 87 ++++++++++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_dwlib.h |  2 +
 2 files changed, 89 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 4a06dec6e263..6cfb7674ac11 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -1,18 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0+
 /* Synopsys DesignWare 8250 library. */
 
+#include <linux/array_size.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 
 #include "8250_dwlib.h"
 
+/* DesignWare FIFO-relative receive thresholds */
+#define DW_UART_RXTRIG_QUARTER_DIV	4
+#define DW_UART_RXTRIG_HALF_DIV		2
+#define DW_UART_RXTRIG_FULL_MARGIN	2
+
 /*
  * divisor = div(I) + div(F)
  * "I" means integer, "F" means fractional
@@ -208,11 +217,85 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
+/* The trigger is the masked FCR receive trigger field, in register position */
+static unsigned int dw8250_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / DW_UART_RXTRIG_QUARTER_DIV;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / DW_UART_RXTRIG_HALF_DIV;
+	default:
+		return p->fifosize - DW_UART_RXTRIG_FULL_MARGIN;
+	}
+}
+
+static int dw8250_get_rxtrig(struct uart_port *p)
+{
+	struct dw8250_port_data *pd = p->private_data;
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return pd->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_set_rxtrig(struct uart_port *p, u16 bytes)
+{
+	struct dw8250_port_data *pd = p->private_data;
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int fcr, ret;
+
+	fcr = serial8250_bytes_to_fcr(pd->rxtrig_bytes, bytes);
+	if (fcr < 0)
+		return fcr;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	FIELD_MODIFY(UART_FCR_TRIGGER_MASK, &up->fcr, UART_FCR_R_TRIG_BITS(fcr));
+	/* Changing the trigger alone preserves the FIFO contents */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+int dw8250_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_port_data *pd = p->private_data;
+
+	/* Each FIFO-relative threshold must be positive and fit in the table */
+	if (p->fifosize < DW_UART_RXTRIG_QUARTER_DIV ||
+	    p->fifosize - DW_UART_RXTRIG_FULL_MARGIN > U16_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(pd->rxtrig_bytes); i++) {
+		unsigned int trigger = FIELD_PREP(UART_FCR_TRIGGER_MASK, i);
+
+		pd->rxtrig_bytes[i] = dw8250_rxtrig_bytes(p, trigger);
+	}
+	p->get_rxtrig = dw8250_get_rxtrig;
+	p->set_rxtrig = dw8250_set_rxtrig;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(dw8250_setup_rxtrig, "SERIAL_8250");
+
 int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
 	u32 reg, old_dlf;
+	int ret;
 
 	pd->hw_rs485_support = dw8250_detect_rs485_hw(p);
 	if (pd->hw_rs485_support) {
@@ -258,6 +341,10 @@ int dw8250_setup_port(struct uart_port *p)
 		p->flags |= UPF_FIXED_TYPE;
 		p->fifosize = DW_UART_CPR_FIFO_SIZE(reg);
 		up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT;
+
+		ret = dw8250_setup_rxtrig(p);
+		if (ret)
+			return ret;
 	}
 
 	if (reg & DW_UART_CPR_AFCE_MODE)
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 4d32651956ab..b896dd9bebb7 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -86,6 +86,7 @@ struct dw8250_port_data {
 	struct uart_8250_dma	dma;
 
 	/* Hardware configuration */
+	u16			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 	u32			cpr_value;
 	u8			dlf_size;
 
@@ -100,6 +101,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
+int dw8250_setup_rxtrig(struct uart_port *p);
 int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)

-- 
2.53.0


