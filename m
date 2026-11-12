Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E973D606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkGvStSB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vp58YUnl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cb9BEjmbKiC1e6Ns5PB9qNgJqLkx/tEuk0+MP84fm7I=; b=RkGvStSBglCNqJ
	9YSrSVFJkNu6Ev1zy7vJVC4222YmKs5rlweaM41me8oHYdWLlG3Kh6dKqYCTgI7Mf7wEOBegpNiz9
	o+dVYx+a1oKfzrjNjvlZe+gue21ASww37aZrgfBeYrRSxf10kPn+rnww+ERwqo8oBD2ty8UHXIvLw
	llQUPILzMEXSwsZWiYJTmY5evOZdoHhoLUUHFO/z3e7GafuzakT1L4r8Da1MBtX1hpaLQwrrHjVOl
	1+kilMLDk9iOGlJ870tLpr3xvA3Kq2/hruDudjcTQV0zMEFHcH66E06tJWxagVDkPA4QVVTTNOe2z
	YN+UGnSgqZOVXJN+Ktdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoY-0000000ASv5-3vDd;
	Thu, 12 Nov 2026 15:34:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoP-0000000ASml-2C3z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:34:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so42404115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497643; x=1795102443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb9BEjmbKiC1e6Ns5PB9qNgJqLkx/tEuk0+MP84fm7I=;
        b=Vp58YUnl27rbwJ6brSvshakMXwKyAA8Q3JACNiP+yFvx4ewL65iATj1inRNc+JX2L5
         7TP9718L09ACzkE1YyvhYpgC8KlDxQElTlPKDlv++ueTDZzgL7pJ8mxmHNZdERrYEGHT
         528jyqfC/EBQcj4n6PArMvxbTPL28e6/68Ort7qeFgvH0smEi7fmK6LEnDZCz+1pLJxR
         YEK9q5MIInwRu3m8sjtww6e0aoAho/KF3SAaGZf1wUEcEQz9Gs49JcCp6MpxGao1Bpvd
         jmiNzN3UFn905XBoXQCaH+c5yA/N55HCLFyvDDggwhuM1wsbwWThbPQs/sxGKE7+Ihln
         Qykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497643; x=1795102443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cb9BEjmbKiC1e6Ns5PB9qNgJqLkx/tEuk0+MP84fm7I=;
        b=kOfZeNwZbPoQUuBQgM4Wq6i88wU1Bd3KoiVoTkqmFeqoIDEX/SSBravWv4zmeZgWn0
         W9ASU5LxANv5hvsf2kPZ+q25aoTnyh8TNnYjdMJvefls4pMMsjpHV6ko+hvmmyUJQ7NE
         DeS/eFNbgA58R4ZdGMTelOZxRLcJCqWqV/T2B9R3e7PhWjZj+akBkFojtdT4jl7+FN4O
         ik5SCbfjYagwmGNnOGb4Ol49E85gHyhLObk87tysoyiB/kwX9J4mmaPHzepQ9KJxBxd5
         Tb2N3xg7mZtpqApC9F4+TKhHA7ecyW5Cg1EKJ4Kre+flBlWiYb7V8adrsI69CqyxanDi
         54zA==
X-Gm-Message-State: APuU4Z/XhQUJmQJvUzqVROjqxFjTZJ5Nm7h/7Zrm0paBxB+3qH4L0+Ht
	aoh7Q22ajztPcRZq8WmLOUXd1HvioItFOITwK3lAhph8TIb/YAaGCQDp
X-Gm-Gg: AYBFou2fYDhNU487hP8ZfJfL9OWG17NrU8VNXELGWIC/gjIXuWa22IyZYCtCDJbCRVC
	tWO059JebI49S+f7ZM6VxrhLO452myoABZKqIzkwAfIY001HKFEEvKs7T6nm7d1OZy2+PVmx2vS
	aSx/gjHtrhTx7s2JC74fh3gZjdhvuDqn35NfbZ4+Zx9nog6J0hYH3fE1kRo+DzGGoRUIQYnC2Ko
	B7sU5p12UG91yswA8XdS2Jb64SPIXLEBHF1v796AeMDwJwFyhYL5eD6PSOWPb9C2lxIb46pKt6z
	ecBIA6POjdU8N/upKucbaVkUBoPZKkYqC02K9pzcROdudpelPvDxgnP+ImbgWO1dXktXZvwc/in
	7oOLZ1BjKnQpkLhYxbCU+gjtJjAv66W0C3zy8wP0y5chSQUak+SgdDU1OxGFQvF4ViXmd05nvER
	pCXLAqJKGyEtq+UhZbv6UHF9niJJHbi0UkWi7ICgx+c9vqyj2Movp8u9RkcbYQ8Rd0+5Fcdbl+V
	XP5YJH91YLFFYC6uSnTjn9Zxcls805hn7i3MOt+Hec4ab9F94sGvRvMbH0AyA47yJQeCkH6JGrw
	aPl/zAo9Y45IP2ZQwh6EtwgpNNvDw5JQ4EdFl5+QZgorMhztG/NNxSunqXnq89j8E2iotKCwev7
	lqJvycSA=
X-Received: by 2002:a05:600c:1c0d:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ba093a3cf9mr133072185e9.28.1794497643353;
        Thu, 12 Nov 2026 07:34:03 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:34:02 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:13 +0400
Subject: [PATCH v2 5/6] serial: vt8500: Use devm_clk_get_enabled()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-serial-cleanup-v2-5-36b258e0c0dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=alchark@gmail.com;
 h=from:subject:message-id; bh=aNl/b6SlgUpHOAaonf2+NOgTxzDT2w4YvE4m0DcTp5A=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veNVq5GRPm8+5/97Vp57flnN8ok9osmhc4pnQyWb+
 aMLclUqHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1kQTD/xjOrdoB5jYTvIocngROMXJnStaND3j2f4be9NNnDzQUFTH84Xlde5U
 7PCF1/zJFi0kODQWJz9wmaGx9eWiFjNpzo++pTAA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073405_841315_831D965E 
X-CRM114-Status: GOOD (  13.67  )
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

Let devres own the UART clock, so that no probe error path, present or
future, has to remember to disable and put it.

Pass the clock lookup error up through dev_err_probe() instead of
replacing it with -EINVAL, so that a clock provider that is not ready
yet defers the probe rather than failing it for good.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index 0c8ddd55f94d..cd5188282f64 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -586,7 +586,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	struct resource *mmres;
 	struct device_node *np = pdev->dev.of_node;
 	const unsigned int *flags;
-	int ret;
 	int port;
 	int irq;
 
@@ -606,18 +605,10 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	if (IS_ERR(vt8500_port->uart.membase))
 		return PTR_ERR(vt8500_port->uart.membase);
 
-	vt8500_port->clk = of_clk_get(pdev->dev.of_node, 0);
-	if (IS_ERR(vt8500_port->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return  -EINVAL;
-	}
-
-	ret = clk_prepare_enable(vt8500_port->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		clk_put(vt8500_port->clk);
-		return ret;
-	}
+	vt8500_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(vt8500_port->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vt8500_port->clk),
+				     "failed to get and enable clock\n");
 
 	vt8500_port->vt8500_uart_flags = *flags;
 	vt8500_port->clk_predivisor = DIV_ROUND_CLOSEST(

-- 
2.56.0


