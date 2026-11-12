Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B650606A8AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ePKqG4+z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUzndpbc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6lC9fobCw8jtySKuvUyiU/10ib75zIoG1CNd+i9ZAGU=; b=ePKqG4+zXIzjKk
	ollZhEGPspUGmBtLje/937OPELFPfgJhcYrdSZ8/8cFo6KngTT/q/iVFqztDNrkjh5zazDDTr3BtH
	zAbusBuAFxBkLBN8YyBWVSuxs4/MVdpna4isRDKS3gzhe3XV+QwMHZYwALQU1e+Ghxp02J9nkd9GW
	rr+3SwtfGzsTO9s/hqQzsNjmYTkQhcSjDwRxGQH1Gxymr3fBvt0C1jQCL89d+RJCT1n1cd5B+3YHc
	UvqTU5kbDp4fthpzjHtuKjWZ7UB9pC3KAduJaws2MS1WcsPbRqnH1Jdydoh5s4xXzAsgmV59jDUqW
	MnDcl3FP81yxfPL6ZtPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoO-0000000ASnc-3OrJ;
	Thu, 12 Nov 2026 15:34:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoL-0000000ASkz-2INz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:34:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so39066115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497639; x=1795102439; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lC9fobCw8jtySKuvUyiU/10ib75zIoG1CNd+i9ZAGU=;
        b=gUzndpbccRNJl7yIRq0/S/ymgMaBB+bpSyVkN6KlcUwtl7yg6cGt5NcJ7pPB/LwSHU
         0QHXnPyl18c+lec4y/m0nCbqy4y9VHVzSKAgku7p79dFH3vn+Xym7/wXmTGIXed5pVSD
         0gxmh2nMzb2MTmpR1p2MI20vux/AYc8Rb4rRyrG75kkWhrplm33+hv7NqhTa77RZP3dQ
         E5x+AwOiouX3TPOwfCGgiCuKCnkgjLzNuu7WULLb/eYy9ATWHDiHPM62pmxRdj9KOatH
         rPfhmBWc9UGtEBR1tSeKIMLgTDAdG6b2ZY98n56sKbLZNDP6fE9XM/xiKvsHy1co78VC
         pcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497639; x=1795102439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lC9fobCw8jtySKuvUyiU/10ib75zIoG1CNd+i9ZAGU=;
        b=hePBuHyxA2+4+A4zT2dagQulnWU4J3tCCz+VdJrlFQ+LBG8obGqZFPHwToWCh9FqeV
         srMgvdCj9c4Qz0ivPohoo21XIAWxDxQPlRaPTUNO2bJ0qxZpR8itH9KBZfBJw9fd7ZCp
         /7+fX+AM5fae3l3aAnMbgIuOiFApHwjm5xomomS4alONnhjdbKgPAVp9iBfdz3um0odV
         v2yZbEecPnoVDsqtM4f2AAHOq4BC9PD+VohU2L2zaZI4DvxXHjZV8Q4JnCiUSXMKJiDM
         6LOtAKTJRMPHVcPt56JBInpxVpnMLkUidAum+M0qvK1dpQbYwvisjchcQxIkmBv7uAaE
         uzkQ==
X-Gm-Message-State: APuU4Z/qARphZHVQpR/dw+nL3aHs0u6TKaJT1aRfFesODFQToju5BnoU
	N5TvEchreWeX5+7BbP9uS/Q1rffnSJeiNA/qS47/e2zQ4jpxBmQvFvDY
X-Gm-Gg: AYBFou0OipfUwHdfhUM++OWsC9fsSLmU2QDYtQLnairHqN+sud212GqrtqylbFPV5av
	fPn6d4LvHvClUGYI+Ww12CbPKLm5id9aIdR4u6ghWZoK8tJvHxEPFxOrFN+oCE9HFkdZJ6mBfSY
	/OQ1qIIG8TFdrKyurOjKu52NB7RZ0D2qPEbTO7BYGx1vM1utm5iwaQpT6UY9VWnehfz6fng3Zrc
	f1JMAh+IrIMxNgzSgt+3xL9ndh0JW018tNdnZ8xB9IZERo6TXJ0hzO1lmUN7WrWNGb/OTEbNtDn
	UPciX2RFwQxZkhmkvDw/7NZNFR2IftbGYqmZTq0ocJpiZLwDF7F1JPCGUSkNJGz/omb8eDlB2XY
	r33ET/sKiy3xWh+sxrb0W/pbXxpZMCZYTdj9+ZZCgdVxQuVHIncvC6ko4pg8CR3NfiLu2atGd8/
	fRYmKBNOzwr1sr8IvmbKw9MK7l66UttPc1mxj9uZ/40td1lv82xjDn2P8AZ7X7RC3oiz9QFwDzl
	/fbkPEpDCUrLZ4bVKJfK3WdMFiCImv39fV+stpa1+Bsi3nS4xGqPVrb6tOZMF0IZnnkM5jc4BKI
	rxMb39O/sWqSyP9L4F9pYR4rzX9zRlFExUBpHuoIModAW2Ft93jy+1kUHx1VEuSq+qKfq82IYNU
	INYNAMg==
