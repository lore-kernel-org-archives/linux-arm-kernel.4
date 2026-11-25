Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2759606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B/kBMlxy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ai/jXhNM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=; b=B/kBMlxy9ysKRC
	/KVQEC09edLLFfQNR63i5tamjf1cCuJtyfES2gC/e/c3Ck0dXOt9CmTUQ9neX47wYUHQz8Ek7JsJs
	mWLL6Iob177HI5hi2WGZiQWKbQalqZwa70iGHDGl/ESqYeN/AK+D0I1vH3JmJn1KTjZwc8qjvgLV0
	+fcr+NwFjcrSZkFfRiRDe9ohvERVSntybEG7MLvUi2ohc/3g06AO7Lkqyp9i9FpsEK+95YP9sA8Gi
	5rxUgKpFJL0wFku8++nk0aTyjDsegHd/8nQ3REWnAgI/k0pyJwQhtnVKHYs48v44fWrguRxTQENqN
	i8qpBf666ttFl+xl6cSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vW-00000008Jv0-3ADc;
	Wed, 25 Nov 2026 03:44:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vF-00000008JgV-1LhU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:43:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so30183345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578231; x=1796183031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=ai/jXhNMuIWu4dFO1KjyPVYawkfwToWq+DrkCGjh1UCr3waP3Dp+Vl1BKVqzFXmH7A
         gc+TUdI5oIGlT50EoIbFLbdm6DhnO+c04ykdyoPU3f1oRZ/2lUSf6yhWKWmzvC5CCHmA
         FAMC2uuRvO5MyfDHXPTUat45S1N/+aTHlI66kbyFiuZQhofopOF2id3Pa41dmw7ZuMEM
         0wRDyZWWRi0PIUU2wAhh5GcxXJkQC3ZqGotvtZnHV0iFtamTtua4Wel9SxgtnToySYcx
         2hGUCS1NdE6vQFmAyhhsa3d7mVUJFOa0DHRxg2ZMm2hn9SmaS/sqMFHxWIKlsYdHqa+9
         LtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578231; x=1796183031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=vzGRkNhgwyRhKjfc0olIEtnKE/jS97sU3wUT1SXMfpcQzXEOxuoHcaqwvjqo4++ZIr
         jsIUK9te/a+Bo+ISi1cv8rQ8lQIqcPeKmyfSb4waiPh1JNVmEPljESZ115h7+7Bmc8Gf
         B4k3/m2Igpdfh5QPGCHoW6ve/lHXJFBGtfRclZPLT6f1yQZUzEHF0+r45bTFk3c1/DTS
         3zOk2fWswTjfvG+5JtMbGUJBkymawGF0GgogYnIkHUpgupZvW8AtCCchT4Rqjqvc3MtN
         DVyJtSrFXBL869+9IzN2M3OTkv0KG1/L+VKQfeDIO0SUsuf/ipEqPY/Quy37sfv2u5VH
         iGtw==
X-Forwarded-Encrypted: i=1; AL+hErFbJL2Fvdf2almQ+bBD6/VZhe6vhRKi0Ze9sEsIegqDJs4EYXU2zw8lT8Zqrq6DWl733hXLYFHh3Aju+aJ79p8H@lists.infradead.org
X-Gm-Message-State: APuU4Z8x9J4+tMWNnhwygRNEMt/AMLrAL14QyQSm49eP1vbKw4iyDNSM
	/ZjbOonYrP1hlkqxU9N3+JAg+a0ETHmHO2iIbXFWLEWwEGB3JTdxRKN7
X-Gm-Gg: AZFdTZd/aDHHWx9jx2mOKJ3t+G9VnW36KvvTDvEkWNcf8ySM30G3FWM/YSvwxxvozZP
	Cc/CQHH7Up+ne51vR98ASiLTYk0TDDnjaB0xO6360GneDkrvs88q2w8fcSV+r/dZAETYe+JNH+b
	+epUzhFsTvf0bx0e6gWJ5qAI138ZYftMpJQaLTItdJaXuVH6Fm1yo1TRn7OkepZZIl84T2LIJis
	pbOdkZ5qNgmj0iXajtQ2CIMy4O0nMgCXbx16OMI/ePnNq6tE3ED72Zeq9jawz9wWHjiZt07I3ht
	qJJmZLG+3GBvrG2aDib+gdzfKUx2d745jUyf73FCFS0EtzlnQ8GwJHIfUJbLdOJqp5OExcaQYmX
	kVSvKRxiOb7lw54Dise0uFaAcmr9b+qTwAVSzqpKzP3ftiv6fOYYLJv0LHCUgoSfV+IrE7H5OOt
	ja9JUh730X2ou42x2U5VBazGqAruE/o51GYFhGzjhb7elzVKMWxeCZiHFPLgtNQd1R6+Q+uxVUT
	/prD2mrAjiGf9BiTAmewEv9dpLwwI8ybndGGqvF26Ih3lJ7FoBwMjHu1AEgZohEBOTtZ2+sPZAo
	G5AMQYXAa8pogBVwnOujFvTnnw3D04v/zcpVdA==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr298467665e9.3.1795578231386;
        Tue, 24 Nov 2026 19:43:51 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:50 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:00 +0000
Subject: [PATCH v3 04/14] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-4-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1362;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=rZ5xhc0Wj0SK9I/jsxkVVRd7EbEiuk5dcQZat95a7Og=;
 b=FzPufPd+aRuNJyTsxE9xMnhrwTERQ8Vq2nvn15hQVL6HtktHPs4XaCfbTVnTG1Tm3lVHQREl1
 vEmjvIE2KTICBxf0qc9edU3Nbke7+MDNmTz+aRTaj8sSAc1QRotZJxE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194354_035828_E812173F 
X-CRM114-Status: GOOD (  10.70  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


