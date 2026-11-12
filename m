Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99A606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZ2xQSML;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m631oogk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z786jydQGlTUZe6eFhOSbcyh7Kt9O55C4cUyVpre+Gg=; b=bZ2xQSMLtwNdyr
	p6WTUs8CB1mjCyyVAUbTy5Eli/6dOttz6uAhvSJufgyNsC342WAiWDqtpV/PQHtI4o0dPEV6LtIdy
	SnzRKo29ghKz1XEnJgKFVc25bB42zp3gCILw1tbrYZanKGsTJ8T6WPONCA9sByUsa7v9yJ/cZZ9+2
	4u3YTIwBy4oO27BlHLyuVAFzAN8QfOQac2GbxCI3D2MKzxokdYTQM/CKU6b+SYThi3bQ6iDnZCm+8
	b1/xzlY34n7VMPvZEzWoskvywxsZ3ftDmnUjl13bs1yOfDGbcloHiyOsQYO5Ne8Rqy8XGVCWSvc5w
	VD9hDRFHM13Cjgz3YYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoj-0000000AT1s-0uVl;
	Thu, 12 Nov 2026 15:34:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWoY-0000000AStp-2yIt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:34:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so55109095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497653; x=1795102453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z786jydQGlTUZe6eFhOSbcyh7Kt9O55C4cUyVpre+Gg=;
        b=m631oogkAEgYsysxSegecHxU1LruX997QuHbiYHUIjePimRbOfiGJgfoqvJh3D8xLB
         MPhRF2SOkGdXfLi7HZJA4R8xOIOMNmDBEju4qYKFYMLr0rRoujxIXXtW23YgeST9pm06
         lhUTSejRCiNcJnhomIPUuznk03+BInr3uKSmMykIcaMh/fWoHET9UpIqR2YnFtoqnsCO
         zDpdAZ1c6KVdTnR80thfebnb9QvdKRw3871jgXEVubrJpKObFeG48qPsvCctCUzYmYAH
         oYDZnhCrT3G9TH/2wH6FeUaOmRO3CpuDHJwlseJHTpVD1PQo/kk7cVqMEHyeo7L1Ett5
         63oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497653; x=1795102453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z786jydQGlTUZe6eFhOSbcyh7Kt9O55C4cUyVpre+Gg=;
        b=futaDYEbD2O1sMJbhexamfNHNTsDTjLjWGKOWbtx/hY0M7GvCZ/RrhZO7ez0QzyvPZ
         4xoNwuuHeGiZ2tDqfjuZmjapTT6oBF5c+egsqvlKD2+w8M9UIdRUYHPYruZgF1OJudgt
         atFRR9/ATdgnXgfVLnaYtxRyb7XvI943CjspV8MwaosDzVXumFitk/3O5zdFZ1ajzNQO
         XJdf7oUMEXDvBmfEXBGZ9Aqudtr+xAur1LyuWnWbtBBFtQ1K7QZq6Z2tLCm6yx/y6iog
         ywY2UYA/MUZVvwnit2DyeQx8YDlVp6IiOAidZjKgX0gEK/Hnn0mzemHJGspuehc7UAQj
         7R8A==
X-Gm-Message-State: APuU4Z8yvkMO2VduqNKYJ9IRCTZDqnCibPrAowzEueKeuP6zLivfslvj
	sTCOPhTUG9NWCIxD/xThefl/ZrLAm5bj92Pxte9mJjvvJZiVocp1ioQQ
X-Gm-Gg: AYBFou3biKpDLfgBvEe2l36p7wSJ5Yqqo5qaEvOhmoNHIwSqiwUUkHu0Kci3KCkwBUc
	2NuI0xdQOFFzYLbTAkxvQgqKrrguwKvGqmofiiPHRKjxwzIxKaybWejpzYo7KkWs7PDjRjPLQqH
	/+wC0bckEvU+7+gXfyZwAaUOUc4HG1695Fknse2cmKCRHEVQD5RIYvxhVWRpBpblsZS/Vzc3W8P
	K35FeTE3822utUmK/GKx4N6rPjT9aOPKA5TDz2VGQDFuyd+jryadlq4JqT3svZ28ykyRtQ4h3Y4
	B8mMACWl1HYFCS1lfsFDORx/bdrr1/H4cPQcEkvDdZngDJ9U7ZXeSAyJyMvd0pPd1/vvOn8w4Or
	zj7Ol3/UBdP2rnHx6lXv/aSHZTwnMZRwH2mPdPznBUNWFKoOKxxc5sXqprRdVIZvGnQLQixMtkz
	6hN73ShBSPIbvf98W+fN5rAbZH5hygt26HvNy3A0D04Y/1oZvctmvTk57Z5xrrZOb6zNSrOWpSF
	45TfncyH8tfSooGOPmLY81EwUS17tC8O7rQPsIaeyPH5lxg4HcM9nMgSLlKGAAezRns3gX48etf
	5UKhJYrYPz3olthsaqgoGb+Y/e8+pdquu4X0m+e8lXrtnM1d42FCQKtiALWa4D2z+rE8ORXhvcH
	LuTrKnA==
X-Received: by 2002:a05:600c:a00d:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ba093b7ffcmr114576005e9.35.1794497652296;
        Thu, 12 Nov 2026 07:34:12 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:34:09 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:14 +0400
Subject: [PATCH v2 6/6] serial: vt8500: Handle uart_add_one_port() failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-vt8500-serial-cleanup-v2-6-36b258e0c0dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364; i=alchark@gmail.com;
 h=from:subject:message-id; bh=/WGEv9BtvlhkUu2E+CsLY3dFd8QUnBePGzr3E+nbquM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veP17z5jzOYvTpkJb0xrDz56ee/dzoAVgo4cWs3TJ
 3HoKd8Q6ZjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqNzExMvQUmYR4zN+dtzf+5ffcF2lcUex5zfdiSzK+CVkfYXk35Rojw+wew89
 mbfOOKyTG2Iaask549vvYmi3Hlz3xnd/WfyRhAj8A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073414_868746_FFF8DA11 
X-CRM114-Status: GOOD (  14.61  )
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

Return the error from uart_add_one_port() instead of reporting a bound
device for a port that never registered, which would keep its clock
running for nothing. Let devres release the clock and the remaining
resources on that path.

Set the driver data before adding the port, so that the probe can end
on the registration call.

Fixes: 304e12665a4a ("serial: Add support for UART on VIA VT8500 and compatibles")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ce64cdae-9faa-4109-b7da-29b8a8c99e76
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index cd5188282f64..906b8dd2f4ff 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -638,11 +638,9 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	snprintf(vt8500_port->name, sizeof(vt8500_port->name),
 		 "VT8500 UART%d", pdev->id);
 
-	uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
-
 	platform_set_drvdata(pdev, vt8500_port);
 
-	return 0;
+	return uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
 }
 
 static struct platform_driver vt8500_platform_driver = {

-- 
2.56.0


