Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ADB606A895
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAY1KmDk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISFO6OLb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=; b=MAY1KmDkWSZYMS
	HmyKNQDtRc0LVCHN7Y4FA9KMuFOwDMMeX5deKyldLP0onc8MrKN75SmyNJycDClMcoVb4kvF4Hxfe
	akRCESj/qbXGSP93DtdsZ/f05RiEgDohcmXO8NWVr5z70eKa8i1iT4jhXRiieB/Zdm968qParb2MM
	ZbR2aeDS6oCV6QVbiknlbn3Te8B+LqYeHGXb/FBm7jacM9eOmbPmgjqHwJiP+xVixhVvtwNm/oHQU
	OtIvzC54g8C2a7eTBDATG3WGkMFGrFpybGoldAq3pBbR1C18F7jxwthtgulBLuNlUbV6mgeRvgHCF
	1efDf7brZura6r6zibPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Eu-00000003y4P-1zzh;
	Mon, 16 Nov 2026 21:27:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Ej-00000003xqa-3Nf2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2963210f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864456; x=1795469256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=ISFO6OLbhwF8mK6E/NJNCUmS4HxS6ZXXm+yKudVhLQGdmd8QBVPuAXIfxVgXtmIsHB
         fQnYsAcTt5NNvgUxk4yfVNbGq/MeIDIrz/PfuY+x8vaOk7uazRflNrdzoBchJPwUv0Xw
         GoY2jL9meGV1SUIrXUmumMfH/lVCSyv4vB4WEGS2w5RjFncHgtCXTs5KfN8yGlh0HBMM
         U5CPrJLJsDT+NrgjGZDzMFExObPScAmMYvJUT7+hy4/oLYhLnXrLK5WiJ1OOujGLTp1P
         xw0AesbzW3DPSSQAMYBu1O5jvbDUQRhz1xAcIQGYmpqdns9nN/MoyECLKn3VYvo/BqCl
         FYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864456; x=1795469256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=LcB6fo5lCvTbwLhbSaaIW4LsQn/5g/oMXRXoCRXRa7K2e/4Lv8R6vNXT1ZJbzlmCcX
         1j60L1ioUGOaBCY8zGpDs8TJSGnFnkaXsxQYuOFbHvX0AS+gu+l19EYlMz7T/L9sURob
         yyvmWyXKEG7mV1F/m3BExIPrRQhdfVo/hRj+DOXHNV5RTaLXUxWykhZYAiUwmdnuigd5
         Rz3SBh2RYkdga19f9hAJjrrfgwlHM09xEH7euXAcWipFFdofVInU5ObdnZtoo1E7NHQc
         ITkuLStXPj9npt4pEho6dszYyHtbe2UrervJCxVqzjqJJOyOrafi1MO0yfx4abIdkDIa
         GFqA==
X-Forwarded-Encrypted: i=1; AL+hErGiAx+kDJ8BF8a1A1B1wC6+wTFl0Gp+ih5rI1qmPMuch/r017xaSQPUXLWN0mxZj8oRclP6I5VLrEEF6hPEz27z@lists.infradead.org
X-Gm-Message-State: APuU4Z+1tivGNQxLpZj35KaKWcL4uyX3tGfY3SQHaf6KdfbqPg0G1RoV
	rVEZX12cVdtABf1j2uByijHhSmmCopf8gEYznNpWBSsyeTCV6YoKElrr
X-Gm-Gg: AZFdTZfN2MMIBecuNUNEP47AN6eRt1F/b9ynhqAocW+LgSxx5FG7hGyYegQMN0wL4xl
	TqJ/4D+VOAcyHHhuc2EggVDjwP3PBxMP1KWy1Qk18E0V/HmY4S6tQWhfLLg/5L1iZc8fFCElDQC
	CbXHZG1/XUmopdNpVqMywEzWkXNj1p2TbND1n8CsiJRcqoN6zN/7lxgaV7PMU0wyzsRx5dCEuy6
	r9SiBN5JYMLiMz0SLG6dK6hu83FCLJQFFMG95TPgFZbiAZTihYeW8giwxImVS5Ea02nKRz32kkN
	n7UvQwRwz+Vdof12FYNxqpmRdU/vmT9Xcvrpv1O245D0HAwwwHZe1XWT68RpTigzImBEV+6GOwY
	Xm2glM/CPzr5C6aG6JOTae/10WwLbAxATvhNaJZxcrmLn3JPCAk+EsTJKDc/muiWmaekrfH0Xfx
	q7Ix9f/g8kcub08M2u4C5iRDrac3fv0K9nP+f72a62Cxr1T4SK6jYZyacw4Acbe/Rrt6lN+wirx
	IEMHOhhlTMVKcSy47mkLnDT96DpUPFSSlsUfBpvRoAbpfmKrPe6CFND/8sfx+9z6/uTMvtg1sca
	JDqjabDfGTFWgyu5s+laR3c2WusgU4AWx5aWt10p
X-Received: by 2002:a05:6000:25ee:b0:490:b23b:802d with SMTP id ffacd0b85a97d-49c71d475ddmr22315194f8f.37.1794864455894;
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:26 +0000
Subject: [PATCH v2 10/16] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=9cBm/5Mi8IeF1ejOwJZWQD4SfyJ7BWDjVcE5y5kBsTodKh6u91I9h5To2Rc8ArYF4KPYJAO96
 griT0U/fTv6BDQooM53jxYIwB3vuzMj024ajCLGGuHNM9Pf4WE6Noed
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132737_873079_6BDDA1D3 
X-CRM114-Status: UNSURE (   9.83  )
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

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0


