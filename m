Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E224C606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EwptJeMS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fft8BuG8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=; b=EwptJeMSg/OCRH
	+e3obqhRizKSeE2Vet//zI9U+fdlJE3s1mVi3pUvviIfSaRsYnaJfLU+9EcohJeK9Lb3Z0O30wXLc
	4SVSNFSv68xvkC74M3aRA1W6+QGbgwwF7OiJXz3izjSMMoU3uq3cJq3t23+xcRvsS2t1SydEQC4c5
	Bj+hm72RqgwDwZEYR8yAbx1HMT4/2ROznbArrd6L4ckACgAYJOcJsioBHY80liJTMfjDYT9x49UYf
	lXs1IQo4peJh/qZm1MTTGEthvP4FuK5Jp9hgguttchoeKF4ownMepjYN81P41sb1NlwvHk8xjz9LS
	wl8F9zlWX0BqCHlKupgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vA-00000008Jdw-0pyr;
	Wed, 25 Nov 2026 03:43:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3uz-00000008JWt-2Mdl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:43:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso51634975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578216; x=1796183016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=fft8BuG8dauen0huWFLFmS9YyRMtO0X186RKdP9SPU9JZsciC5nJ1UMFtj3/l50/m6
         YD+8l9fe0YVlHnf9Xp4uEe+yB+eWc80tOSD53pXYpKWPyJPXlktn0BbW+6PuZ0Qn49u8
         pCjdNbIeIp+sNEpmN/jOQ0fLaRPvYajtaV8ezlY6rNfg6vg/LgxRGbZfNM3iOJedUJYJ
         dQSTbBpEt006G5Hq3vwVUueiDMrTzRVq+F9rVzh1oFNuhx3zW/UcwAmJIpvh/b0OiHPu
         gPhLIP+tEDs7CVjIZcMjnlQpIebE1R7ASDwqVZcvOP1dLDg9gDv8ptTRxHD72efOXhOX
         b2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578216; x=1796183016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drwleRdoQE3pkKiq8NvL3TA0ZreOLUUT7TR68lPFDhc=;
        b=kPw36MwhVtHqp8srLIhbvMxaxGv28+iyzzsD13fIytq5qizRRmwGFAIu6zeZcVZIhf
         YT2+gjRS/Oc7GRF5fWpP4oBG+cPEzRgNXdQZZ9TgbRpBcIK9G4u0z7IsZmx0V8GQK17B
         pp7VoO1tdVg7egpSm41wk0NLuKzGLyWtRSOFQ4JcW8RxUZhacGp3KZYlfDFqNz7doH2C
         IpO7GBc0xuNCQIz/rfw4oLADN334MnrqS9x4Lk+VrB7zTsdNUBPGnJkftSnzHskAkaYU
         zABGW4Rh20KKwVF/9zF6olDZPrBU6rANROk38haBs6+dEQEeU/NsScNMu+yKlsVHE9IK
         wY5g==
X-Forwarded-Encrypted: i=1; AL+hErHwjk9RtLTt6xlr1uzNQpFmzxhxP50SPXgRwE6X68995o6Oibn1iifLtJRI2yJHvmzj7j6wx3AUdVuB1u4CgEkF@lists.infradead.org
X-Gm-Message-State: APuU4Z+1upYw8XQL3d1NayDwACG85wwhYPjgfXiA5/0e61eIxW7JM47r
	yqaXYappFxB0q8fHz5fY44VW04KbIweegsGj/QLoctuPjf3HNcKpI8xK
X-Gm-Gg: AZFdTZc1h/CDEh2CNMsdTcuz0bTiQJDCa8ieLXWr4p7kUat8UGib3HyVxlrqpb7tze5
	jCr3Gs6skUylun8sA4UT+kaSnZUngdlWxTxhK0DlhF+lZ+pBv6kkHl6DlF1i6j5kzOGtHca/j7S
	igS5/hYc8FwAIpCy/wCNZJpF17/5Oxda6lF3Z1Wch5lbBTnMlzcwFh6dGceKLc1J6F23V6n652Y
	Cu50DleM8+WX+XzPbphQZr72njIsVyNBuJ6lroV6Vu3RQrbEhfwPs0GG8V9Ku4XzFk1x7j9OnmE
	ae84pptOHVdRoP1JDH8ZwKx/u4VuExo/u+PGQcAwu58QC/OiVnwEWahWL24nBlLmDem6SDO3PcR
	7IGHcJo/aOrSWD5RfZaZUpPZukbc52A10W4n/funLotFvOMg4UM/JG5vBICx8O+AFStBm3B/8jP
	LoMEzB5ROwsPQWFMlXTdczrV4CyGOyNnFqnwx+UB+ptKVRjYBrhLuadHYbhb2I9UWO0tIuGtFa6
	OjY6UGfEE9PBH8KP797fNuQg0rS2zX5bqdVq/TSIgKvv7zn+5FJsOb2zpfVcd+c0mrwdW6RQWCC
	Ysw4PlorLSxkJ8Qh2wcyrPfrq7Xmp5IBUQPYog==
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr346329005e9.34.1795578215688;
        Tue, 24 Nov 2026 19:43:35 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:57 +0000
Subject: [PATCH v3 01/14] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-1-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=910;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=TIEe9N/cyAzKgpuoZBtDZhrBfZnBIMsVZBId/jMf7sU=;
 b=h6Yv22yIDPhl899/gQR/dzgzFCiAwokqygzx53AniCMssmz68nf3bAUZ4boIxRmClQQzRo206
 0Yy7j0zKrrDAxm4EozqJW8b/LA63zgVJosiVzUEWd1tTWYtwAKtrSzc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194337_614100_36BC5C4C 
X-CRM114-Status: GOOD (  10.72  )
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


