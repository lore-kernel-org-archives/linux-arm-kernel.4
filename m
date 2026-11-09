Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157D606EEBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HOMqhdIu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+CxFVbw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=; b=HOMqhdIuLM4W53
	7m3HlhymqvmhBaVFHNeelLn7BrRNcUyzDj9/2DBrsMDZPWeJGaUaNWybV3hcOuSzMKc6aPGeZFBSd
	5mavuGgsoxxu8UHsUJofMv7Iirypq5CwCjzc7iHKq56hy0AH2aLrDZsg90uMlf59Gsh12kIi1iXye
	D2+2f7GJT2cRDbqsbzUXvw8k63cWo4lwY3kqa/IDQks6XEB4WdnQNE1928E9t31Ke+jHklboftZjl
	fkyLUdrr4JoaBt5AZxyIZzsx67pQep/QikVJhjLma3AxsUbefezyiP6u7cCWYlFf6QyoEqe8XVAVa
	ab3FYl7y4rCBtYBpmKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKZ-0000000GyDN-0azE;
	Mon, 09 Nov 2026 00:33:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKV-0000000Gy8w-2JVa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:33:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3288585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184426; x=1794789226; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=k+CxFVbw6WnQscyp9/wePszveNf4MO+f7u0/nz4kj626vZd8dU+54Ds1X6xv9NLIUi
         8gbm0JPiEItnbsANK+k+dUD9xt1P3wtbKEhxxGjYNsDJLG0e2iQuTSsL51CS+MwSZo2N
         BU/MfnAcxqi1MuAjgeJ7A4V+idxiH7zSjhcxi0QLtPCuE0yf7pPlsbe+3Wbiv2KQEZv7
         MXfl1fyEtRyC0R01MEdnNz/PBsF22X04cFYV6DBnMGT9yjF1bmLHs5KNtXT6Jpzb6pGA
         G4GenVAubvYcg7jx9+mTmcMHWo1yeAN8CRLj1UK9pdrlbSEgVSIZst2u5orNtgZ0coIm
         Yq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184426; x=1794789226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=mfSHyFhFyXfRcVKtDC54vuJMoN+rGs3rEp1n6i5VuJV7xQhP6jTThFmAbhiHtz4QYd
         Y6GHc7e+41hOSKrWXB8lPLiIXgNWYi0KOPTOhOIvFJF8ZqrD3NPiYthOlaoL0lAbhVbK
         I0D2PEiHmiO52oLmPyigbS8zHckxpU44ZMTuXcHDMSuJd7v29dDthqYMKAvX8yeLo4uu
         DWefIny9uUVgFfG6uvrHPbzzNX18ix+LgGaKkYJiPuDYYUGyYNTK403wz6FTokjcjIEI
         Oo+KbNJRUHLdPGmkaz9nL7nBbfEp3as4GD5e5vh6lSC7eFwVFreRpOfwLg4fjg1uFV/C
         K3Rg==
X-Forwarded-Encrypted: i=1; AL+hErGlODgrV0SiG+APpURFe32RtaBeQTAE3IzJ65zEQyT10LE9a9x06I1wVOYnrtsoSsQD//GISM0qv667GR59b5xy@lists.infradead.org
X-Gm-Message-State: APuU4Z/dlzQJsjX585zx86kRl6pKCWTzT+j7c9+aTCSfzH+eqT8ojwdA
	B8Xes+Dv/6xGZaIHR0It5ivCKtLgj23Sf66ezDxbMkPSY/llDCV+DzSk
X-Gm-Gg: AYBFou3bgFXQ6tvTraLdV/qwjLV9/J75dwcPesaqyNXCmvWAJdmKAkr6RAALN/t5/Dq
	S8F0ofz/3z8IT4YUSPzyKB7U7bdsXyBxhXOsti+w4fjrYqqvc3yNQ7Ob4QgIeUV025gwUlwyc7z
	SPoTTDlzkYM/Ts5pIxMG7B4coQjtUavsx6jS83zz3yHlyOZUlQW+5IZCWDk7HRprlhI4lskT3cF
	cNK7J5hZmUbpMX6T+c135GOk+oGoxn0+tS/5y58pA2t/Gfh5VxlOvBu5tAbL4LzhJWc8C+ZbkOo
	kOq+ckAXI7ZScVhCuRlfIHAH/UkejUFOWmuEuxmy1QMRQDv6Rl4juJIn5ri7PicO0nNAsazxebY
	yaDgVdqJe5R/oJ1foHmzfMIb1v0ea7F6gm/IBQQohQ7QMoN74srmAHJvNaNA0PHdYRUtX79RJdr
	8LnGudHNqcA7EnLP7FoY/i6p1x7psKJsCwkLZlzBzPE+gGGW/SjJJG07amNP7Pg4kV/XV9IGFZk
	fhKry91BN8EURoQAoH3JA7QFV3hC2Jp6qpIb+w8OJPezWHeLhdutYwPyrX9Z1vfX+Z1MHljEYxL
	s4hE0hIFsFPR7Dzesz8QxV/jzpnZRmPsZp1+IlYP
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr43372595e9.35.1794184425700;
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:16 +0000
Subject: [PATCH 04/17] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-4-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1003;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=el/mD1li+25cayhCgWCSoEmU7xbrdbDdv2bm0vKCgf0=;
 b=AAbKZuaWziyLaKTlH3TAQLDLLUPJbQQuUGnW2/exeZlWjcPjeJvTUQ3Mzs5Xy0Jsi923+4Jy6
 HYpQrlT+Y7QBXM0fnEs6fk3DZfReSJNsf74HPnCiwzI9V/RMLtbXEW8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163347_655379_8C8E7650 
X-CRM114-Status: GOOD (  10.48  )
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

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0


