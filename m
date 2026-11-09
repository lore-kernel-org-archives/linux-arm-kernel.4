Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18F606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YVxsq24X;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPrbeW/8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=; b=YVxsq24X8m8FdF
	8i1YLH2jJ4sI8hp7Bnkhb7uaRimmnBv5k1j7xaQGxCaoqx0fxENIm5nk8tXbYDXRUmf4Bf3j/PMkD
	aJRLbBP9VcH5u8A+60bEnwPhpQ1WghBdIaPMT9sNDc5xrh0MP4ANXYaheDqnEM14xw8FVq5X9tNwj
	+o5u0Q6WNJljre6gdUT7mbQFANM/5hRsObyXpyrkqm5nV+6iwHwWIvkeOI7qTIIO/tTrkge2ZHlff
	9OLfQotFCP3BEXnFFIwWzbroHbOOYw52sN7c/q2ZQYp3heOmb7fkFm10P/iX4qvnpteRh5O54q6WC
	SSnKTKXS/q8PdcIOWgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKU-0000000Gy9N-3zDy;
	Mon, 09 Nov 2026 00:33:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKQ-0000000Gy5S-0m8w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:33:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso3338035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184420; x=1794789220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=kPrbeW/8o7t0BxXJZI9a+UHpsTDnHGtws9m8iFLDj9PluwwXpUYzZeb/s3fJxZ535z
         u49qHtf7ty1ygsUwg0ybkwhiYmnLnzRcG4tp87VeyX32nj2R1FErS4zht5GkGU2ZWGhh
         FZSW+xK80uanV4LJf6y6/+U7LNSTNU7L3NmwTe9LzqsSi73Ygj7Sd0USVj9zjcNKngjk
         S8eK+RWIGOJQhK0g1ZY0X3uBtAp9+hknAmfOSV5Ki7La+koVAVNyIDvN7HTieQ+UVG3c
         R7uzE2T5e8G5XFHOvzWq7ISMoPSsDC7yQaYiAOskXhlK0wf+t5bizkkcl8syf+bcCT+q
         dHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184420; x=1794789220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6Z+1pNGTBfmPrEnFxF8VVutZ1rF2maRRdQm8+3OOLA=;
        b=hzqaMAm/nQHGtKVRzqTlKC+UrnylsIMG1dsMjVyDO0wZCECewqtGWMRh04XaZj/75E
         RdqsEb15qqa1J86T0Ju/SNYjI56M3zL5OxA291Bi4Tt8HvHaYlxGmVLAorpMxyX+wicm
         U6sQao3phMFhjJfE2PALqcyA9e14dABeL7Jv0Eqrxda4U2+WiEWjr4AbEGyaX3o90SfK
         DP4Mdo5CYLifSRz31KczSHj5re4rs+rQ884QSEQJw+yPOrZU3PwDSSBVcZT3JVQekgul
         XNp0NlzvLkiP4HTRumJc9VNBPTRbe3n+V0VhZNsYiMk/WB29S8Lm2dkTFDjv7xm1mOgu
         mEAQ==
X-Forwarded-Encrypted: i=1; AL+hErEBZpAUIqKuiwRQeXvBXYTz9Pm4ns7F1cNjXqbrMAYukk5stGiCavAONFLrBQmACOCzt0oJqasQnTYUdJ5wrckg@lists.infradead.org
X-Gm-Message-State: APuU4Z91OfRVHvPC6pD0PCJuXXCulyBzPr4lbB4+uTwy+ASpXbiEMiH3
	/DyjpHUH0xTzes7jWK05nq9PNAfIqW2G8jhFdPUTOWGxAHNJqW87tkaG
X-Gm-Gg: AYBFou0czKGtCA7fynBMDOiZlWBb6JizxJ1t9chIQ66WX/twT5WZ3xVUvcHpSSj+8V5
	KHxlAjH5PP5oAVsQUqmkyAoyqCDsySBrHjMu9vDPHn9lr3UWzOIgMRfDf5XpWD8l3AMIvMOn8R9
	hzmr66H357FrXyCAAygKwe68UxSD5iU9dj1hdf4RgPzZEXQSyAL+bPa6JQt4uBLiCn9LtGneUdW
	S9CCaqsjNMr75voz6bZ1CCBwV6Y4x+4Ghkbyr7uZUjRI0vP+zdfhfIxibNHyQwPCLkBPykGnYno
	TM4Q2OeTC0WMCXbnOn+PUr1nB0/jBmPEjJ0JTnbcXzFS4IUn05hoVG10sfPVIERE9GIkD8NCJ92
	epg1Kb1kukJ9QDinSU3bfZ4b5cJD7/cG3aQnjRfYA21iwrQwxOFp4soMkZGyLLawlcM4hSFc9RF
	sXkUrf9zBEayveYZJLyikBIK3Ry6NKAKHIOLNsDxRcspDjRJL5YEkHkVAi5o6vLNkSnJmskNDv1
	NRFHvuphCGkwfpgSb4TMRFM2vaj4JQwg4QBy2DLTQCUPqynFiHBVBbgjJzN5nBaGAXlM0dcWF8J
	f72jsDA7rVEUO/QlnJP3VTuKEP4SDBQ4NvALHdzYFGfPtkbWRYDZGMXdB+xKlA==
X-Received: by 2002:a05:600c:5253:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4b94d762eb6mr47593435e9.3.1794184420329;
        Sun, 08 Nov 2026 16:33:40 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:15 +0000
Subject: [PATCH 03/17] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-3-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=840;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=4hUtXzlXhIrBYYJFfDKQPQ3vEIzggE85cdjdS9WjQ78=;
 b=/Hr74fQlfTdpftwl6fj+vsUmb0ZD+laYeVxlhFK0akfSM/Zr+bIuUmQJNpniQW71Vw0S+OnBe
 X7HjWxQRJOhA4SO/MxeQgQ2JNwAjEDgqTYH/3IGyH4DzNXVVHXtyQib
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163342_241396_926629BC 
X-CRM114-Status: GOOD (  10.32  )
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

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..cf20041e86c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,halliday-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,kuno-pdc

-- 
2.55.0


