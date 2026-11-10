Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AE0606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SM1Mt8sP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/Dx7J9E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=; b=SM1Mt8sP4k4OqV1R+pZSlxdz2l
	Bi2ErRaTGOjyMtfFoITK3l01XB1312/Y8eTVi2ENiA4Q8XLRn1uHZfaRP9gKB3S1gIyxrgvta9pVM
	X7uHpw+HOGduhCryrMcLBq7Co8H+K8Q8ENAm7s9N2ECtAWszfu8vscB1UGV2Obv4vkR10xKxTr3i5
	7xfWh6ocXNxkiVwr7ubntdgqo9BIaUPE+Ld3RDqWiuFTJB2O+cFg9giUrPAZit97SIV+9qP7P6tOa
	F8NpDrCnm4TBTfA2QK70wGIpkKk+kwagzcpI4nob3Iv9AXEA7OeLcN4sKRfDqnsKYNHikcl3vE0NO
	g/+fvw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkGp-00000003fcs-3VWS;
	Tue, 10 Nov 2026 11:44:12 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkGm-00000003fcA-1u5T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:44:10 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2890377c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311048; x=1794915848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
        b=d/Dx7J9E/1yPKSlPK3CrGwbRZy/ivz57yIzr1o2aFH3OwMC7ZnQalayWxQr4BcsW/l
         JaSvJpehfRGlIcmGFLCJvKz8cH3WsURReziTkISC4rUwQK8g4mfuSbCht52zk/RuOVza
         ZSyq8xMm6W1Lyx/TzT3A7AHYqiQ8JHnNt3xTKaS7walaOmCBWJZQH8c0Bi+82BDyqXL6
         SBLwsfA+e+vTBXZjq0qLERBp27KTVsBgJtZWYwle6+yprHspvYynF7SLNK9ESAmJUwak
         uUZWa2KoiDQyoGEvgzXQ/+/9vv8assZ8owo8X4ncl6t4QMCTKFDMq2A2FAOsYVbTnpbD
         ZESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311048; x=1794915848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
        b=ZglQGq5oGoz8coOalf9fwrKA2mvZo1lUzyG8B1pEn/Qp4awzG1KyZhiQPuiOxXyglI
         ipzUBBOPFhv8ifeQNw8XvASCDP+irmbzGN6cSMmv1P40woQbcBrMEjM2lY9Y/Ykk1A6s
         SLnvRIOo5nveu3uUyfU5kEKyHO/y/uZ1tUsQYQHZepic6AV9We2PkWA+zHYHvrUAr9l5
         hN93asB7hwxkz7O0ia++og/jEANkojrMn7yjj5mV/O3rgPNRNzIcQnujq9nLp0QiHDlH
         fExB9OtZcIprt2fn4dGTN4eAChY1AO33VUT3XF0T1VLAAxTXApNpjdQz91f4ywnzMQoc
         xbuw==
X-Forwarded-Encrypted: i=1; AL+hErGIT5mdDm+eNG2jryTukENoq9PljYj/wUHnCjc8n+I59a5iXOlS2jTn3cy36piLR/WN1AjefiKg9XIupcypiWJW@lists.infradead.org
X-Gm-Message-State: APuU4Z8/g2KQwOiKgpxUj3WZYIkW3CpfWUY6qIQN2YdAvInsYKGVPiRQ
	KqzGHzIUtybqNstpeVGAm0Z2DYEnvUBYodYv2lgbNiipwgrXN3nAtUKL1m9hBiTj
X-Gm-Gg: AYBFou0ETuxGn0WHbbqDEC/z5X5M9KMSU/DDmvO9npJmvjdSFBQ/H7ORwt2H6IjSUyw
	DStY+Zz1uj5F9Zcpvg/7PA4+PS8atPVh5YO0sBdCfbKFZz3x2aZt6Ym+vt/oFQO6h8AKJJFIJzy
	gZmfpnn/A31rBol02C6unMlFvrAYCrtRajQixRAeb9gOyoRKatNRSGVwH3QzfaqDzB1lcBNjSrc
	0y/QE/ZsAcN63DEP4rnl0QOAejRsAP75z2eKk7kJMj9jJTZNLgLajOMhec7edzK54MVfi/zvJ8P
	ObSv4DQ2RjEvSbbrSCQC3xVwbqTB9mEGjFMBH7n2PLFwb+EOjxADF+9PyrX1b/8+SFJEuFTn0xz
	hUTP0I4fRlJ/Adcx4E2jqc0Hi7YYwNi4LS0bO1G/rx30GxhCCSBvqCKoADJVIpNvhTy0EOeg/DL
	D4zxsUpN8K6P8/vZcOs9qXvT3Jrv67L46vo7k4/wL38z2cle8likL5wPqGw4Gxr3IzEXbxaT9l8
	t3uBndmPSYrUmbMUWaKThNdrAoWF585xlgwAC8ghEKBVoDi+6ApqPYm/UqGfLTx+1VG/3Z7O9jA
	ZJAE25fM7z+h1ZLF0MRr/Lt0/iv2AwcB7ZBqXdJG59n4A000
X-Received: by 2002:a05:7022:3a86:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3b60249b4mr3330257c88.20.1794311046423;
        Tue, 10 Nov 2026 03:44:06 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm6648791c88.6.2026.11.10.03.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:44:05 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: gadget: lpc32xx_udc: drain the pullup work on removal
Date: Tue, 10 Nov 2026 20:43:51 +0900
Message-ID: <20261110114351.2524921-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034408_698921_0CB4E587 
X-CRM114-Status: GOOD (  11.07  )
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

isp1301_pullup_enable() schedules udc->pullup_job to perform the slow
isp1301 i2c pull-up access from process context. The work handler
(pullup_work) dereferences udc and touches the isp1301 i2c client.

udc is allocated with devm_kmemdup(), so devres frees it after
lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which can
schedule pullup_job -- and also puts the isp1301 i2c client, but it never
drains the work. A pullup_job still pending can then run after udc has
been freed (and the isp1301 client put), dereferencing freed memory -- a
use-after-free.

Cancel pullup_job in lpc32xx_udc_remove(), after the final pullup(udc, 0)
and before the udc and its isp1301 client are released.

Found by static analysis; not runtime-reproduced (needs LPC32xx USB
gadget hardware with the isp1301 transceiver).

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 94355d3..210fa1f 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3186,6 +3186,13 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 	udc_clk_set(udc, 1);
 	udc_disable(udc);
 	pullup(udc, 0);

+	/*
+	 * pullup() schedules pullup_job to do the slow isp1301 i2c access; the
+	 * work dereferences udc, so drain it before the devm-allocated udc (and
+	 * the isp1301 i2c client it uses) are released.
+	 */
+	cancel_work_sync(&udc->pullup_job);
+
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);

--
2.43.0

