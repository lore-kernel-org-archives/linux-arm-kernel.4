Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EF9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QWDTCMmW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBEyXVWb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=; b=QWDTCMmWpiSuPp
	NpUDKTZji2omRq+t43YQ2cZCsDt7HxJY6+sk2JhxK2CZurOE5r0MOVLIyCcEC4/3uVzTpWdBF64k0
	oM2Axo/ICpIson/LA49tZHN+1BZ5JacexWHWufd0WEWSEmlLPEz0BHjIyuHmp/1sWlIJMdsicx3zk
	LB5BrVnKFca9mT4OSsPJumUiXv6ZClU1+yXqOQmDwBgW0Gd5Dzzp6uut1Ekuzf7SEzFiNEKUadu9R
	OSRZ0b0DC7N2rBs2stGQUOLSbcj4E6HcXcCYY2tZ+sw5OOuVICnVFXE9v8q48KjjeNYcDbCrWjJpT
	ccV6HQHVaJOT+8qHG5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkYy-00000003jOa-0JqZ;
	Tue, 10 Nov 2026 12:02:56 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkYv-00000003jNt-2q3p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:02:54 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-372bdb942dbso2575120eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312173; x=1794916973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
        b=zBEyXVWb8KLzQTGHDgxTywooWlBJlAI7P5tZ1+K5DcuFn3dZXj3eB0cdrYh91hh23a
         WV864YiM7sw0X/SYHaQc185pTK9ihJ+7wL/h0et3m+xTjEvFzruhYPEGHGtC+cRbQARU
         1sUnvlx+HIDNV0lznLxZgmRvh18J6C/vto9ezmCq96HC4ETk3yAh/pYhQMMQnLmjVBqY
         5QfNuTxMMWUJuw/tU3axP2b5PqPxrbgnoNbWhFOiAh68KIEDsB/okla5M3n5Os3E8FaY
         poJ9KVf78jqXGh7yzuASHJ/ZgGcT12hYHNjqzSpWufzlPJOm9u/yWrrFocqMbiD2nfFQ
         4MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312173; x=1794916973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
        b=WPw7HpfhTJSGC0OssQjX8mdkQTGlxPkbW5aTNerLI9/yYT3VrDc0fLQJCKmyGvQsxa
         jYl44QNrlMc6mimkJXUjtzr5+gGsJGrJ4kubBQIc9YTFtOGlU5fZ+WNFU01MDmx7cN0D
         p1n22rOKmvkHhM1w7+grfXxDjCZEaYY1lW8mYWeVMFe+0Dl7xAilOqCJYk4V2uZbeNaV
         j72ihKxsBijNpuGsrwdCFtK/DnsdwbXRatnCxFGs0B5ZRiNVx7B9W+WOfJLrYlHBuOOw
         aWatTz0ECq+zC5mufsD0XQUfXUAGosRq/gtgItN8hwOiGyrHXYnze0B2LbvN97HLJR+A
         Q/rA==
X-Forwarded-Encrypted: i=1; AL+hErEVD/4f5DwA4VPwqf9UGkaw9SqhLgNyrC4FsjOTBwfKDVWmT1v/w0ICEv9WLDbn5GwJPcL0iLTO3x9eRKniRzyW@lists.infradead.org
X-Gm-Message-State: APuU4Z/1rYo3g38yCacPVcZJk0GE9Kntj5z+RbjH4AVk4PmWGNUzXYd9
	/NmbimhEuY8MxavGMtLszPXMTD+4hukXD6rzqGzeQd4vgH0Znukjuw9s
X-Gm-Gg: AYBFou1VEN0uD9uJFUayCvyhYD6awHLGQaFr4kdnacLeMqJVrdSltRCfLMT0Tg/3jW4
	plAZJJ65geyrS8QdcWZzncr3CnOub+9q4qJ6VTwQFLH01bw0n0lF03obO1Dvxp56wC8EqRVwTze
	jNwFo631fpRXBDmv75mOSfqwUkKRs0OHf3MrJ5rn/GwKYWFKEryQI6Vf7fX/Wrxbwxe/WGc39jJ
	KmCdoyDhDKF/IhRRh0MalNetV8+XvXdxctmt0TR2kQikA8usy5/TPxkAZBIcg5BWaBCITNDRd5N
	RhDpX/jR2e8hRP2hJ6wlSoFIc4lC5wUroEqTKNoUqcjtT3PCevFHaQ4Lg9M07PMsUq1P4JSQdZw
	ggMROLRttNFJdvK4Fsb3d2vGwwIt1mscBMV+VZAY6WXfw3aM86o4Hgawk7qieik4+dhrfR4OFyD
	oE8Elz+46ju2CFIb3LWKDFV9cenDpwOxIbcsuSAdnWt/x1ZOC70pQjBAqIEs1K+1ml9s6ksLmLK
	XBIuWw1JT4Wc1YkRlMzjIyyjlGZ8zARyIUicDH21dxNumQG/BE1pQmS4+9dR1Zol6nsk48zr6p3
	6HfKf1tglXj5DFrZfgSRbHMqhvU3AUdoTCZAfCRCfN6WNo5O
X-Received: by 2002:a05:7301:fd03:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3751ee7c2c9mr2880533eec.7.1794312172706;
        Tue, 10 Nov 2026 04:02:52 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm5931001eec.0.2026.11.10.04.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:02:52 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Roland Stigge <stigge@antcom.de>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] usb: gadget: lpc32xx_udc: drain the pullup work on removal
Date: Tue, 10 Nov 2026 21:02:43 +0900
Message-ID: <20261110120243.2540098-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114351.2524921-1-hj351016@gmail.com>
References: <20261110114351.2524921-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040253_718991_0804531E 
X-CRM114-Status: GOOD (  11.84  )
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
lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which
queues pullup_job to clear the D+ pull-up -- but never drains it, so the
work can run after udc has been freed (and the isp1301 client put),
dereferencing freed memory -- a use-after-free.

Flush pullup_job in lpc32xx_udc_remove() after the final pullup(udc, 0).
flush_work() (rather than cancel_work_sync()) lets the queued pull-up
disable actually complete before the udc and its isp1301 client are
released, so the transceiver is left with D+ deasserted.

Found by static analysis; not runtime-reproduced (needs LPC32xx USB
gadget hardware with the isp1301 transceiver).

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: flush_work() instead of cancel_work_sync(), so the pull-up disable
    queued by pullup(udc, 0) completes rather than being dropped
    (OTG1_DP_PULLUP would otherwise stay asserted after unbind) -- per
    Sashiko review of v1.

 drivers/usb/gadget/udc/lpc32xx_udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 94355d3d930f..b98faf5b71e5 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3187,6 +3187,13 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 	udc_disable(udc);
 	pullup(udc, 0);

+	/*
+	 * pullup(udc, 0) queues pullup_job to clear the D+ pull-up over i2c;
+	 * flush it so that disable completes and no work can run after the
+	 * devm-allocated udc (and its isp1301 i2c client) are released.
+	 */
+	flush_work(&udc->pullup_job);
+
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);

--
2.43.0