X-Received: by 2002:a05:600c:e558:20b0:4bb:4b30:8042 with SMTP id 5b1f17b1804b1-4bb4b308088mr60698665e9.19.1794497639340;
        Thu, 12 Nov 2026 07:33:59 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:57 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:12 +0400
Subject: [PATCH v2 4/6] serial: vt8500: Drop the port index bitmap
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-serial-cleanup-v2-4-36b258e0c0dd@gmail.com>
References: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
In-Reply-To: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3072; i=alchark@gmail.com;
 h=from:subject:message-id; bh=jcZiVN1H4g98kKKxKtvLfwo5DJs4n8bgP8iSaXWS7PQ=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veNVbnW206G2RPjcydy2gPKuWSVLNTMqt6RvDzt25
 HHy55jjHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy11D9GhulSd9anyf49pKkfUaeiMq/uS/NlzjdFh3w7rMynn/G6Kczwv/aaJYs
 025G1j19l8Ch1hTznyC1fN6O5oT/qgl8m0/cyDgA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073401_639049_93031B03 
X-CRM114-Status: GOOD (  19.45  )
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

Stop reserving a line in the vt8500_ports_in_use bitmap before probe
acquires its resources: nothing ever clears the bit, so an early probe
failure strands the line, and a retry then fails with -EBUSY on an
aliased port or drifts to the next free index on an unaliased one.

Keep using an in-range "serial" alias, and otherwise let the serial core
pick a free line while it registers the port, so that a line is only
ever held by a registered port. That also stops an unaliased port from
taking the line of an aliased one that probes later.

Fixes: 4001130df1a7 ("serial: vt8500: Add devicetree support for vt8500-serial")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ca000721-4a5b-4d88-bdb8-7f1e438dc81e
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 37 +++++--------------------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index 4abd4a8d5ef3..0c8ddd55f94d 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -90,7 +90,6 @@
 
 #define VT8500_RECOMMENDED_CLK		12000000
 #define VT8500_OVERSAMPLING_DIVISOR	13
-#define VT8500_MAX_PORTS	6
 
 struct vt8500_port {
 	struct uart_port	uart;
@@ -101,13 +100,6 @@ struct vt8500_port {
 	unsigned int		vt8500_uart_flags;
 };
 
-/*
- * we use this variable to keep track of which ports
- * have been allocated as we can't use pdev->id in
- * devicetree
- */
-static DECLARE_BITMAP(vt8500_ports_in_use, VT8500_MAX_PORTS);
-
 static inline void vt8500_write(struct uart_port *port, unsigned int val,
 			     unsigned int off)
 {
@@ -606,29 +598,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	if (np) {
-		port = of_alias_get_id(np, "serial");
-		if (port >= VT8500_MAX_PORTS)
-			port = -1;
-	} else {
-		port = -1;
-	}
-
-	if (port < 0) {
-		/* calculate the port id */
-		port = find_first_zero_bit(vt8500_ports_in_use,
-					   VT8500_MAX_PORTS);
-	}
-
-	if (port >= VT8500_MAX_PORTS)
-		return -ENODEV;
-
-	/* reserve the port id */
-	if (test_and_set_bit(port, vt8500_ports_in_use)) {
-		/* port already in use - shouldn't really happen */
-		return -EBUSY;
-	}
-
 	vt8500_port = devm_kzalloc_obj(&pdev->dev, struct vt8500_port);
 	if (!vt8500_port)
 		return -ENOMEM;
@@ -661,7 +630,11 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	vt8500_port->uart.irq = irq;
 	vt8500_port->uart.fifosize = 16;
 	vt8500_port->uart.ops = &vt8500_uart_pops;
-	vt8500_port->uart.line = port;
+	port = of_alias_get_id(np, "serial");
+	if (port >= 0 && port < vt8500_uart_driver.nr)
+		vt8500_port->uart.line = port;
+	else
+		vt8500_port->uart.line = UART_LINE_AUTO;
 	vt8500_port->uart.dev = &pdev->dev;
 	vt8500_port->uart.flags = UPF_IOREMAP | UPF_BOOT_AUTOCONF;
 	vt8500_port->uart.has_sysrq = IS_ENABLED(CONFIG_SERIAL_VT8500_CONSOLE);

-- 
2.56.0


