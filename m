Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D470606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h/e91wh8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gv3AER+7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=; b=h/e91wh8uSm5Kd
	2LkWgE3mNjHvmWVhboEY7MFnJxkYZ/bBIpyCVJaU9oOSFDtgUIEujmn+2VLNbwx23nKgUU8MQu7ea
	pUmNBhvjg7V3h/6nCt9L8/NLYZ+lEQYumcaro+11DqSCoVTg8gwtkdPxlqoK+X2Z1dTUeWMklsT9p
	5nJN9Y7y7pLtFRhFY2pTRxjhhwnQ1Ez7M0O6DQa5aF4l57VUor70x++27Y7QohZ9Iy7QfBBHurryf
	Vfj6qbr9e20HrevYhJJhj2DGcvfjYARbCpP9XnerlPxj/Tfos9Wf96gKP0SGW7zLgVZO31zFLGSwV
	2GRUISGLrkeyRTHTkyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EX-00000003xe5-1iaH;
	Mon, 16 Nov 2026 21:27:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EN-00000003xTs-1und
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4a357b1c649so215182f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864433; x=1795469233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=Gv3AER+7ED4btkbRklWj8howqHLMbzalL5xQpH8PetNcloxqlEI/1pggqM3EPwP1RU
         Xo9mld6ag3X2pOFmmp2ltU0Lik2I12D2rm3neFPjZCgUb2JlUyyJ9pPkDuO8YJtTFTuS
         y6ERVslkFZYMXf+qLvmIQrA/1/TaEgpnKG7j3jnIP0BP4EBrNIlhy0So/Uuarn5FsrNn
         uH0vkxDbxXBi5z4BZ8sSFFVhPS1E5FmoV3Qf3sISD7yQ4I1dn3VF6nPxofnYZWztW6TV
         n9sKnGqBWwmGgYUkk9I85zpQIUEnB1CmwH/XbZj5j4IQ55N/pfKuK7ECxfsfXX1E9Y24
         vcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864433; x=1795469233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=BASN3SqQDB44VyLiq5UTuCorQRNWpV0SYlpIM3PXkawPLuCYVoaAswuKDnXEJsmTIT
         3kQHm/2qICMNvBhpZg0SBzhapYpAUBM38NOzYWgYYNpemJ2RgPKkj87mqi4KspRJrLuA
         CP54xj1PibzTe7FqyXXDlyWRf3EgmEQomlAZrwtaV73HjPL1WNw+phsCPrIxD0zagOOv
         FV5h8u1doG8ZiOwjFL3ONI7Ga0JC8eEoqdILgx+RIR9BYs8C8E1xjTbwGiPyJBd6QXIg
         7JzBAwHbSTRv24Lz+gG/kXZmb+e+W20XCJ4YmfgSsE3x9hcG5iR+vvffy7AL1Z95CY+X
         y2XQ==
X-Forwarded-Encrypted: i=1; AL+hErFBZwwvtscZVY9PcgeMxJaxrgdQ4uzSGjiISyhGEtlGddkDdbQ35B/tbppzhIyPzGqokui5Z1LbBGnceUfxgML2@lists.infradead.org
X-Gm-Message-State: APuU4Z/z7JiGZB1lyTfxoDEeM7NZHPWQxM6B+V9thIJhYlS7xedgeRXw
	vDkwF7UQeW1EM8WznDOO3hWZXER7pa2D52eJRaEXXBHx7idw8e4XEC+J
X-Gm-Gg: AZFdTZerkKs0McCxeWRrTII8D3gsxsHYaNetl9rYFlu3ekzSfx40VsGfXIVP42ZNm9G
	SaSglNUAorTandFZd5M7J3IbT90h0tOu3EDnRRq/NFu2rAyGXRQHiaJU8kprg9DUMvzdtuo0a3x
	y3oFCvFL1lVViGB60o+MUtQEs0QP/sA3v2nYesPs0axSL5/IKWQ3Nb68yp6/nXmLIHHJ2UnsKdI
	jlQeKkq+uiUXrFXorTYAjhg+3OFf54krlxFMKE5aWdjOt9uu/3Q/X37xZI0xm/vDgF6KOPbLH8X
	SBFhOwRRn5XB4laHXwznCW15SQm13KPkFpc/UyQRAk9vHe+FFezrvAjCGOO3cPg9CmM3AzGJDF+
	kOlRvPNFc1ditQqhIWpg7knE41TazVR700xAQPnD8zbT30kdxc3xPt7fPld8MKAho67UdoDE1Ku
	6j6Ky4NxstWuZ4hZcjbVgbuit6+aPmGgkTw3I8/sB1teDzwbDMliuw+seX6jvB72SUOjgFowaff
	nNg/CYOBjVkR2dAcVspNv96pq3a27gdQ69Uvclh0p1fQthmYCS+3HGuDc42qccCGrRu+A7GGbgD
	lOrF6un/wUcuofOPGVeP2qgE4Ya2seRu7UFA1f3Y
X-Received: by 2002:a05:6000:610:b0:495:5c83:51b9 with SMTP id ffacd0b85a97d-49c7467a893mr27328310f8f.50.1794864433590;
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:22 +0000
Subject: [PATCH v2 06/16] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=XlBnHuuXKSsmwBoy79zd7CM/aQS0V4vz73O5I/ykrhOgY3nFJG4rnY0qnm4zfFTA5sK35VFT6
 GeLVT3WztE2DdDA/hh0iSPFr/rHt5tVJ5B9S1do1YbNU2FqHh/CJpdT
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132715_519126_81E9B3CE 
X-CRM114-Status: UNSURE (   9.99  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0


