Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470CE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CNXUf1CK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfHaTsio
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=; b=CNXUf1CKhJLKtl
	bp0kmPmSNqKnWgnVEhsGN87RHoS/gEQlzexWnQmvibtBMSbY7yVBcISeif5JWq/nxKpJzKDZ+Mz8b
	Ieishx0DqClS9MMbR4JODZWQo5LYEER/t6gBuVkZdULLWd594VgnpWZHG70wmvU2bZ46rXtNJN7qY
	4KL19OojQJ9TdJHm4d2Bkk4ZT10TZGfss0ZrVgbxB5YPe5sqt6D8yoIVfvMoK37JCzc4ID+R7UtHd
	cBSpbgNfrNWbFV9hvH16KyIjStJuu48WJf1t36MEz3lB3GDwYRsbnRMSpqcaQhj4TQ4NwSP1YoKPe
	ZJduCA4NMvBpgkEoLBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EO-00000003xVX-183e;
	Mon, 16 Nov 2026 21:27:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EG-00000003xO6-3VSj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490d59c3edaso193684f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864427; x=1795469227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=FfHaTsio/nnm1EAfSqm0IDvDnp3hMkYxPmJuV6EHfqLuNN1GMTtwzfs63mc4mGXhjX
         /wKV13qRsdHmh4x5TICq65Ao126SkdL9bLNvlq/7pGyL1DSBqjuLYSdN2PC+wFkCX9il
         qv5zJ5v21kQKndbMm+tKsAYzwrqKRF0YFi7mbGD031JJS4mz1Z+Vk9e9Q9Ur2dw74ud5
         969R0cbEi8eeEvHFSC4Db/Jzyf38lGfC1a+gYId3yFXc46O1rWguv/qvgKFQ4sowUaBs
         oCTmvrirSbhLTGH86rYVMSMj6Obfw5buQ++aLwx/KJpvP5bs4lOuwXy2Jfnct/7fERh/
         Ve0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864427; x=1795469227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=hyOTcY6EmC5VZrJiASaD87z31vxLt8p/UJMAcvWZWaRyGDMgtLT1JkFZlo5SiULFEx
         YPUFX9k01YgCDiu4WMr4R8IZfvZqBKVZZ/4wUFwvPMLOaNShWqaPcl1CuHKv4I1bZwRD
         U05AbvFgT8ifsoBr8vLez+G6TO4pdBPg67Vb5cKV/l7ULVyoEdcGQJf1gGBCttndy4zG
         nqMraWyftWztZqLWAtHZYwYGEFGQWAlnC2CZeBvSYVQivjOPMKS8/fP/ZHxtkIlAwh1M
         bF+8LQ6KbxVwwFopmZVdz+Z1ha4oFxZOBaGEd71L/FFelxzujVOCyc5XyDiPrys4lQwA
         WxRA==
X-Forwarded-Encrypted: i=1; AL+hErGgJCJFcHsD90qNNxU8hST+0e4WWycbD3YTLm2iOgqIyDtXVZ4OUhT7qzVNezt4cXDno/1s8bUw2bo80gif9gBt@lists.infradead.org
X-Gm-Message-State: APuU4Z8F8Cm/osWKL/KEB/tzzuqw3ps2d23Xi7Wm9S10ci1HR+GwLgH0
	GIjYgdOk5vGd6KZwOEcvnu8OHPlC7WMz2bj24jc5N/iJcM2+pVZA1Fe6
X-Gm-Gg: AZFdTZehMqtym6taWbgYRMXjdt5S/QBDRIs0oT8SZMV/qfn6dojZwthRIK5CrLZRIHC
	8FB2qxWjKAGW7zPFeQKXHkc/eDn9XFaK6rzf3WRgMk1KkUe2nNpSlrZHZQFzajUmfSvimDKN+sT
	zSVGcp4md5lrNC72TTSyvsYih8OrBMFxDJlEdp2VjcDNogzhaI9mQ9+XD7JxeGwa4V5i5xy7dS8
	/GLSEs72V36QhF9e3dHxfh6Kt0fmFyA8jUrmiQeeZErz5JkDrDdWcfTTxfyrZoX8KKwNVuLzGTE
	Uy09+kTP5w0HbfrFDjk0ZP1SM7nSUwv43pVr8X3UDt1fHEv0EfNJxGgyyQ/0hPxme1zDNgo2S5+
	Q3lIBuAywlb6VMdJJigH++KWXgEePg1Rt2EWTmOJlfxaeNqY0fnFSly7aKxNZTnQhVTMsCxDtiv
	aXoosD3JLyHAsWBT1rPJI/BEOn5JZ+ELFO75l5yU3Sp3OEs057POSEQNMVGIWAANClGkHuAyrp6
	ZxMP6CHXblPy0KxCPSX8Qrm0UFFLzMhuvjcJLSEufFGBjt9r2EiODh7vbNmUxJmujcjyWraUlmq
	WIw9qShm6y/wLCz54yDl3yBQMF4K1CKjRvjImA9aIQ==
X-Received: by 2002:a05:6000:4a01:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4a36c30c79bmr1458441f8f.1.1794864426917;
        Mon, 16 Nov 2026 13:27:06 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:21 +0000
Subject: [PATCH v2 05/16] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-5-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=jodb8KTCYJuS0IWgZE7KB4t4x5w4vx+XqSva6vd9XaFcHbRLapvwh0kujvjIVh3aEijgselYV
 FDfNsOtrAj3APDDTnmVV1I35ZxWejVLlN13Q6QOSjvxv3VTGu5EUwMp
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132708_909673_B7B7E51D 
X-CRM114-Status: UNSURE (   9.89  )
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

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0


