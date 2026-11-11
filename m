Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26E160A261E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWgHccz7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpfKnfTp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=alD5BAXz/kS3KLnylbWLn4qtc5TJTMjnEsE7TW0FMm8=; b=bWgHccz7yQHHxs
	YNNrflgjDbbxWDEoeaAfQQnLwuuh+kvCMm1MU8Umwan9nn6IUk7ZcBImonz6f9YELU3f0KcOKIWdb
	Fkw2oWUjwVFX5v8ppauuZdeNUhMfocEObcKY8zifsmeO9mShGShnBE09bipsHzAoM+VlODqY/6b8F
	k40eu9ciCW2p3Frfih1uVfRhxHm5b4lf+QHm1npQoPhErL5E8aTZ/g8EDcweOUha1MtX+1NrEhMeA
	azy8sRUgvl5AnpAMGMMvT+nzKoiXnFLDeD2cZM25QiKvvtJQW4JBnK609q8ZczlHTIYBQsGiXIdFX
	P+hLNYhnTLxr9h1vlXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDr9-00000007VWw-1aMv;
	Wed, 11 Nov 2026 19:19:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDr6-00000007VVt-42gZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:19:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1713965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424775; x=1795029575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alD5BAXz/kS3KLnylbWLn4qtc5TJTMjnEsE7TW0FMm8=;
        b=kpfKnfTpSngg2h6dFc18DKbeMm4ae//hTx6eO/cuwSNcN1bnV4zz0I7YmZkE4BKaBs
         N8MPQ9XXWl/bLEoLvXxFRbPOzHYc2ZgzDDYDB0tG3vW1wibytTu5b4BUDrHi42eoquUi
         b1lQvvg6YLJGXAfU9hNgVSAnbFRJ6jQ7n1xZECVOXM4uOOlsJIsn8mRK6PSHisYzWEC8
         v879VFG7BjDgTvKs5JNTHgdPD7VZkhmkTcs0sBZ+wyRyY09MuChZWmYNkRW/Y9ODiVaj
         nBwR+NQz67BshTkneDoKmBvpX+KGNn0Gga7+SmKmni32Gs8RnrtDUh0gTjNdVtfsqJxd
         gIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424775; x=1795029575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alD5BAXz/kS3KLnylbWLn4qtc5TJTMjnEsE7TW0FMm8=;
        b=JzilBd5Nh+GZoYhQWVl9UaWzanCL5u37O2HfXTMXy1ubYpBp2fxi3YV/a+rdXoWKjB
         h8GjBp/RaU9wzVy9Jg7fBMx6ZQ8WwAjaTMebYl9qNBDHncER8DsNkwfySeb5ThO5eGm9
         ojUO9YfCVWI/X1yHlVRMNzTZBPrPbPu1ohTm8LhxPJgICO1IAl0Yjlv6z2pmOovfLOAm
         gB0Mc6io78tziTDrQTQ6x7OzuTiukqYAqzM8gvZ6pAwRSGbP2CT0Ls5RCmPTt1Aue1xH
         VBJ9ILpuHrhBOcNLHfG73+Qjcg4FPHiR+CORCgHpMsgsTj/SfkPsgGzhRSudX1f1nVlp
         6JLg==
X-Gm-Message-State: APuU4Z87jgIZ55hLutN+3FFoZNDQITjQY8XkFTQMSB8cn+wzVJcG4e60
	y547+sEo6AK5L/9zwJ6pXBxLp0SfLb5tq20p9IZ+dBl7m+HEaHw2SUEzJbBB1lTcM04FSA==
X-Gm-Gg: AYBFou3qGVfq7I9ppFIC+36XD6BNS0I1grv7DmM7s1nATSXH9f5ModNqtS1e+MYvo4F
	wNULAx7vlHcQE1CBCIT+JbwRyLAhyBEVXTU03kc85aD/RwlkDwiXGRKQU1GJFslUkFCqBMqfq/V
	8SsdblIKlFY7/7VE8VyWuGhRIu9ZCaElNNbwwwmij5gVRXfNHNBNWYqfefup2M7me9PSNYVoxOq
	6nsllBDkB7XV8MjlZ3j8UtYFyvAcxY/nhFhks0NSpN1S6KsdD6d+nGSVjE3Wn0OJQtRsxd5B7Tw
	SjqBsC9R7YWvAsjVO266bYVs1BJFKUgUtwgq6bqJc+aFiCyK+SCt/N9OvFXol9g2BaQkpAXz0Sg
	6NVz8q5Dq0qkYF849pBjyLWPZjWXsfDvqyceZxYd84FdKbL55k7ztdUde/Th5joIZfrjlIkgsiq
	VazBViiZi9VWqydey8h6UGyG1w54Tlk6y3RkJ5qgIRCIt8J3bTici7k6PEPXQDD8WM8+IBKg/XC
	Lyhf8pv1Ylkb3hNikdkAgdOHTJhdYmVQZcMCgUQ0b6vC+T3kEbmvrTs+EUFalsU7f6nxlz8TfNg
	dbb69kKArwnZ/GzMsC6+tC8NWXeDpgzK2yHsakGJefwQVaKdIqoLjlao0RZyx4hPAwUXguQvq1D
	m0INj8OQ=
X-Received: by 2002:a05:600c:154a:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4bb4e27a9afmr8939145e9.7.1794424775346;
        Wed, 11 Nov 2026 11:19:35 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:35 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 23:19:17 +0400
Subject: [PATCH 2/4] serial: vt8500: Use devm_clk_get_enabled()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-vt8500-serial-cleanup-v1-2-b33594a25f87@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=alchark@gmail.com;
 h=from:subject:message-id; bh=U3F4KrTDPJYSmcypcQ7vg8h5zcbvYzjMb3gEr3v3uis=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b//z5UWsc5NZVIb5DU+XLP1Sv+eZ9faXDk5bvnzT
 Ita76taHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz14deMDHcnrUhyk6h6x9Cyxq3d2PfwhqKr7VcyvvSe/Wt13DV5FRsjw6dfu4s
 /H+FgL5g14a/l6ziGiqL2FT0zV/7V0Wu6/7U+hBcA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_111937_031531_DEC6C9B3 
X-CRM114-Status: GOOD (  13.43  )
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
index 6c53e108756a..17f928a7073a 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -600,7 +600,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	struct resource *mmres;
 	struct device_node *np = pdev->dev.of_node;
 	const unsigned int *flags;
-	int ret;
 	int port;
 	int irq;
 
@@ -643,18 +642,10 @@ static int vt8500_serial_probe(struct platform_device *pdev)
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
+				     "failed to get clock\n");
 
 	vt8500_port->vt8500_uart_flags = *flags;
 	vt8500_port->clk_predivisor = DIV_ROUND_CLOSEST(

-- 
2.56.0


