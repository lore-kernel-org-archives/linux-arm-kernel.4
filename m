Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37933606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1NFcpKBN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVLelurH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NkSN8UMfoTWKp8XmjqjM5ogwV9ygtNexpeqrEJLEfeA=; b=1NFcpKBNmCgTgW
	+wDTDa97DxYlMIPhLfuvKtbcjoPIKDTagYp99wd6SCxWG8REiSID58vuB/ilAS4BaGEwJQSdFh8oX
	S2MUJXAM0Ik0UN6AWg+5qcWTYsC3J2Dsfn7Pk0oyhbJPYJc0SR6FIZRF/Fb7ve9m9XxlYTb+DM0pf
	2eHML2QK6GeJ1qwY6KjxjM8jqPkjC++HQyklJafqJmZ06OV/lEjUbbyVjXYlaaNtSyq02toYKYgSV
	lD/H1kJNglQnn5fFFGhLanFyrsXtt7ex0C/lbyyAAMNIAPmTiD/Mkj9n6fUP2GvowKYTP9EMNhYDS
	jBpH6rktLbqhblqei1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3wM-00000008KfY-0Kyb;
	Wed, 25 Nov 2026 03:45:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vy-00000008KJ3-36c8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:44:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso48751875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578277; x=1796183077; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkSN8UMfoTWKp8XmjqjM5ogwV9ygtNexpeqrEJLEfeA=;
        b=dVLelurH81suDi1Sn9fP/6Je6OPPYEDrUEiFVMNDGtfMZH9NvJTQQ2U88Z4JreWoJD
         AJYS15uolhQH5Ic9nXBhy/GlY0nT2GFYlku51H3VpANRHzAe6drqJJ63mjdD8Mc9YWF8
         JSF2TYen0s62NFTZpOJuvjO9cn6RziIrn8Y+8ZvRd3EsNQVirCOYjXEpg/nakslooEgN
         lsBbbkwwN2ct9YHTjNQV2/PnPFKuE3EDRe9UP5pV947sj+e48kJ+guYe35RmA7eSdjHh
         n6eA/Rij550FHncFpFFpb+2HpkOHw1/G8fH0vmUh969xYzEwlkSIHplR3in4owyiJ7cj
         j/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578277; x=1796183077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkSN8UMfoTWKp8XmjqjM5ogwV9ygtNexpeqrEJLEfeA=;
        b=Al/4ffIDZBYOsbZPvm4GBhz1rTeoRuiq60k8aF1I8TUkKrkPBfSHbH1jl3jjZMLDL0
         QYS2nXJ8G49wyltyJth9bJNJa7idzsCR2CvMdP6H3m3MuFFJXcTl0daHeSyElav5ehtq
         Fzl6HD9x/ZPXFrf0nDgc2bDRk9GjvMSs/Ezhb/s+dMlcR9bl/D4LUZSZ7xz3I/d+oBWP
         gC1S5wSkQ5cOjBxQzG4BVZt2t1jlJ09nNfYE4hjIyYTg5YZjRGyJhxAMrz6dqdmDxCK2
         u9n/+MLUikQzxnk1TKijHAUBoPLWoEkQZdoXaC3fbCxdA0VU/WIjGO4KDUy26cnitKGV
         rkXQ==
X-Forwarded-Encrypted: i=1; AL+hErFv0RQCl6cW6r0MYq1P+s2F3ZgoqIUwOtldXnoKdhBUb56mDxBzSF6lF8MVrOtfDnZ10JYGgfz3/iTsCXjxAGJS@lists.infradead.org
X-Gm-Message-State: APuU4Z/L+vnWEcn2osbE04BuRMm09Y3rfbYxIA8Af7dw/+4o/LfzVrWc
	uQ6N7LpXAbK951a/gypY9wcRZtn4y+WubEeri6YicvHFMCmq8j4HcsFQ
X-Gm-Gg: AZFdTZcVdp1exrsEnkIHr9YkNQcQrvQq8ayfGjEkrN9Hpa6k2zndaIsYVdtTbM4y5PQ
	z6Vo3I/AoW1fjzGmklfVCu060Z63gDvgBmCKqsY5Fegw2WAWRrba5I5HL1sOxn4X8VLxQaMq885
	rHiTRQtgGj3pSpYG/II59GVIb030D8/jlSnKTv3MTL5pJKloRx6n03R3nyyBuYPdFLQ6AFhiwG9
	x7PYJPMCEcwwsaNrd+o89Ak4PrHtZIvQWqpjiahoPSyTc7nikYV/cb8VzhImatsysOTbRTOQocG
	zXKMPWXE+KhLnIYdi1ATsIFg2VgH4DW4XR3BykervraexMLHOInPubaYIoBNk/yqGpC5xz+vmTX
	6sKm37xw7HKrHoo5xV/jU5UyAQu/aRfyQ+9zuZXZedK+5q9P9ELOBwR785gyty1pXNWmBPHbTzo
	8cbDYJMJsniF/mOujOKcmGg1K0BQ0bKa2nJ1y+wnsHl4PEhHU4ugK8MtFQg/nzS3RFJ8KBc5mCM
	PGvvoxxmNE/M+pcuLJhFIjMy5zYggwgwStz6SPmGrmHPeSRSMNYbxylyq1h9Zw9GbdUIzjM2LXa
	wcftTVPS4sIS0wlzSZbwtBZsnFW5aASTZp+Vvg==
X-Received: by 2002:a05:600c:a087:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4bb887c9fbamr346080945e9.3.1795578276823;
        Tue, 24 Nov 2026 19:44:36 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:36 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:08 +0000
Subject: [PATCH v3 12/14] soc: qcom: socinfo: Add SXR2250P SoC ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-12-5c8311c0b70b@gmail.com>
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
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1207;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sbEeAuvm0vdAU7a79gy3cwCbc+niIPSz0ebsMUqvyM8=;
 b=KR7TljwE3x2QteRIhm5O5gc+Ovt804bPNXZE2SHYg9Q0Owpdf51fj2CIb7ZGKKfP0khgNSrGC
 8wxHPG6P0W8DmuSngwRv4oXHEtyjNPML9jsnvTjumi9JPv03PdDisQP
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194438_837817_5342BA50 
X-CRM114-Status: GOOD (  13.43  )
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

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18105ddcf04d..72d282f17b0e 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 317dcc26c504..3a3d7c7089d0 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -170,6 +170,7 @@ enum qcom_socinfo_feature_code {
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0


