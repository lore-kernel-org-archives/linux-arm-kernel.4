Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ABF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r+7Tm8t4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PlQgilAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=; b=r+7Tm8t4eB4/CZ
	YbiTX7tsUieQg/ZhfrvnGWymd2w1cmMq7k4NNI+H0kI9LTLdFdEBnAveagcIwY7beUdexexbLwq6E
	pqjFCZoUxwEaSVs03GEpDo5i/wJFrKSRcToviLuLtHJW2R+0wzGlH2tMpZWHq3kYmtDZGlwiHGHbP
	Jbx5Vy9cC3eLm5iMfj38ue7/GwEkgTYF12FXVzqh25TJ4xtGcGOcLZJmAdRkM8m3kKSYcndaSsaP1
	3tDKGs7gbFrlAHVWDMhHwu7wa+g+jbZrJqcmEfXF4l6clfzYdPfIbqz12VZha4Hxo1rynIntvHikE
	U8Govq00avPytfW6GSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3wA-00000008KUz-1VO7;
	Wed, 25 Nov 2026 03:44:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vm-00000008K7l-3umQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:44:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4b467581b98so50805495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578265; x=1796183065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=PlQgilArtvZlqFE1maAM6WKiem1HvvDA6/6rl6yI7P0+DeuoanXZ/lV4UgQYtbcmcq
         ERNI58TA6H5UzJwBF5bvch8e1TXDJ/3gLE60ohMvbd3VpMqhFS2xINKGkEm90rzP9HCM
         keNGxr2oFUvawEEtzUx3USzYACQw+dmlauSyphM7iuozsEVFlFtD+QQthaV0s3fFc3yd
         z2R1+CISW/3k0ctVXV8fDVLzICECuQmkyi9GfoHiR7kRh6rmFmAGrIa4dDADHzuHVelR
         aiwk3kPYuViNUmx5gV48Wjuiep2/WTQRaw8qxDiqAPSRxzvIZyUZ+0yHD27Gd5GLRmzR
         v5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578265; x=1796183065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=AFa7+hSvFmc3BQk+87/rASuNiXlzX2KyY0u+SkRVk/eC+A63FPuqoiCMu2DLKd9g9F
         Y+tsufbbGCbZVlU3Pyo6h0PFRFNwA4LXOWId6wdu52DnOtaf7wrZTwfq5MRjyi4rmAce
         04+mfWDr7p0bv6abUzbL5z2KOcrUcs+EsP30wJLdxnZeSs9Ka4Oprqh3L6okdJtOLyF4
         uDqnA+6g3buN+jejOGX7F38cfwpodSqYdklJX0X8mGiu9lTlE3bRO7ja+KRl7V+0TiOj
         4XmuA+WsP84ArK23cKZvaygOx1SxAorxA7VOSPfj7xyqsKlKvbG152iJVVvwIyMBXB0t
         6fkA==
X-Forwarded-Encrypted: i=1; AL+hErEobr9RlA7FqHsSJue4Dv3l45QBOcb6UEoeLOnMq9jkef1dvfQ0aDBENujz5ol35bUB2YBVFBeMnHeYEYAIdRB1@lists.infradead.org
X-Gm-Message-State: APuU4Z81W8ZahiH0E7+T3uGy2x+ZTFLnRRyVjKSpJ3/usVish1LQnvu3
	O7+4dzXyLBZPjE8vbMu+Qipx59kMpAVsms/viPICu0GqNptPn9IYzhlH
X-Gm-Gg: AZFdTZdumiS1S1bwH5YmHZ5uheeo1B0xWULMWk0ZcSJL0fOyWlSHWA7DuiTb2yXpjjk
	56kXSyc3anM1eUkQHDkdYzNY/9ul/KhyXGF2n8KkiS8M4vDrHrtmHpfOtsUMtNjhO537EQAk0w9
	SLsqzFaD0jc262SpUPhmkTFmPyPCToxWoXxIEPhNjJW2RTn502Fda8/FPTL9rIcvNPTapi2F5L2
	jtRwznlShwAVedzo1GKhe+1+9wHqSt8SsDW1Fb8ThA1JX5K4iLKJplq/46nT/qMfNEy4pDsKyGV
	JYZjeF/YUciLZJFpTFKLHI4+ZL38K8ynDx0dOvfUHetLxKI2o3nnG0kNacCOqm8/ExIyx/CM/Ln
	6+V3SfQEfcFonkKACTyElYGywQzuAJ6G6/B5NvQlzPCAO8mDoagZbRBYQm35SORzYK6Jk9A1D4+
	chezAFqCYR+oguEB9tbfac8WE4nLHqEovBK7Hk/5PZCq4XCKLlE6ZjgpZGRpHwyGoVtCp3NVy5Q
	CFiRHmE/eXh0jyJaX+Kz6oOmuOTij+TFZUp3HaNKwf8JQywsYNbc5eCjXsbWhlTAXwn2PlXW4tb
	TMLkroZEVeFNOIXMVsvUjsbSr4zaBf9XL2gVtIY=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr314413945e9.12.1795578265228;
        Tue, 24 Nov 2026 19:44:25 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:06 +0000
Subject: [PATCH v3 10/14] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-10-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=ASSSZ1iPRbCJcDXI+svsrzgQJoNbt/i5IYWaxMLqGZRF5nHWw5kJhARXjldkVDjeYGCb2JyQL
 2OZ0LHRj/DeD6xQR3UFBtL7exxUKJQpjnA5HrXZmN3rAlw9HlvDVkc9
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194427_053754_24A30C41 
X-CRM114-Status: GOOD (  10.90  )
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


