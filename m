Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61290606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2n1hEoHi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7yZtpDr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=; b=2n1hEoHie9bhSQ
	lKP/O4P4xEvTse/asMjPut16xHZMUnOwZvVUjD0GqwkPQmZOozV9Vaok9GQlrMnk10R3SOGUzsI1G
	hm6L2yBQBokNhbIdqYSjg95uNirmjzvmfZvP9hs6hIy+rG84EbzM3V7tAmGlaN83svn7L1xAtW8cU
	Rqe1+IxWxBrw+95BvKggwFkRJIiaXfma6575FDoNHoPIK9tvFezun62Gd84+sfNne7JnXHHWPhUUL
	2i6ljVDrKFiOFhUKS6qa+gYOP4UiObR3OzCgaXbshLq3XpuXAYjtHB5ZHwisO0Oaybywyc1+KS9sc
	FS9toJJCZ49C5PwiqD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKn-0000000GySY-0uAd;
	Mon, 09 Nov 2026 00:34:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKj-0000000GyN9-1xEc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4919a880834so164956f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184439; x=1794789239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=D7yZtpDrR5GEHojZVo+4Ivr17MKWMc5KKwqrUuGiNtmpkD5KOKEaQCbbN/pgTguRAx
         pGVqa6LAjA7tFQuowE681svetJHs47AsyboYvCR7yayHQx+9tlznRAXqzUoTHCrbVrHr
         TMd9FeeQXHzEPuqvEzdzdO+y4KWSEZOlRuxmoAk+t6YET1qdwLSqNS7ACsKIj0PCaxvJ
         qBRxbxBHQZ1kO0juzxfUhup2lFKYn8HcA7zER6m0gCjk2wXpLx7HiH4IO3xaOQFBS/KL
         2/0njy1C55g1HM+c/tSaykitiVLwMVnhM9Kg+5TF9cRUvzagTX3upBxqTJwleBDD3t5R
         ZPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184439; x=1794789239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=YrHzYbRFfTXWQgSg6ISqDNBG9XFsppkb+wdKG4c45f+kOYFB25syoP0Zq4Ir7cghmU
         NtyclVSl8QIKa+Ki8CnTFzx62MD2w5yqZAoshgYq+TdurvZxug1MIHwBD5fLO3rhw2cl
         9wi+HqjvxW5ruPgJWOnH+H5x2mjpx+biKtuYFVj+LorV/TSRapzExmna9+Efjb54XHz1
         7eKlxHOINlP/Bs9R4BBA3yScOMjSon9EnFDNuoNcaDTR3qurJwY1QqJOS+plbsGchsmW
         3sP/KGbQbaIq/z8j81tM7OGSvqCWI79O8IihpNnIKQFCif22xt+QtxV4DWOrJ7kU6vvj
         zmLg==
X-Forwarded-Encrypted: i=1; AL+hErHs+jZF+oS+rvK+bUlwtirsQrrEfbYT2ZJcXkti03Nm5skb7gs6CsuZjYDMQuiqpFOM1Nn1hdLcpmWWf58RoMgd@lists.infradead.org
X-Gm-Message-State: APuU4Z9u9xjvXVxhOEuxic3mn8MR4/UCzAYksmtqu+m/TsjJI7ADX+hp
	nRTxc3yC0anFnJ/RsSyzvGDgDoqUBDZHy3U8HHZWl/uC5yk856bBTyPoOVc56GLh0e4=
X-Gm-Gg: AYBFou0e7mW24yOQnKdZBY0HOY311qqZ9hw5iK/UahkXHFQip9eWwVGP49+OQOKJzHa
	ol2sazND2Exiw+15rRCaa2PWdsZw8fWfYKeo2TPRxtd4iHv/D7u2Ipkzxu8uJDZ/9J3EyDT7/gP
	rhZM1938Qn9A4zXXPdV64EGh6OHrrP4XBVeKJY1YwE7SzCvy1/23GImxWeV3VBn+ZaFO0k59eqT
	9BWWKRe+NdQTJQplOE33UTikAVjn6sQewsAKS9KS0y92GNEILq2gM7j8Ye7bSU3qftmQlhAak1B
	Yj9nSgI5LhOpo449cZO7ymd5ZCHakqXQ/kEyDxzoX9pdKhTz242jUs6DpdDNsbfVrXhcyjkmfBN
	SK3u2D9OstIr5/FQfVgeWUV/kkAi2ak/YIsfjq+d3+UigJ/nQY/SfP2KcstQ6IjoM34j/YdV0SU
	l16N0GT/Z5iYQDlBVCXjZb+5f8d6e6v/GvxAO2zi+gIW6F84fNLp89dCk1HKmAAVZG+qHP2Hr2P
	iaW2Hbwtlxg+tj1x27VKtYwmdb7vACQP3hSqp5rdmGIXAQuENWEuB80bgjA+K8GExPXhKSrOcVI
	zptR3zUCRQs5HIoE21ctWQ/BX6Cx4Luh3kfvW5RUK8ux6pXTVy3CXfxbsH4BnA==
X-Received: by 2002:a05:6000:3c5:b0:493:2376:81b7 with SMTP id ffacd0b85a97d-49588ecc152mr4851434f8f.27.1794184439552;
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:19 +0000
Subject: [PATCH 07/17] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-7-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=HQwzvS1g9UbQKH8v0/XpwTYPPGyIcJ129Y8yti74NjNwgnbgo8LwZJmaOxKeuHMuvgkZ+EP/2
 IP5h1J7SLhzC0/e/TSquB9CwBZEDq02qBgUbIWpMHDatD8Y+sZaCkxU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163401_553174_194A6B95 
X-CRM114-Status: GOOD (  10.30  )
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


