Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC1606A887
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11XxlI1y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYHRPUxC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=; b=11XxlI1y3es55+
	sccBtfiQ/BI8BoFOP3yyYD+pzUDG+rkF+P9AnSo0RvzrdebM0WQFcRnuS7oCz7P9hALGWKO1kYW6N
	0MDX0Y0oNKDHMcHtenoC276drqXFrMmBNqiQlCrWuHLuz3mDJSY1e5Qr1q1PUWWEr2stDPs5AWNhS
	JSbnsmTnBnY0ve+9xZAxd46QWD0Ye/nEaq1vkz3w//hJnjjMu/Wmkol05rFBrSfEsSs3AYowl+jD2
	rXBneXO+wEMIoaCv+vKd5PP/suRbXKsC24E/QuiFt7DibeYiBTIZJ66E7xZTzmxWZ5GO9MdNHqGc1
	HB7yvCmIphfBmCxb/0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4E3-00000003xGp-45ET;
	Mon, 16 Nov 2026 21:26:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4E2-00000003xEP-0p9m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:26:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so48109655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864412; x=1795469212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=yYHRPUxCS8mXglWqkDuQLPxDw5S1D8EJHyJofI/Y8+91vq7tAB1T8UEGH62xCgQX0C
         2e56GzbogOg6i/iQ3hsCOrgrY5jaLj5i70Iw+vICwLE2hXoJ2KshrD7KNG5uQGCISeJO
         CL2vaLRrX36U45vt9Fo/Rt+zM8YbD6xhk831wuPDZArAQw/VwS4HLQ1p5H/j3fGpE22D
         ZAb+X7H50az7dbi6zFh9ct5jF/mabzvjzLSxzRfNcvMwEFKtSLNrT+3WQT9JZ+vpj4dO
         HAEi/e/N4oloBCvTowd0Crit4kebZyOFHl7o41gB7biMdheTM8Yvp8XWdaeJcoEaBbR/
         rL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864412; x=1795469212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=YRCNI1uBvECjwyyLXydhWhrQU1MVl7vUlNEH+H/lstr0rIMnl6A8vEltkOUWctAf+5
         q4NCwYPqopEjy9Gp0Ev8f8c1SV/9NP6kDei64HgsXioUfyCintZv/f9bm08XhXY2KoeW
         gUl09vno4++5cPEapJ9LPmI70gD5j5n14HisRw5n2roDM1+dZYF++BjvbPUSclCsGlnY
         e7FXUpaw74jyy8lzUSE2pMEx4dNXr8DzHE0JwR2p5J7siJgFKa0CVglxEoBiI4HObuHD
         1xgvPd7zGKb+q/fTQV8xiXcvUl7OGBAFDN8D0QjqcQZwrXwcJX4EGMm/89cX3dKY7Vb0
         M+Xg==
X-Forwarded-Encrypted: i=1; AL+hErFiVv5Yrt2NvOHEYgWXKMsjdo6VTy23XzdklJ8GOxgBh33EG0WqU9dRVoZskA24F5HP9HjqNemv9jgJAgsRZeQx@lists.infradead.org
X-Gm-Message-State: APuU4Z/b1xDVUwwu2Sw/wkLCfm3Zk17RjKvaWeb4yzWq9l9npuvBYeGY
	SJL9MLzube0pKWoEtQyq0BjJhQU0J1JplgFHH80z6RJIfNi0lce0M7rs
X-Gm-Gg: AYBFou0uvL+1DQesd7OfqrP2HwlTscAFpZjYjzN1gC0x/eVKIABSiKn8mwt3ZTIpkUe
	FpePDOk7adSmCvzpUlWu8jL5Z26QLDdbZ29YGvh4NzrwI0Ar35W2EsktY4Jd4INR6bniGzcVBlQ
	8OO+FB5evDiyrHnjGufX8yMH22K4WPECi92/iJAHhXYVYED907xmfYIqZympwm9ISESWiwBtGSx
	Pof8OIrx6cTjSwV9wMnt5lT6zPnPKicJhC7TKV8ViE1MMnEgIOCEZ6LEXgP3QpEYUWKUt36i5R1
	XKbbODHO9zKG/sbWPyQscpgJTo/JCYLNlcj1BJidtFu1/3e+kNLBGbEp2V46Zu+LhiAW0M/frDd
	KcV7cC5uN0+08Mn1otb16xoSo741C0r91EIN19c0u73OEwllWJOTLIKblEldX7HsvInwp4FYNrB
	c2gEBnHdHN1sZjCFgYF8ntbykCWrWujAFCVN+fsIMjbEDQQLvnEbew/J3aVNiYMkfNl/MfprD9r
	3UNWQjBwZhwhd80XiwGDofrNcfEZLJTN3ArYtjx13LvaGQaJiOH8UpAyhxzUh/HpoRphbkJqLZ+
	f1qGVJRYl5FJWYscd+aPBV4KJI42N5i0x3v0zsPQ
X-Received: by 2002:a05:600c:3d92:b0:4ba:e7:ef3d with SMTP id 5b1f17b1804b1-4bb559f7044mr243891145e9.1.1794864412296;
        Mon, 16 Nov 2026 13:26:52 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:51 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:19 +0000
Subject: [PATCH v2 03/16] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-3-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=FqcgSljUbrxAce/Wb8/tWQg7D8BxyY05VfRoM3lIlKWOtWcZxkvJ+EYJdvTvvxol8FPPRApKu
 mw5+dUw4O8RDXBA5aD2L3Fg9fYj7OF5FtJNOsGNYBuFx4Z8h2/2ns31
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132654_264193_B69334DB 
X-CRM114-Status: GOOD (  10.00  )
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

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0


