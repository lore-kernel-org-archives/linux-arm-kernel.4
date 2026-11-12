Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216DC60A5BCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VjY5C6Aa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BR0324SQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L1LMY5qyBag2HeM/ukaz5enhzW6oSXExQCIV3gTZALI=; b=VjY5C6AatrDs23
	HTbsF6hsUhpqPOZGzvnt3eTUNRnmZgmhwl/sQB59B1idB5TTSDNiPMyVDRqMonscb1VZNRWhs+YzB
	wTFT81RFvWxKEKMeaAhVMvo6fvMFdhOT0q0+B7zAUoiVRtUHTw3Rgn3Y6wjmfs4r7QeULbuZL08Po
	RwQVyVdU5+ZE3fxYyaEBpGwCb0NLHn35LxWSH8aXHlf24MeTzlBpr8mDUmFmor6NUrYqs0b0UP6ui
	PWl81NGwn/zzgwAmBwnZjzA8tXHPHxVVUhNn+Zw2AEcYO9rv/pjEBAVl06SfrEOA4CxQIfo0pgMe0
	ByelIZkUMIeeFC6QaFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoG-0000000ASim-3pan;
	Thu, 12 Nov 2026 15:33:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoD-0000000ASh9-2hhQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:33:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6542995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497631; x=1795102431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1LMY5qyBag2HeM/ukaz5enhzW6oSXExQCIV3gTZALI=;
        b=BR0324SQRN6K7pdgex8h8mYY1++zt6QJRdxkzMwp/FOL3eFeQrLsUi+0NRxj8Bp9Xo
         EgYUAmuUXR0Iyzl456PICIwJaxXN4871m/8xhlKlpuktojrbtD40tvO2Qo3oNbGDVQkv
         KpigMeO0DB4O3J14lgHQpka4Iij5LemGrIc6TRq6quePHJ+NDeojgPo/37Uo5kPZJIeq
         riy2BedAlJVGKQPotOzyW46S0SIeX6NYjjEkLJAtJ/E7M99sAPDdfnVcv2hekRs59Tfb
         A0HgJhA+r5H1Ou6f+P123t6RN7QkqEOxmja+trkGEM/LpEyXlhf+1lPPVrzI0Esjm1yo
         1apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497631; x=1795102431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1LMY5qyBag2HeM/ukaz5enhzW6oSXExQCIV3gTZALI=;
        b=bSy/Ai9fQJSQQx0B247E10xOp6/HgPpvJ37djiW7hSBZiKggV1bc29cL9L/kswqzlI
         pC05YkDqOy8bN2g+9pOEIhPmqmfUPDWK4PyrLB38vIdrsFKjmsvR7I9zGl/m5F6xBHT6
         9OQLBx1fx5ZHn0uHxLEybmSI5fdt2iDVLLmckV60Dh83H57zpW6gyEVTclpj6GjST0b2
         PSRUgWK3l56tuJJMRtwfJIMhqXbpJzdU1+86UJjCprfWg0kprkw4tQbn7UqXzMlO394x
         YnrA8ZzDB18LxIZf4u44kqnRO0rP0wVUX5ZtmpIdinaxLRCw6SUZ+Dhp7pyxk7hpmCuj
         Qz4g==
X-Gm-Message-State: APuU4Z9gXDTOl3m1/E3bZCVgVG9kHk7PUEF25UPoI2VuxCbjYa6XYEPk
	vn3SO6derb341oZ7PX70w9NHhvUDvtEDoHsffMUWE3liMp6Jh+fEGdZf
X-Gm-Gg: AYBFou1nh4fMQB75LCcQaYMvAdQant+kdvFYcyRdrxTYKIvOfNkBU12lfyYPpzBivku
	SzERN0JW3T/+QfEchLHEBNkzS+pjpYFBZkHQP/eTOCGtio7VtkLDN1EpLSvzmUiFGkmpQwIHT0G
	AN8hW+TpglaEaZsofISYZeG3kvs0jMv7ChAl8RvFfxfHLAIflXEKvhxOiOLCJNysgr3ZHny0bQ3
	uWacTe32J+dbhpDxCNsltc1ruc6iyF//mzdiHpktdfCMedhcWV6DH7ALf+eSl6WypB18m+dvp0T
	1E7HKEC5hPMLKs/uogiw0qVVvQCRnUyXMsrtwk39lgyQSqkoJmDXl2naVguNB8asQkINj+tgxVJ
	nlc0csFUagSmMLKlRWMYKVHtUU6f1pFKFwnyrf2PNOPhVkrxZTN3iND0O7Jf9gw7R+iuDoy286u
	hq72XKghn/VH0Kyw+0IgnzMTtbCR48hnWnu5kV3cK+N626X61hUOo30RNuEyr77tpR3meAGFDWS
	JgtxLhvfiClpBYIjo0kgOLM2moZJSD1EWnJbs6eSfQhP9xs0w6GymcM+KgJ/ZSEYPxm81z3EcXI
	+AQQO5BwS4zNuYkwjPYNSTXqMUfAFubXyCU9RfOQu2yuaIXzgtwfxYuy7MHBfb89lJx5+pXpKNS
	gmhHisA==
X-Received: by 2002:a05:600c:a31c:b0:4bb:53e4:a7c5 with SMTP id 5b1f17b1804b1-4bb53e4a861mr15636085e9.14.1794497631072;
        Thu, 12 Nov 2026 07:33:51 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:47 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:10 +0400
