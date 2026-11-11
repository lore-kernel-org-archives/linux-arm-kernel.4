Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DBC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u4Ygu4A2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGnCAHgb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BKsZ7Ow4qZ7mZiSdzQqgyLRR7L+0QBeMR+7OXlVyKXI=; b=u4Ygu4A2aDeE6u
	0bL5BTY6Xxgwz0tLyxGV1P/agxr3bSmjNSWt6LNSFNiC0nGT+1bcOv9lFu4DVTBJ6dEWZvSlzFHcx
	BvFEDRVIjlL0dDDt5XDgLAg1bgvU4o+E8uyxKHbBwoWzrJrbs9//ph3kYrdYpwUatzrgYM5oFKb74
	u9LDzpCDSqWPFmT7b728CiHxZZClWy1YI9x7nB0HYEE6SIe7rz2LCfrLH6Tj8c/BEmaNYxPDJ1TPx
	kk0FR6DuLlkoL6sd9QZuK7FQKLyqZQvSAB8EC4uZgEs/fmmtQswu9Y1etm/CJUjaO8ubau8V1EwmC
	WxIFVfqrvh++4F4uDigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDrJ-00000007Vba-2Wxa;
	Wed, 11 Nov 2026 19:19:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDrC-00000007VXh-3LmA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:19:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so27693005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424781; x=1795029581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKsZ7Ow4qZ7mZiSdzQqgyLRR7L+0QBeMR+7OXlVyKXI=;
        b=uGnCAHgbpWMjZ5BnmeyD4ljSuC9MpVDDzjuv0zal+4WTLFUsGky8yQ9AeM2pmGx7Ek
         pJT+qfgHBXjaafi89Dib6dXH90ClFhx62WLL0TTEMyED/NTs1upAzs9UmrNA0rtQAHl0
         uG6cPYkPFyDFVoLjgLjukMAtB6qBSyu9dXJHzS9b98y/2uA7AKIs6N5pCXLd6eFs7OjQ
         DUL1e11iDY6kjKQeZgPVA8NgD6UFBr2S5W3ffMnhiYGe7P0EtAJWjp8CqV21X5AJHln6
         wNn37isaZudM5+n+N/CV5xluJSDmW7i+f1PkNlQ3go3u6fDjyM50F436MGt4hNZyT2bD
         eVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424781; x=1795029581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKsZ7Ow4qZ7mZiSdzQqgyLRR7L+0QBeMR+7OXlVyKXI=;
        b=XZjbmfN5xjjWT0byzbB6Y6JZ11eovtfPRSXZ3lZVVw3BhvLouVyV4O9BUgndIzo07Q
         4mQSIiCoPXcB6zHAAwRdMWpTKRnt/iJTWLdaiO0Ffh2DC/RUmGxAiZqYdQ3s7EdGVX3i
         XFpxO+vEJ/yz+mA8rdtml9QhOvPmsgzkNCH/c2ezkswPnAP1xpbz1xO/BKqp4Y1bu6vw
         O92tmlopKjNQNhManJ4ytSKhllDsXRO13dbP3yatHEChOaP7ggtEJrYnqR17AVJLJKbz
         2sKDDwH+2QBne5HNVK0Tx49iaKYvZxp4EJ2Lz44xiHXs/s4JmbH3yg8TWT4zaqjm5clU
         I7kQ==
X-Gm-Message-State: APuU4Z+M3GAz6+cFLe4FYMRwHh9ql8iNXdVTwQhcRm9j3bzkwpBqpSLi
	URcu5G3XkhbnI/3xy+n0tyo7MmY7lfYOCT4i8INlQocV0KS16WLWL93T
