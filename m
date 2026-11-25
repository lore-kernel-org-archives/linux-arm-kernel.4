Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF6606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWSG5re6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pmS+RaIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=; b=VWSG5re6ek4Pep
	pENcjMKoHomddf2nh5BwFCq3mDRgs80SPuQGvuy8zMpgiVTmWthsxsrbQkIt0quK8AcrH7oHIXMhB
	Upx7r5V1UqSrz/ong4K0H4WfhAr1F5j3cpJa+1q0nWuGy/HxtjYDVH/3X/LONu3lz1DeheXb4oARL
	5D4IBSs2vBPimPib/5deMNhPeTjNADSe96JNt3PIF8s8RId7CbuXfz5uTAOs7zwcbqq0dZeGtXU3e
	43dyJRXUGMfOyZOGoPjzoNvfj+V7af4ZRB5U4v2hnyIgSDF53ajVSPY3Z+ovYQXSb5lG5vBADdiPe
	jiYAlWZvttWj6oqxHtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vW-00000008JvF-3j00;
	Wed, 25 Nov 2026 03:44:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vJ-00000008JkN-3xJg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:43:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so24201235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578236; x=1796183036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=pmS+RaIMPVk0nggak5ytdm+20F5bsR9ii45dM+BSFp4boC3nVAR2MjGn1Vmj3MbW6A
         pvVqvutTmJ6njx+3MZC8S7lAs1c1H22sVBE3uPxx6k4hlbMStZxIi/wswo+7wA3cXePd
         CbweQqkHa6WzG+wBSAdzbdEiIQJdVFhpujlNsq+SE+aUQkBSEC94aB6Gqm5FfWkx/ann
         oC+F4HG0pqAfUtgafM9nOjSTCOUClvlKjg5fXTUgPspLRcbfDjDb7WI6NVOeIpXUP4Yj
         ureDDYx3F0pitPiX3gjajfIV4dLKz1zK47vokuq89swqEA7/4XF14Gkt8SuD8EnQq0JU
         q+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578236; x=1796183036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=fc2gq3xSyPaLsvrJYc4jWYekAmUTPMjynQAGcac/D27JDE3NkrCLdGCwn9MAxjYaLI
         KUGUKVg2l3rv02k3Lrsw/yl8I9qZEyVVlOeeRS7zcH2ehUuOYJjLdXClG0kow19rKQRo
         ECxYX95O2qe/MghYw4K5jioxV+/nvNFo0xn9Huz8tW0SMOhAFmlsOt1WWALJb2yZnf1H
         Wu+LeoqyyBLrU3DARPGfCtbuEf8y48E/R0ZWRV8/inzft7Gd1jDw1h5eE6IXtoJ7/0E/
         YOVb9WReWSoRMmvngnPlk5486lDjU2ZUqsNDzAyMHwpf0hUs8CHUiWGDXjdsBs1H/xP5
         5N0w==
X-Forwarded-Encrypted: i=1; AL+hErGtSWR53nvR5ex62KNVetZCVd/E2HhjiE2eE1kmpdwnNqQR0XFS/ZLN8OBZT90PDaTH3mJCXMHSXsBQ00WJvDgP@lists.infradead.org
X-Gm-Message-State: APuU4Z8sJZ2Oo3WealV/OUmB+ALbfQs1PVXcjupr9w9APdosVqnIznh5
	3yL9Ex8j92KqsPgLs63y4GFfnuvS9Qkw2LMcoxoVsA0SrnHUx/jD8uwh
X-Gm-Gg: AZFdTZdUOV8010AQvv8BKalsLdDKheuqUJyhPLQczM799nuy4YOZrwuyntddyHevizy
	zv6BFUYy01AWcSYg7FRhGEQcCuobIGjVUBsPuNWFC0v88UuBTqg6WtlenWK1iot5TVCrCOFpA8+
	2xVJMuKwLtPW1N77SPRtOuj657H7/+cHRBl8CiGJDqDsfe4zCGN12anHPTeEarQtFRUk5pd8nyE
	IqppjuVfJGEYKzAEIy0Jh+DjMCOnsn/bXb6p9+RqS8w1HZwpE1YIC/W4YfDAmNlNnGYWIhw5qca
	fRwZ/Rr7YOPO+z6hctEYZvso51SWy35JKkwBAJO6XUXMmGS9/ib+YEQO3f7EB51x9xNz2Da5cSY
	qbd+kX/Q9vGirWOp2KeEN8nzjutlwbDBVmzppFwy4JWaKbJEDAyMbhGOTODhnkGBKITnxTysDq5
	NOz/bpOPX+F4r2i4ErOKyyavUaSYgH/NqyA2cGo9oqiHDtR8A/lvylyVT0hVZfDAgRHB5Ur0Xd9
	T6tPS6aJfovVVyZNXzDZnj6l0ZwnMur5VDvTPxnPoCqTB5n7xB+F+o4P0tjkRN6us4T4DP6KyNh
	5CPfNgqYzHMv8DwsfgTIoD1y4Ns8RW2zlM+t+A==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr352610575e9.19.1795578236299;
        Tue, 24 Nov 2026 19:43:56 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:55 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:01 +0000
Subject: [PATCH v3 05/14] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-5-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=961;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=vc+yCVm63yJiTEyLJCU/ghFkRJa2TidHkMEEWzw/3Gc=;
 b=Yg/VSr0scUN51i9KpRAWHfU1hj3WxUg4RAt781FW4PuuF2y193VAPyf14yap65FpsWKVde5Xo
 6se4dVNbdKnCzQeUFO8eyXXWtGTKy5TyIr8La1GZjrp2oxL2C8sTpHU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194358_020860_1B2EC7BF 
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

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0