Subject: [PATCH v2 2/6] serial: core: Allocate a free line for
 UART_LINE_AUTO ports
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-serial-cleanup-v2-2-36b258e0c0dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4704; i=alchark@gmail.com;
 h=from:subject:message-id; bh=V3K8xL7bNVN+ns8AQIHh0AGuzdUIQXbz5k/DUkYJUmI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veM16cHDd2d+W8cyNDpPTSmbuSrnR+2eDdNnb1Ve+
 3q7bZRXWMdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTLcrIyPC5XujIgXAeXYcPEwyi+D5sl/maHD7JMzV8adzxxbytIVWMDN3Lpa2
 bI6rWsx2dPsNptpXTS/WZsiuZ/vo8+t+4pn/nFG4A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073353_754532_834487D5 
X-CRM114-Status: GOOD (  23.14  )
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

Drivers that accept ports without a "serial" alias each carry their own
line allocator, be it a bitmap, an IDA or a scan of a static port array.
Each one has to get locking against concurrent probes and release on
failed registration right by itself, and the state table already holds
the same information.

Let such drivers set the line to UART_LINE_AUTO and pick it while
registering the port under port_mutex, which serialises every change to
the state table, so the choice cannot race another registration and
needs no separate bookkeeping. Skip lines that an enabled device claims
through a "serial" alias, so that the device still finds its line free
if it probes later, and hand those out only once no other line is free.

Restore UART_LINE_AUTO when registration fails, so that a retry with the
same port allocates afresh.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/serial_core.c | 68 ++++++++++++++++++++++++++++++++++++++--
 include/linux/serial_core.h      |  4 +++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 683ffb4fda92..e0f9551ff7f8 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3351,16 +3351,73 @@ static int serial_core_port_device_add(struct serial_ctrl_device *ctrl_dev,
 	return 0;
 }
 
+/* Whether an enabled device claims @line through a "serial" alias */
+static bool serial_core_line_is_aliased(unsigned int line)
+{
+	char alias[sizeof("serial") + 10];
+	struct device_node *np;
+	bool available;
+
+	snprintf(alias, sizeof(alias), "serial%u", line);
+	np = of_find_node_by_path(alias);
+	available = of_device_is_available(np);
+	of_node_put(np);
+
+	return available;
+}
+
+/*
+ * Pick a line for a port registered with UART_LINE_AUTO. Skip lines that an
+ * enabled device claims through a "serial" alias, so that the device still
+ * finds its line free if it probes later, and hand one of them out only when
+ * no other line is free. Caller must hold port_mutex, which serialises every
+ * change to the driver's state table.
+ */
+static int serial_core_alloc_line(struct uart_driver *drv,
+				  struct uart_port *port)
+{
+	unsigned int line, fallback = drv->nr;
+
+	lockdep_assert_held(&port_mutex);
+
+	for (line = 0; line < drv->nr; line++) {
+		if (drv->state[line].uart_port)
+			continue;
+
+		if (!serial_core_line_is_aliased(line))
+			break;
+
+		if (fallback == drv->nr)
+			fallback = line;
+	}
+
+	if (line == drv->nr)
+		line = fallback;
+	if (line == drv->nr)
+		return -ENOSPC;
+
+	port->line = line;
+
+	return 0;
+}
+
 /*
  * Initialize a serial core port device, and a controller device if needed.
  */
 int serial_core_register_port(struct uart_driver *drv, struct uart_port *port)
 {
 	struct serial_ctrl_device *ctrl_dev, *new_ctrl_dev = NULL;
+	bool auto_line = port->line == UART_LINE_AUTO;
 	int ret;
 
 	guard(mutex)(&port_mutex);
 
+	if (auto_line) {
+		ret = serial_core_alloc_line(drv, port);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Prevent serial_port_runtime_resume() from trying to use the port
 	 * until serial_core_add_one_port() has completed
@@ -3371,8 +3428,10 @@ int serial_core_register_port(struct uart_driver *drv, struct uart_port *port)
 	ctrl_dev = serial_core_ctrl_find(drv, port->dev, port->ctrl_id);
 	if (!ctrl_dev) {
 		new_ctrl_dev = serial_core_ctrl_device_add(port);
-		if (IS_ERR(new_ctrl_dev))
-			return PTR_ERR(new_ctrl_dev);
+		if (IS_ERR(new_ctrl_dev)) {
+			ret = PTR_ERR(new_ctrl_dev);
+			goto err_free_line;
+		}
 		ctrl_dev = new_ctrl_dev;
 	}
 
@@ -3402,6 +3461,11 @@ int serial_core_register_port(struct uart_driver *drv, struct uart_port *port)
 err_unregister_ctrl_dev:
 	serial_base_ctrl_device_remove(new_ctrl_dev);
 
+err_free_line:
+	/* Let a retry with the same port pick a line afresh */
+	if (auto_line)
+		port->line = UART_LINE_AUTO;
+
 	return ret;
 }
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 9ac1ce1c10b5..a6955c446eaf 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -1135,6 +1135,10 @@ void uart_console_write(struct uart_port *port, const char *s,
 /*
  * Port/driver registration/removal
  */
+
+/* Set uart_port.line to this to have uart_add_one_port() pick a free line */
+#define UART_LINE_AUTO		UINT_MAX
+
 int uart_register_driver(struct uart_driver *uart);
 void uart_unregister_driver(struct uart_driver *uart);
 int uart_add_one_port(struct uart_driver *reg, struct uart_port *port);

-- 
2.56.0


