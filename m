Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069FE606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vBLfetNA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O5lb+44a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=; b=vBLfetNA8z7m66
	VxCZJi6M9X+tFbdMK1OvejIK+Pel+qCy8ynsL2kt+wZB5AE3Td2QtX0BOQQx5Lza+WB8c7i9NoImd
	siu4YhKM7omYisT3b5V+0xEOTL4wX7y95aaqn00S6P8OxkTP/BK7oft0K+Lu1lyq0b2GKY2lvtIHo
	+hRMqThl9tanxNDWcpDm+03KQRYjlRKFmCRhKwfGHaqtZUfwWcJX+ZVdkpgNEDO5GogoZ5TjUxku1
	Tr0lQvtwvQwbJjsjzfv5DpMyznMCYGvu0FLBahCpcQsX29sb7etGc+av4mWLY33j66xo1oB3tp8yo
	uEpkfpRSk8hxJIP3D3Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4F1-00000003yDA-3P7q;
	Mon, 16 Nov 2026 21:27:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Eq-00000003xyQ-1w5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-49412eb1474so2016072f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864463; x=1795469263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=O5lb+44aKWOleTmclpncML1Le0njgeGdkwuYIqIxBRiMoolpqr+PF5fLCIlXWWAsWt
         3T5kG2OMuIkdUBxrgsJGPBb2zP2kBaA6ndFYb89rDCbSt+cXmtK1OrgddTpr2NH8vsTB
         HXhF1/k/yc1i3hUuZGJQUGvfolziKXOEY96i2SjtnkruTUj4cHgYZ2o+IP0LrGbZMqWO
         JkXVVH5AYB83OqRodiEzqH/qkgiHFsHNTKbmdC0LTGRHt2qccsjiC5lvl5zKsoeuF4JO
         2BxoRWY76eqaKDX09Cb7U2a9vOxGIU6KD+qkO8KJoR8oR6wVJi4EE+cPHZ6SuRKEIyjr
         TL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864463; x=1795469263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=HqRKPmJFkFVAj4vnPTL144ToQGcv5e8US5aPqDA9EEDt3EJMBNxg94eEEviJ7DDPjQ
         /qnv/19DtCb40aBweID6IaiZymjHgxHQFvlWJwqsPd3Ce9YsoVUEjb4pitxFtPDjSeYT
         PNzETdkTIMHnqPaJx4fPR0wyHoDTr3G1WxP35kzHECVi1EJMakuQk0VQAEzErrY+eXcb
         /5tobr/eCzshkcefenUN7obZkku2Djeyehh33/98op4RXn7QvIXIYVUrVQ7In+mD2JRe
         wyi2DJ2zSYHpLhQPX66fYSwR9jiQe/54w5bdqJzsEOkgN3ppaKccTvoVN8wjWSTfdvNu
         0pBQ==
X-Forwarded-Encrypted: i=1; AL+hErGcJoF12xs4l/8YjCybFK3lF1/9N9gsuRV9oPKA1V5vY9TxaSZTHYwC4LBW6CZfevY4HBvGmTvhkZI5JZJIzobH@lists.infradead.org
X-Gm-Message-State: APuU4Z8YjjIhidc+SuaMgAetXiqnvI+seM70p1903qoaoH96bsnEyfRD
	vrbN2KYxRnD0/fW4JSqsZbUKmTLeGBwdRW0ViD+WWRWJmxEKBU8Dbt4y
X-Gm-Gg: AZFdTZd9kK6E91QT+bkXGKz4w1901onT0LTpFJbbLTtMNWl5P06oUBxrgvDTc+91fR4
	yTQZn115y01EUWZZ3eKOzs5n9fgRcGKJ7hogffg/Ke5aJ9ZiJlR3mTiRrSxTkugrsBJnXCMlyRM
	NSN+cOi3VXlLmyZD8YS1jyxxeoWNaawY45FsCYTmGEMGo42d4uA2+2GmbxIolBD12UjGJFRmTe0
	jw9BfFORpuJC5Tnet7j1Jw1oM/AWWtfkyR30FyFoSSILAE18o02ROznU/9D6t4a+G2vKtEbM3kt
	kdWcYVKE9zGlAfkpyMZS/j90C4sKnMVeTj9tq92mSjxC7QCEyQvwfFbO/lBHNX6/BzGCXuIN7gD
	J8GK8HjrYGZjKjIe04U5tV6a7pXTenLr1JK/Mg4wt/sbNQ9yWNBidOToD90khA1oKYPF2i8hX+C
	6nm2NUrjZo51CtBABwM3Ge+Rn+M3Z/3Gx0wFkyf56v7gDtbg15PgywMzIGYnb98ZKe6vI8DKQF0
	guNG89VAeQfj1VCUAcLBgDulOyVnJzzrwRIPJ8NB59jlh4Cd0w/Rhyh0a8yIkoLpvusf6WWTXNQ
	Z9F8TfZrBpGnhJ1IOC0ghPTKshL3lnNiI3vR1TKK
X-Received: by 2002:a05:6000:438a:b0:491:36b3:22c with SMTP id ffacd0b85a97d-49c6e68dc41mr30686056f8f.1.1794864462819;
        Mon, 16 Nov 2026 13:27:42 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:27 +0000
Subject: [PATCH v2 11/16] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=lNijzEKQlyljkWzaxIS9zrys8uC5qiwJ2YpuyG3Kr+5tC+QMb+R4Db6kOwLBwj0GYnOv/QX+7
 5U/HlbRtrBQBhLGehnhSLzxDVWEhcpke2OLw7yIeYTlC6a6mrQFU5kI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132744_560427_91663137 
X-CRM114-Status: GOOD (  10.09  )
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

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0


