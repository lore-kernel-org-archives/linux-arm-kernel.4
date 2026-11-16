Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cHFwzBYr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFNAONIg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=; b=cHFwzBYrqaIXQx
	fYF5uIckG5S4VbKbisd8nwN+W7sFEUK7rqd0TENNAOIdQmgVXC70EnHQzyAyxWTInSlED/RCFmxfy
	iqV1FfzU00l6fAXxmtb2k+pHXRyspNxDoU5usYXhlLQEzzSY2JkpY9X10iro798C3rmnPjj+zk/dZ
	xD/oPfGNnY/+CCC1RcZbY0DwxhgdZdE7+cnfzlRYqv7B3kL9dju9Y8B8+Mb6tlLQ+3v/J7KWwBMx7
	dN5wlxV1sva9pYMiRnDPazD5dufp6lt3VUXZZJZyKbqJfRyVAkbRthJvY172nQO42lNgbzOsSIKRw
	LZAMnWg4fGIMjvDN0DLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Ds-00000003x8L-1lqH;
	Mon, 16 Nov 2026 21:26:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Dp-00000003x66-0OuE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:26:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb61185057so16924905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864399; x=1795469199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=mFNAONIgMwRcEVOVak7DbC1638FeuH8k2mRB7HLaqwPWAFy88kAXy8Vp+FQ5FplKmj
         ezWLXDYuovdtgZvqBZ4KaUNkb5pjw4/LFmMODfY2bPhoq2EA6UfSMytg+F3IEt0uG9vb
         rcKjomhrsqNQuGXRIjQWOr22uh1Nv8ZgNH0Hq1LOPfMXyiZMGLBO2nL7oe9JbWx2g/xv
         Pw7Bleaa8Wn8Ei3mGFB3jenZh3SRlJngorBMs2UcJsiC7z7d7GNJIi9qcJ3yfpauHf9E
         iI3OzTRSrOTIMtFt8r3e8soolqwCt0nhDWc3biDfUWzv7Aud/s01Z69BcwwaAwHdcSa4
         f/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864399; x=1795469199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=e2ebLO+wKjlwPMga2ZIQbkGvnqx+nGJdBp9KbCDaJoQlxIcnvShg/KJXghmAODTnY6
         hVsqrE0pbw0Rly3LmyH6510+yMJEpoDlxBwi0gAAsDBUwHqjVHadPZ4HFixSPCMOfC+F
         Yp8Rqs/lGhJLfLd+neFo7aRbP9LaVGp69uzCZgT0OnOExE6MLxOfMV6kj86yrzSWCFM/
         RBGFMEn/YHyXM46jcoK/sqnBap5p/33IW6MiKEdjndrl9S4YdRe1l2+czD5xcXON16lV
         vSlRkM6WQjJreVrxajKX7Y6KT7ayt0tWsBZfCsKVyBDt41ht6duNo4vK5j4LSECBwecr
         231g==
X-Forwarded-Encrypted: i=1; AL+hErEF6YFedTkwsO1aBdoZCVzZWDDVVB5+LLG5hy11q9lp55G+YFN86yEm1PwBRNHLyfOmT/AQGVbh8umnhfsgXVvm@lists.infradead.org
X-Gm-Message-State: APuU4Z9tofTzP0gcmrgn5GF5pQJE/PBsKdudZkyFGtMOPvZZnXJVgXRy
	fc1tI62o5bYcxPEw71KjKta7o8cDn16vIkiESuqzmGbKmqdrH3YOR2RB
X-Gm-Gg: AYBFou1683RVnxTF0u4O9ktBfHp9IjHxTM38k5AZ+5c1/+ViCr1r6xU8rV0UV1UZF22
	JR7JvLhy6x4ONGdntE2DVNm57Mu6BM6XNYRpq6L+X6bQpRvSfW1KPayHxm3wlA+1qVwew7f8qVv
	v4wIrXc6g4A8JCc4mMJ5wfvZrtaBvpIdSkwYf/JznB80RlYAWrjmqi+c7tzgPb38BOqtXjzkycC
	PmPbnzbK2ymghcaa4rZ2MlLleKCJxZhsg+lL5RjIYEJX/bW4LnUSLEEcWuiXufaPNJe1YwSSAQ0
	XPqVWRbik/LTEUbGUu0xO/rgxFyHOmsvaBhMQ5gH1k/wDbmgoTfaC/ls1Ij9QAtmPjJeqCrx7i8
	QbytKNFr+MJ1mDrfkj2tV8VlxfMg/52WZqez4ln7gy2gEo6hl3DFpCsKdRhDmmN07KjsJeNxEj4
	BY5o59znoNdUn352SU6gDMQGqJLbyPibWeQOBSuiKnrE7Vmdo+nwgJd7rJzwW70K06gNXVBt/m4
	hpMtMA/phF+oIxM1LCVodiQgugPpYWCv544LktEC3hvjgOr0UhEhEw8CHeWSQfzQ8hBmIAslYfP
	EgjNuvWqWbwC5Pt1QCJnU6631CzZi3OEu8v+oeV7
X-Received: by 2002:a05:600c:3509:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4bb559f3633mr229913355e9.1.1794864399079;
        Mon, 16 Nov 2026 13:26:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:38 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:17 +0000
Subject: [PATCH v2 01/16] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-1-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=910;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=TIEe9N/cyAzKgpuoZBtDZhrBfZnBIMsVZBId/jMf7sU=;
 b=dpF7p0w+OJpIxiGvX34+YlsXwN/di/jZgfYFaXfY2LGvx7anrS9naa9DX6XaW0R3KAm0CLz0p
 0yoxibSkrgQC5/lkQjgDmvTXyvnDrKaMbIZimtpZ/81OcVIj7o3EQjp
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132641_158610_83C489C6 
X-CRM114-Status: UNSURE (   9.91  )
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

Document the Power Domain Controller on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


