Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FC2606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ng9hDN+x;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XuK8oXkW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=; b=Ng9hDN+xgq2a7H
	MyFlpZep0v6vJWZH8lu4/iGgd6Iqa8tpJcTh9tHF0awMKlhPk9a47gy1I2JTBZ9/EZiLIZCOpJ1Nh
	BTlNmjQruWl3G/tJ8LexrCRQkbt1wJnnPv7jQw+C575R4IjQpkf6e1svHC5LsWVbuYRYFL6Y9nHNM
	iYN3DBTRDqScS8d6iWJks0nF1IshGkQCCtxwKXYCGe32tAmG3twTBdgPNy1mC9nm4WLJWVZEB2z6p
	hSpWGuvqA0CqbsSB/mOJ3fiRygK4emgfTUsAYyb+Ud2QGpstNEojG/JlEdpru+o/zGc82zZ5pOYX5
	Xmpl72QeG0FHxMwOJSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EC-00000003xME-0Va0;
	Mon, 16 Nov 2026 21:27:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4E9-00000003xJN-1EZC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso25500885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864419; x=1795469219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=XuK8oXkWnFhRzaaqPsjhMIkuztFvfd5v1D9yMFm0QBnNxtUZtgbzJ3eVaAD+eW+H4x
         D/HsZ0DG1jNe7KRcIzKyscMjvFOIJ8Kq5hHoG6bDmMGJKa2DE1N4w7fA5H60atSM1v4O
         h3x6W7djIGO8R8iD6dcqdoe9tAgI9j+RQxJdViqIVK15wdNO5u1Zbw4I4gZmYuAOjwK1
         CAF0pFS+bp9crw2YxNpXzZR72lV+L3jUmG9jpudDmKUUmE7uRYj5uOBkKau0eZfckER9
         nwvow+JnNjSCT1UAPnT19dv9w1CoZb11BRYJHfVJjdnS3ojLMFUAwfV/2uo1HZT8+qdw
         qwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864419; x=1795469219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=GRUadOwIZFasFC0VthJkqmTwrdKvTOuSD9f7J4YYDChm7XysbrA997/4ww/GGbsn+V
         R0UtL3ymlZGGlQLSk6fdQSPSau9QHYSfSNsCJXzSu6mgHc7/ifbCbCNTe172IKJd0Wyw
         00nvvvaqvvsYM1zVsD0EfhgL6+YfXWfcuuKKx6WH5a5tKWeIUTTJQUwezLztYjYjqnQW
         9m7SzqWjOi5fkKJzNH2+BuayDbbQLhgEoDTwYwI2wlpPjOxIDWd+zbOXOwxSwuvEZqWU
         VfjKcJVWoNUN3+/1X/N+OG0qA+66cuK7icOeqkGAMf8Ouo65qwFCs3ZdN8VRvVJ/UGnK
         Ezzg==
X-Forwarded-Encrypted: i=1; AL+hErHtm1IIFAkyOcHd1G3m450AYEl+ONhelhh+SM49eo809w7SZMhcW5rw72yzdt2Z2xvmKl1hlmowYDrnC0Nt0tUh@lists.infradead.org
X-Gm-Message-State: APuU4Z9PWNGkjdWdZyiAFa4Ga03FciwOcg/2azZDiyp+gtcBiznNFlJy
	srDfqgyRoZ25DEgUJiGLz20g4ckN70yz8H3t35jK3/GrNJp5sa5YEmrd
X-Gm-Gg: AYBFou1TfSlM/7F18emdr3gHPOEi5v1SCCLgc4iYL941AGLUbogpwfXr2R//v8oqJOi
	h26yFKO7Nu7w+ZHhDeURjQo0paThPVkJ14A8cvPtadAcnbusmjOZyYwSKquoTa7pmsHTvJ0RlR2
	vlDdTjMyVgJr3Wo/lfDar8yVvWfxRlj5I1Va3DjaLQyvvPSL+l9brmbAw60iP1vtcMkpirBEl8o
	o3e8Jh/3B43HxIR3IKnq4PJCzsVhMryoSfdGMP/xDmslMDddma1pukuB4Lg+E5cEU1O+aljr8dl
	URveumlss8HMmqBXm+jbMMTVED3QGheb5jExiZ+ZvC83FUCvop/erw7QI1ULDHihAw8vPqIgs/T
	+gOdcPE3E9JvYODcw0RVCNPmOdYcPFF/dUzjgm0uRKJRWJFq1Wd6fJ0fa39wbXTsdgMXu79KMiG
	2YIJ2NQYChDnnR6NfHvoTeHW2UUBMOhRDqPSDnHnHBYjbWbJRw2VE/MfWC/pqyPduea04NYVVVU
	r4/ccR88vVodFbXnC4eBnv5hEzLx3kNsExdC5Wy7aCwI+lSMqgza4uRBcwxn/m1gDvq2VAR/etG
	1373dF1DDfWs9T6fJsRR53UFvBaVIAfcBPKQ/FYa
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr184592375e9.22.1794864419406;
        Mon, 16 Nov 2026 13:26:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:20 +0000
Subject: [PATCH v2 04/16] dt-bindings: arm-smmu: Add Halliday SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-4-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=jdhSJvOgnkWCr3N/XewHYvU/DMh7fs9E9l4PMB3CyD3bi1r+fHKz+jcOeuCkYmmgxW1wl/a9T
 LhE9PjP/kP5CRKJpxWsTiZqjVGzsx7uCz1lP4rAnXmBZayBQqDt+vzF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132701_385735_7E46F126 
X-CRM114-Status: GOOD (  10.38  )
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

Document the SMMU-500 on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0


