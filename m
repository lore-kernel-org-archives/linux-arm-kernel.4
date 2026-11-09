Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C1C6082BDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sz5KJzA2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5nYnaiB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=; b=sz5KJzA2MzRg4u
	SV8McH4HSGcj6fhIMrvAR1GsD2JuX3gC7JQV/cgPC2IdeNWjIxB7Le5KyEt2pvkviCS27lzacZXmg
	mR6t0K5e56i2E2o5B71bZsb1tms3TShCB7kYeJsd8q/Ixydlewr3KI7h2s2Dhh+y4lrTejq/Jg+4E
	lv+rK4k84iJeamZbPPQkRzBlQCFOypvrK7Ri+vd63EzWMuveMmkQyYaFfKUIsdTH89So+9WTgdV9m
	VI3oIzm0CKK5JZg8ZYHz96E9vNiITzm9i/8SBUczL+PsTAKxWPcwOSbxJ3Ykiw6BQCJB8AkrsUp8o
	/2HLrxGVXh4uvYt5NgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLg-0000000GzK0-0CVc;
	Mon, 09 Nov 2026 00:35:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLY-0000000GzBo-01cH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2796495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184490; x=1794789290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=j5nYnaiBIgy7UVFszLMMS/qGW+EyaJtX/c2nQ5dGZERHc+hZ5ix3Xzb6jR3HSKmCha
         ATNn0eHYuAaTSvkTBT/LR/fClq1k+uJHpyXXXLvqCeg2CqULDMVXYJzG+mMTDC0dJ48Y
         4VONloY0eu2pldrJ343FPLys25uDndzxhUq2KiowDL2o1svor7ffYPFRO4QPrQDeoiAt
         tjJwW/RFdbRd2VSqTNA9I2S+HuPHTQx9anKhnf36hwKcFodVoGfmytaK+4LvufNCDhVi
         2jNCuqwLnQB8+PFTFNuQW/99HP9/X5wNF1CSV8/cPH9DvViXpwAv7Czq51pFVupoq8vc
         7v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184490; x=1794789290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=oVlzuQphrEhcZwjyUL5IriGCtDrCKFH7uJSq3DvlFW402ep7/iYBMUVBa6e9OT3CgJ
         HgpzZACrf0LSbJWiY9HRHpL3v3gLnXzDOfibc0HUAZiONd727ZCgU726aQS/YbyIjo4o
         M7k6czjvjl36yxwd8044KuFBuHGlskrSM96qu7ngBoIrVW3fdQP0gRSUaX78WHmBan/2
         H7EOtFYHSYwji4t8TmGZp4u6mlEgurXmo54RQuY8yBW1clIlhdYYtKPpwOZGXcOK73Ua
         AkYWnGRcXIc3cdbp6D8WjvWJPNSgwKJufFeEjy5Q9mEw3O8/k0j35bEmBbhPD2IubPls
         hFvA==
X-Forwarded-Encrypted: i=1; AL+hErGWfoX3eV6oTp+ouWxtYTYH8huNrFew6WHnz2Bcxh5WFKhR96HbutmGckTTzYBlo6PK1D/V3qVP7ADrIEKCqefj@lists.infradead.org
X-Gm-Message-State: APuU4Z+GJqRevfM0XkipFx7wNNBZgwoLvjIVhRGvOB1jGBcAys//rqdf
	yVbKDFJsLG/a9PajciuTr6Gf59fwm0fFFGbbhWwcSnfmyA2YH73Y5xqA
X-Gm-Gg: AYBFou2orzid6cM7QcoiN3CbZWiIdrqGSarY3U+Gsemd64t9cJqh4gQbiTGSl3c9KaW
	sIOuFsDlK25oeY8RDCoKPJhyKvQMr/JH/qHpZ0jojV4EozZNA5Hv0BmM98qMwQGT9H8EwKByFp7
	0jdIxY+unEfKXTdIFYCojsfk2i4t7hOydh9BPVVBevW2wZHsWjchRfItXXFkl5wtSSUGoornQ+i
	RqjnCPWMX4WFeXJwBBmRgbIeM87n1za+2JOWPj4cFKA0rUlzzCFq82Uf5PbG8D8n34FRMJil85z
	ckHmshuoHqcmsuX2ZYsz6i+T32io1I5i+9QjtZNYgcTWvyeudwvU0pGGpFxU+30yDEpIU20meS1
	O13zQF3P2bJ6WCKG9lrHjEQVZcgouawjHYHn0KCFtOF22miNWK0U4Wc+kY7fL0T22UFrOL8H4jm
	0qLcVGMR/EAw7xicyZ/lED//Oa2ZPwZRqpRzGS/b8Jf+fZQP3oFoW32zT/mYW0bEkEC3D1QPIxb
	Df3kJU2ecrKtv3qG9JVL9HrcokmLObcMqsg6hO8fbXslb0SKUad9XKvvDRtQbI5Ppxvq7fwAiTU
	CHcdPKziHoE24e/ykdLcadDnGk9azH/24a1g2qJi
X-Received: by 2002:a05:600c:6218:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b8205955e1mr111833455e9.7.1794184490117;
        Sun, 08 Nov 2026 16:34:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:27 +0000
Subject: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=822;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=GR/L35KkjRTQHIwoej6N0ZVQiPJDeokJdA0dH1/xcVk=;
 b=+pMC0hU92qIlScFgbvyLG0yeciXJR70jYMcQsgbMkAruvtq441EcqoAR24w8+H8PddfDvxdW7
 NeEMu0FiaHdAmbbpArcsFtCmr29OynUnIXhIC1Struq0XQSLzW/yMcu
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163452_063806_5623A24D 
X-CRM114-Status: GOOD (  10.83  )
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
Halliday SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..b96ee339956d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,11 @@ properties:
               - qcom,glymur-qcb
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


