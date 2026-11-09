Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8FF606D808
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AvsYmKNw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LFMxcB8I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=; b=AvsYmKNwOs9Aw8
	4y+hP7GQ79GdTLYnu5I/peeQFUYaZOu4inAxnlzJa4ZU74/mTea5aKaaDZEGofhcB1o5umMXqFYK0
	EPbpWdSuY85JIH6veBqMs1f/TgAE+u9Kp3ikRdUHgjs0jIx1MnP3dyvbPxcKYK+6w5Pp4siSYB789
	KSovJggZAZUnA4B9NHo36Pv8EKmHuZupTpiABvut3Dxi5TEbq8V/B/s69lhLJZRmWp/w925ZdT7AG
	Vj757V1pIYV7KxfWdj1xbmC7sR4n0MshkNZfacxMVUCA8GWK5f1jbio5zUGTrDhNVBT4UPyEiNIrf
	vPRi5B7KKukLSKM/hojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLG-0000000Gyxb-1WLd;
	Mon, 09 Nov 2026 00:34:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDL8-0000000GyoK-1p5K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so187647f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184464; x=1794789264; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=LFMxcB8IWW60IBIt4rqy9emTxTJmTDwtjMfFwTd0FHHg4mb19aOH7vOaeBII/DIUNr
         dtV1AZNU53TzBtVNn9BQ0fMx5lSQvXg4QbevfbsEnI+GXzVocreG/m0FBMcK1SyTNsv0
         qF8fwsF7mYOWCBoRXoHb1zC8tu5OfW3ojB4/0crxElDGkmnb/LmwFQTpXjuyvtEwGj/E
         2n2LNQcbs3znyIN6vSqTE2hb2OJSn1escOhuwXzuqrNyyKQRw5NCmD+EyC7QKLEBdu+i
         pZX418K12JLTAct8edT2tSP/rc5hKBCUUqqOm1e+uRkBfWdKMsa+ngQ3BH+Q4xqIJQ4Z
         0mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184464; x=1794789264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=U13twP7GduLpUKO8xd+3S/OuIRRT0+JLsEWrw/DquS53aOHBD1dDTqH45D+0Ma5uX8
         ZKvs3+3Fdh5zoWGI/PGe7CL/B7/B6ub40mdMRJ5aH6qNVInVZyhqBL3iZzCWH403ineC
         cqNBVP/UijljMDiYshORsO1QBBHy8JHozE1A2l1ynf3umU1wFo/P9eQLCCYiQ/ZzdlWc
         /9KxJSXs4qFQm1SvrBTjVm0GbY6fvzqVEH7PxV4fEfI1mrTZrTL2u3u6t5MtzEZnBfrU
         zB4m3AlNczb2RjnIPWMRGV7JfrJRZ31RAAp3qbPBYGhyI4DRFApB22mCUa9EsAilgIk6
         RCrw==
X-Forwarded-Encrypted: i=1; AL+hErFnQCSqj0RybQtejN1WarYt3FmNtjsz3CjxfkyBhPgbJFOiymqUzQsOfes/gh38EsC8D+Mw34MF9o9bhjf339G5@lists.infradead.org
X-Gm-Message-State: APuU4Z87o9kkLzsPxuaty5udM9Axi0KzfqNvuHI93bw+XKshCPStd4qk
	kR+nPylL2eMWUraa5mvnGB/uQ0zZTYIknHlIpvcKV+9A8632qWOyAQPP
X-Gm-Gg: AYBFou2Q/gZPS+xdbE5c9O2BKPQJA29lj68aySD59pc0d0T+6nnEKIuBn3qH5SHrKEc
	qeknh29ufHDGxhL27Mw5yniUM/mrwBrMclN4jeZ41k0vSUNTtKHSNzBEoTlvXfj6tBy0yPCKqJI
	uIH/NExnwSADC5ZxAYEJffXgQFfLVVZiDrlPfsMITrIiwjpa/oxRxrE/ppixwo9+nB+0HOU47/n
	J8JDGLyFJXypq3pR+wwqCtzyZTsfi4q3xbFF6BxzyAmvZVuC8GdMzue65cXiFBHk8CsIhPLbgYD
	27eiYiOlnvpipRzugmL+UnvX0bGAjOkTXCQ2JOo2rgZWuVM7e5dt8mHT0Bf8bf00o8tddWPsyHD
	TNyFa0AVxxKl4uf5UGT8daaRSvfEy8hSiEeYpNijioYDjt5wkSP4BB1EzGPYjGBCy2eqOfvVMKv
	Xpa7pyK7KJGIKVWO+GnDLWZDr/ZFo7zIsqRMHZIe6uO0EzEj9ouIj0IlmvfUKa8B23ropLK07hF
	TUxZqvapJr3Idh0PYsQFC3IvA4pHuI3QUlMN5MTag41Zjbr08Ctosa3Y1nYxTTUoG0snA0Afs3l
	KgWWA6MVus0QSzGlq64OVy54GVj99IXCc4ilqM4p
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr4774036f8f.25.1794184464442;
        Sun, 08 Nov 2026 16:34:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:23 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:23 +0000
Subject: [PATCH 11/17] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-11-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=/dOrZ5kbZXiJ0bcfGwkBHl7a+YAKGn1bUTdYux1Y38RVDKws5L13g0SU1+8SFR4l0gLQgTvYS
 wprUB1wAKuOCKc4gs9aCLEB0eoMZXLaWUvR2Qma/3ofWIp9EDkckTFe
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163426_498470_D13D1313 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0