X-Gm-Gg: AYBFou3fMC2RM6VK/oSh7mPBJ5o20wn60DlVtryIQVni9I3SJG4hMvfz+Bx9HdMH2wh
	Yd6wBLVJctLdAD8lBAzum2fHn37aQkPk7kjr1HgHkscQGR77OjOxHZwRMbAsRHRIdV813p7gMi/
	2c//dTqpLNG+yvgU4yMBIwAKddj6wzqDJoykUICRxtGGNT6ID3qBcL2HdFqnpZL94irL0IFrW52
	Y//WIpLXa3rzXsTG9cwxIhNmCEAoRQdS2w+MupH5UFppzn1r7cX+Rbq9OhxPzBiOItBqjfV2hJH
	SzSfL7yIOkY54JlSXJ4VhIu866e3d1QB5OHhIMIRl7Tf72chY08RyPN6OVgAj1Cr8PAP2WRRH5C
	VbpNSODG2KkI/Y7Yn7Xh6GCB8hi+XJGbGHCuJewlJ6Ml83S551WpZeOOKMU/Iichg9zeW7rNNJa
	+mKoJfPFHpfyBqbtHrBshgIaN8PvcP72uenqiSaZVSFBtEru7RFhD019aWWpkxvLjWuaJy+EgU+
	eWMkNgus7iyjU3kvXbw3Rl01og0m0sx0ZDuOaHTnutMChNt2HTnzm5x6wjjcJZuddHohMogr4oK
	8WSf9AbzKG3+FmZguSjoxgJtvxhdfgbIXVRst1aDQBe8iyWZRY6IMG7AfnydUXRYVOiwJz6QjK4
	cABQ5B+DSadzQ2L5aurcaGGMdSrE/
X-Received: by 2002:a05:600c:19d0:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4ba093805dfmr58429255e9.9.1794424780677;
        Wed, 11 Nov 2026 11:19:40 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:40 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 23:19:19 +0400
Subject: [PATCH 4/4] serial: vt8500: Drop the port index bitmap
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-vt8500-serial-cleanup-v1-4-b33594a25f87@gmail.com>
References: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
In-Reply-To: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; i=alchark@gmail.com;
 h=from:subject:message-id; bh=1q06ztS4FMn7AIh6i5VhNy93j0jS97qWkyFFncuqV88=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b/f7K3N3q5VzOwunN4e8gIxtxYuj2svcCm64b33+
 ymjSReiOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqY5MZ/jud4Jl9QfUh47bkbIcTP6t4nztK2ixxXOFj0ne+trH8WRojw9HDwce
 SZ6190xAb/T8/mXluH8/Ri4JHtWMqIvLnRWYuYQAA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_111942_879275_E7A401FF 
X-CRM114-Status: GOOD (  19.27  )
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

Pick the line from the serial core state instead and let
uart_add_one_port() claim it, as the core already refuses a taken line
under its port mutex. Rely on that for concurrent probes too, so that a
racing probe fails cleanly with no driver state to roll back.

Keep the allocation policy as is: honour an in-range "serial" alias,
otherwise fall back to the first free line.

Fixes: 4001130df1a7 ("serial: vt8500: Add devicetree support for vt8500-serial")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ca000721-4a5b-4d88-bdb8-7f1e438dc81e
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index 7c7b4beb51fd..f9858f10b5db 100644
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
@@ -611,27 +603,14 @@ static int vt8500_serial_probe(struct platform_device *pdev)
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
+	port = np ? of_alias_get_id(np, "serial") : -ENODEV;
+	if (port < 0 || port >= vt8500_uart_driver.nr) {
+		for (port = 0; port < vt8500_uart_driver.nr; port++)
+			if (!vt8500_uart_driver.state[port].uart_port)
+				break;
 
-	/* reserve the port id */
-	if (test_and_set_bit(port, vt8500_ports_in_use)) {
-		/* port already in use - shouldn't really happen */
-		return -EBUSY;
+		if (port == vt8500_uart_driver.nr)
+			return -ENODEV;
 	}
 
 	vt8500_port = devm_kzalloc_obj(&pdev->dev, struct vt8500_port);

-- 
2.56.0


