Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFB606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FrXkVIKW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nj3f6WBM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zLMJgZGyXVq2893oxSE6gXi5j/SSt9qL+lboxMV52CM=; b=FrXkVIKWz9QWPS
	2Y+X3PUyApaO/GrxeLEs4c5xfbJ74azEkXDT+fgoYaSgUvUmUPGLt3fTXaxAgSQ5BSEoihq5TSDCA
	15N+1Z3z7VZbvJIotGo7sjxumGiwEtPU/aDjnxuc2I0WYm1mcGRflwK5cTRbuiTDb17HJO3doeAIz
	RMBsVW3zVmwjRz7jeyTeltGtpYzyOe1G35l/XXRWkFYB8FIl/mLXKbm4GvsHORdd42LgIImxrDW2R
	BL4axKlKVZ0uldy8hMTg10fbAxCrvrQ9pIhxNJqmbzZkE/+CpIczCqQcYJowyxHwoneS8a0pv9B1/
	7hI8O6yAB3TSL/4/UxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDrJ-00000007VbA-22kj;
	Wed, 11 Nov 2026 19:19:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDr9-00000007VWh-441t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:19:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2984234f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424778; x=1795029578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLMJgZGyXVq2893oxSE6gXi5j/SSt9qL+lboxMV52CM=;
        b=Nj3f6WBM9VHo4ng/fziQP0nkm7itMTmCxyaOZBMNilSJgPV+A59UlDOJDI0j7KQpgq
         FFK292e4vY+cFEG54No2UIw0Mp9V18JXKRu8XhDXyZ0vztD8izEGhD7XSn7ON/fJi66L
         uTy7Gj35NB/E8d8bzu61DqfCw2wkM3Q+H4DNFN09znD5dVGIn5h4XmVCKJKxNsH4NTjm
         swbUdPsw2RRZ7T214EDhnluic7/9Nj4WvJC8mySktT5P61egysbIW9m6Ax99xpn0M9C5
         HVJdt5Zc0muxPkJnnB0pkWLNPgLpADspdguDvyUXnpSjiw+U0VBHI6Tivzbv7XfKjxon
         b5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424778; x=1795029578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLMJgZGyXVq2893oxSE6gXi5j/SSt9qL+lboxMV52CM=;
        b=n0T2VdQHK8bLoktO2Z3tDRdGrlEYli9KG5DOWQGsNXdbl37xXzg/B1f8bZ48M4nFRw
         D/fvr0uIs49DughkxRilmH6i5SsXMCfN7Qz7uWmrc1mJZwXWzd6c2fBextxNsKM/u5xj
         MeHcokougYnyL+Q6zWcH7n8NT65VwTLh05BMuQSz75wxuuaTiZs9DEE1G6nNMaEc8OCa
         vDse3e5HmDzwjrKWhpFQE+SQW7bmRv1Pd8GxNLzoeCXDheTfY5nZdW6C6gnfLbg/15Cs
         C30EyuMgJlefO8GE6McjogxevnNmbYhAVf9vmoXECD2LmGj5qilRL3YpJtpJmJRhM/H5
         TTkQ==
X-Gm-Message-State: APuU4Z9KFTDYjDcfm+77B1rtDkZnYz3oMQYckYwK8l5WwW9AK1Y60sqg
	tci5L6rROBaXhuTr/OjADS9PXNvkWNRR0Pc81AO2SpggyD4yokNk6BOk
X-Gm-Gg: AYBFou1z55EeBGs3TZbXdsNvj8vU9wdJH537k3nDOKmxTLDsx6dsq2C9TqSBXC2Nvpx
	/2un1yJFS969AdLwQpMkVaY+58Af16Ed/15ru7gYHzN0UdnVK6GjO3vm2NUb9DMMkeyFocEtfQo
	9WYqbG81zxR5/8I7uW6eQG0h07S3UQWqdSPpZY1LZfFnZ8I8mbvwIhoDY/v5OhweHs9Z8a3or0Y
	VLHvwvB+0jovfwMdy2tS+YALkGRbV4/RhfeyGTDpanxs+t49qVEmdqUDry8vMT6cqv5Cb491eUq
	wWZI9Iu3GfbOi+dMkAZG1TMlc+CCSs96SSpSb60J2mtyQKaeT6Ve56CbIRTaAYQTTmvC4TUSPG2
	s6phOOv/il0xIm0crTnttgL8PCs1ZSFfEWu5osH1eo7gNrOcheW00vGmJXqCIeqI7Py6Ftsjto/
	jQLijmr1p1nyLOQSo7Hjv50kz1bjfwXqhhfFYp4pSUTeMJnneEw8PueeN5IdGe7g/K9NiHY0MjG
	YDafkyN/t1+grzDnD+N8Gu0wZAj8mi9qCx/nZU15Ldfb/xO6zsEkD97HUSi2r9MI7SRHr+O7u/Y
	0BrWA/eaN4oJO6JfycsoF68ZNLnKDc2Hzygc42UyDC6byf50my59uP63uqg9n0OzitHBGotVeLq
	WURDFxHtVpDC3IzXeuL9sXzYw0E2h
X-Received: by 2002:a05:600c:3b93:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ba093c512fmr64982705e9.26.1794424777994;
        Wed, 11 Nov 2026 11:19:37 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:37 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 23:19:18 +0400
Subject: [PATCH 3/4] serial: vt8500: Handle uart_add_one_port() failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-vt8500-serial-cleanup-v1-3-b33594a25f87@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364; i=alchark@gmail.com;
 h=from:subject:message-id; bh=6MVluE0cGwPl4+DUsX6qfJLuLpTASBELCw1Mz2npDqw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b+f0Vrnfv6nd/x3/l8WdJP4umvfcfVH1RfTtoQlc
 e5h+Xrpe8dEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTfbWYkeGSha5a/YT3jaorImQVNdMzpu7d67ry5z0hM8uI51/+nyxl+B/Fn6k
 ntP/R5YBAtgz1j/dvtc3attF6SedHleYvb7gnPGEDAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_111940_033791_DFE842AB 
X-CRM114-Status: GOOD (  14.52  )
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
index 17f928a7073a..7c7b4beb51fd 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -671,11 +671,9 @@ static int vt8500_serial_probe(struct platform_device *pdev)
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


