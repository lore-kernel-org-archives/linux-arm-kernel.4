Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10703606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d1QaZkQH;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=jDdk1o2c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PfMvdnhdeogIiO1WmdL45eNHWMcCOvoX8KJZ6bMV1Mg=; b=d1QaZkQHAW6tVfCYFOeauxlVUO
	h6bKcQ9bVTcgznc/iAThMxU0xplI/WALnZsd8MQI43zZDsTjlPtZblVQklCGqn27s62lTujzRVlhL
	fpbU/uw+ne8zqPtwvkBT4NgsGPrBdqoW8g4cL5i6cUbhF8XqAwk4/KWiM57JdQ8gu0iQnMWME6WA/
	vTlhKG47gjgjIU0a0iGvouUtUmef6Hi09KK8LuMO4hoswDAYeIHFvBnDJN8TqKXxVQLECAVwW8jj2
	+m0qG7BSp5IdCYIRLdfVXKyqJNk4kstLZOCtllq9jNZdLXFNLnbU7WLylBDIyN3XoKqQjWTeh8hnv
	ORI7U0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIl-0000000B9jw-0xHF;
	Thu, 19 Nov 2026 08:15:27 +0000
Received: from smtp46.tsinghua.edu.cn ([101.6.4.70] helo=tsinghua.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxIc-0000000B9bQ-1Uzt;
	Thu, 19 Nov 2026 08:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PfMvdnhdeogIiO1WmdL45eNHWMcCOvoX8KJZ6bMV1Mg=; b=jDdk1o2c0ScQp
	c0eE/FReFR4+2cFplHU82F5WuKstNL5jgNUE5c4ba7YUuWqEhrdNP7o4jT1z1LuH
	H0n4Wp1PLcULOdfpTRNldC6RkQZ9FbmTH7e00ksVRTtAJH69mlNdy/dvKrYroeFd
	i1uUrRpl63rlHz+1VzeBw0esjJFJJ0=
Received: from 15.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQD3swEMsP5q47whAg--.22637S2;
	Thu, 19 Nov 2026 16:15:08 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] usb: dwc3: meson: g12a: disable vbus on removal
Date: Thu, 19 Nov 2026 16:15:09 +0800
Message-ID: <1795076109480-15-f562c8e5@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: ywQGZQD3swEMsP5q47whAg--.22637S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF18Xr1DurWDJw4DtF4kCrg_yoWkKFgEk3
	Z8Xr4kAw13AFsrKw17AFySvFWjga48XrW8Zan5tw1fKFy0kr45ZF40vr98Arn8Z3yUuF9r
	W3yUAFn3Cw4j9jkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbmkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5Mc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	WUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjtEf5UUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQMQD2r+rmUDOwAFs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_001518_885723_7E4EA50A 
X-CRM114-Status: UNSURE (   6.37  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dwc3_meson_g12a_probe() enables the vbus regulator, but the remove path
neither disables it nor runs the suspend callback (pm_runtime_disable +
pm_runtime_set_suspended short-circuits it), so VBUS stays powered after
the driver is detached. The probe error path already unwinds the regulator,
so this is simply the missing remove-side counterpart: the USB port keeps
supplying 5V to an attached device even after the glue driver is unbound.

Disable vbus in the remove path to match probe.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
---

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index ca07e813fd64..4d68b50722e7 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -847,6 +847,9 @@ static void dwc3_meson_g12a_remove(struct platform_device *pdev)
 		phy_exit(priv->phys[i]);
 	}
 
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);

---

The vulnerability was found by static analysis.


