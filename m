Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A91606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U6yai0XS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORdve3UW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=; b=U6yai0XSAB8SbN
	YuP3IPdgTCWBRMGgKcEDuneoSGV3x/h03d1fQPcdD9cF6CEbPMBOeThQK/upefpfpdRLeSw0wSuAB
	Ud/3wn8UXDPV0ehzPWj+4TnldUorj/c8lHFYaF88X8LeN6ZAXDFvvznsy/7dAe9VJH4dL24KXcjwy
	g9k01xuwUKeyyj6SYCbNP/HkcWrBLHqVjfK9pWuk/m3rafoid5wswQAHuqxscjurAWpyBjH+NQBjG
	tRQP85Ti1ygibbzroEvv7frLm8d79YtpKW1cO+PaXl6pCjKO606rnxczJPyAsFWDF1IZWQyqDn2+G
	KXWI5n9MINSsPOHSyuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4F9-00000003yMW-0jBH;
	Mon, 16 Nov 2026 21:28:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Ew-00000003y6P-3Wkv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:53 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4a32576da88so278591f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864469; x=1795469269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=ORdve3UWHrNNCcK58tEMuPdKn0dfjcRxBykzURupUq2JIcFKaxBaSAST+Z6O0qhcqP
         7nATw+OeHdNvkgoJy8/MPSo3Qxvo0o/+ycAnrx/awzY+EQSf93kN+8Ih97UY6UcwkODQ
         B4U3VjUvUSwLMR1cEBCscn96ufWkOZUnkfOcnZ5zWTdxtR1i/IxYGvPaaZ/YEYNSY8ul
         j5ejOaeEVs7b1rXMM98TFPRmx+tIobfTWDNetKlSynWlxgm7T6tMX+k03fMfX8S8Wklz
         QBjzvlTPe7iOYfwmKxmwrHbJC/k0FUc+Q5O+5v3JflR+gI8kledbUO+lhT2FQQ935EL+
         /wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864469; x=1795469269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71llwBK2g5L/3aP4XIqqjFuJzuH96CM6TuERsII1mR0=;
        b=Q+WxRGuw2fCXax+OQU1KKujcHBu9vlDyRIiXfDi2SeqnYzyho6t3KV6dy9nkUSaFv0
         fSbudFgJo3EMIbz20IlgK63MK169rIwOSnF9v0NZszGCi704dKNKpuI5aOg51Nsrzf13
         u1iwBns4LPHiG7UFKsGyTMx3oTdN6LZhNwT+7euerSq2MCxDPmaPfdEy6w2pssqGrwqL
         fV8u+GkS3VB0qxAnLizbOJ3zl/0OPdL5xONniXe4qyxDLTK4WQxwgD/F/b4MmOkvB037
         7jUC4Wlg9ksITZdXbijVvkSJ/sz/cyfX3SpAY1xm6j45fLyAhLIAkzsrWejvkwU5G0h2
         tdIw==
X-Forwarded-Encrypted: i=1; AL+hErEIGJkEC1LYIIgrYcq2gYc9str4rK/hrkVFGkMi4OPJsY+ZOzSH4ZNNuwOtpC+qX8pox5HcRmRV8q+/1MRCHceL@lists.infradead.org
X-Gm-Message-State: APuU4Z8U+EgULLaPD92wP+0tmXDXJ4RSbRlELnkYkLnMIO5E+hW9wBKv
	XnN5LC09NbOQAiYEmT8zly/W8vRhotl+wRzFAHBENnfwFmMRLwBxWj5q
X-Gm-Gg: AZFdTZfG5pBcucmuxk0gbqrmh81T1uoexQLEOTQv+M/9CsJybBK1stQFN+v4zn3A+1Q
	iyVYk7CqE0ZS23FfsJ8gL8bx5PMjn+GL7CZANgRjbaLlDyP0Fftr+LsSxVSDHRWDBVr+cdNUOlC
	xmSGK4Pi/y1eAuObVITI415O5VSRTV0Fme7zSX7gL8/+1sGiDDjZI8drWCVW27FHEw1b17yaQw8
	t32JuxiEFCYTxh44+UoqkzHId6VNnrS/PqbH7eL/tt8lS+J5/MdGRSs4VR9J8ccvSLDNXdLyz5g
	T7B73njRkatl9I1AU8XgGEfqUERgr+bBKFVu9uPzWqhlPFpoJB4/FIMEL3iW9TFz4BKxnQ30mgu
	FhtycooDZGdmQtgs2QB/bMfDSHuaMRJSNX3nBaYDFTB4D54XX9PyJ4niGl2txG6GcxQzUahwp7L
	v67Hx80LRUr8O9YUwjUr29MUWPX+k+OTcUzdRa+QmOpLevXt6WPGqbKmb4WOc13pyLuk5uy5NO8
	iE9wYNfVMeVEhAaUg26d9cij668DOBzhQRBQsNXbzO5evXhzfiS5hxotvsBBEh3R4iWXbZrvgGv
	gSTu6AMI5RpuGhIv6VWW/M55EquvJef/Ep4AoGCi
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr24445384f8f.13.1794864469242;
        Mon, 16 Nov 2026 13:27:49 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:48 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:28 +0000
Subject: [PATCH v2 12/16] dt-bindings: arm: qcom: Add Samsung Galaxy XR
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=2338;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=8VdPKIubIS5rrskEMQXxsc4CH/xmK2NlYtvs6kfcSuc=;
 b=t9apGIuBdbCgnaj0/1UJjnpEZvArnjOHWwiMxnYe/9rnq7pKBOWl7S4p0La1YJLjWlXweFSEs
 dlcpSLrFw/hDB74P8wfi7SGdvZuxbRKq1frXt0fWIbXohJzyyH4p/WF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132750_933508_514E7D73 
X-CRM114-Status: GOOD (  13.05  )
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

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P), and register the "halliday" codename in the
SoC naming convention schema.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..9d392329d437 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2a77382a9f25 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -106,6 +106,11 @@ properties:
               - qcom,glymur-sip-crd
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0


