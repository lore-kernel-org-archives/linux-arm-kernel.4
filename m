Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B78606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fNek+ecD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byyN2E68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=; b=fNek+ecDnUQr38
	IK1H+ZaZQDaxdtiWCPq+muW4LkEbYRzeOm3BCfsckdEm+jP2N5dxIjabT0MNLWTvEe1y+ylRq/z74
	r+6fAp9/El0e3u0W0llKg7AGIDTcNcyh4KQsFxtAeo1UiCgsry9LF6om4uCIyHxyGmNLSDQJKwNs5
	sgdhoBMiEJ0M6SWH5ion2dGytS3xV9FBItO0RtW7pAmAysnkVgg2kaANZ4hRLLlGhCfDGO3K2aJPP
	A/8A+OP+1dbSkiw4QdwERfF+XND+uH8boW66kP9mImkENxW0iMYaGEYUzUJx2670DKUKGOQr7il29
	fTXdiMmJi+kpueqdfmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4F9-00000003yND-1sft;
	Mon, 16 Nov 2026 21:28:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4F3-00000003yER-20Hw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:28:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490f38e9688so231029f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864476; x=1795469276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=byyN2E68RB31NScfZPX4AkyM1szgJ7JJcd70TGcqSQDJslM5qoK3gWCHlScWKFTVJ7
         AUUet8o4fb0zC2JDjx07kCXd4BcrJqamgQ1aRx3X0k2Kt0X9skoLwKnfvpC0jte7k2k0
         W0CgGkfnBb542176kyNKrwnRA1abPVV8KQ/eAPO06djoTNNNoVI5EB6sZQub3CFGfnUD
         Vly41+ySptJ1J/zp9y+27/IoVm5ZXKRKgdJE0v2LjCIuKUKtRuDBata5lwKGZqQxET/b
         Zg7k58XMyp7YXcAlt3KNRngO5D5sz+kbKzsgVZwTOOfAyadeCxYu+Qce7I8sUjWgmaPN
         1hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864476; x=1795469276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=sVyjM+xpy8GUp4rjCHYcaSroXw6Zc2owBQAinu1+Okl8IhMZ/gFKFrCr1Ok04n97dk
         Y4IVBn8H8ZDfOxOxFyWzvX00MJ10P/LdAAuyvYJhcBCagC0c9d1BQ+W0gG5MzAtw1Kh7
         xMlL3YTUSx47DN7twpO0z2Qmkrlu4sdZ1uIhNtdDK6C3IrU6vINi6rUr03dAqFg0PiSc
         E5TwZsFH+ITC980ETotUmykn8zzSsBRA27EB75A9m/TcAm/GVl6OW95tcRAexsKrbQm4
         Mkc3KBFGSP0KLYOQzqSMTRHDEBtVNrRzT+oElH7NCtiixeIfG4JqLgV2yErYUr+GyXjV
         mayg==
X-Forwarded-Encrypted: i=1; AL+hErHl90BhTUath+13fcR9O9/XGAEw2hD86gyqSHDE52NGwZUUV2YNdqDLUdiBi3HFna/xqTW7QHO+i2+1USC0MXvG@lists.infradead.org
X-Gm-Message-State: APuU4Z8wjRGi34f6bsHcWxG97pn/s2u1GMZTvs81KXrsdcj44itcGbC6
	9JY1wXQOYcdg4OW/vGRF8vopnqYJgciwh7QmhP2JfdSpWZsUSd5f4k14
X-Gm-Gg: AZFdTZcl+8ewGlcZNCTpdRqrPmr6tr/3gugasw9R0G4m/5iGRQ752xB8eqEmoIvI7Ii
	46GKSwJM0o+oBdT52m3HcFp/GqPaE+x4PVsPx7L3pTCRHZU19BkMr2p8YV+r0V1+2XsEuDhkR0T
	dgqAF09BDZmvxg4X9GM2CoasLC1tPwmFkcPo5kyo0kWJJy5GZEruSRVCevKwmY29hlKNYkq3BbH
	R3Zpc2BTAdNwxQSlrdAfvTsNIRr6P9/NFvHlLHiZh2l6tprOk8gCRZw8u3VRgNjdZZZU743gwF9
	EN2cb9nyuiCsSHtRxUMTUdG+H5OySu3Yx6mvZeTK2VRpaAwEH7/ucUjRKoq37/XbePDGZ0+tVdq
	WF9FjhzoG3hEl4ka6diRemSwT9shL/4oGWYRpgPJyM8Hw05XdzboHIt/p7FYwXPV+ktNPuSgjzE
	gbZgaqXXIZHrIeysWK8kw8PUdqAfydsrezGcmhwNlxQ7KKBtKGw2Dzt0Q0Tv9pXTItdgN09EGmU
	4aAHF60MbC0AtC5jZ8Izxg1ihrv5F/HdustbLVbjuxf4xRb3kAsUBRHIvGaimhxzsS4wPooxQXE
	+4hZ9LDVB2BXUEvBNQcY9xLuNXMnOwxfotOSyw5qLBhkzSitaUmYsxzGMDW6bQ==
X-Received: by 2002:a05:6000:4706:b0:49d:8ce1:2652 with SMTP id ffacd0b85a97d-4a36bd51c5dmr1648244f8f.1.1794864475624;
        Mon, 16 Nov 2026 13:27:55 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:29 +0000
Subject: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for
 SXR2250P
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=746;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wp4yEFlEeRirWebvDUNwJG87yvgwIo0fuTVgUjPIFVg=;
 b=c3M0oozAyWICul1zqZyYV4A722e/xl51QI136kZKSBBz/N4l9sptO65yuOtgNCZsSpOrbqAMq
 sRMLJj/ahy6AipZ7ofcwU1aakgIIwxaL8YroDdkKta3ZC/C45UuYvvM
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132757_584602_F0A3F702 
X-CRM114-Status: GOOD (  10.43  )
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

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0


