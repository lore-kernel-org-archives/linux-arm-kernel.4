Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE02606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gK3vVlw7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOy0CCUo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=; b=gK3vVlw7PSVqov
	9G08tHYr3VpdHXZ6118Zk5sqCVWAgg0ofK/FAlLi/8cYhI1DbAGi3biiR9GE0klbwZ6IqnhZM+cBe
	O5AKAQ0leRHSMEfJ8WDlVGAQRnEmIdpxTLnFE+rFwB6ZG7jKNOHoCUz/jKf/0uv/c2AJ/W/CG8ff7
	CO/F+ROWOLgWE/XV/PbObLETD4OvTzHr8fEmo1HumUVaic6d0qctFCJxulMzsgFVBRyK5sgOGTw7D
	fKQ0P2B8804Bl8TixIJFls5YpOd7Ji9aI1q5wNQarBcY79XbkVrzdMaGgo7WcgJEnCzVahAslb2EJ
	s2SbScPHU5FKGn9IO+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EX-00000003xee-2WsG;
	Mon, 16 Nov 2026 21:27:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4ET-00000003xYD-0FmG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22763115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864439; x=1795469239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=OOy0CCUoFB7+2c44IXqhqWUEcwkmysxCzPXUYnd1ScKZaWK3MhrIzH3mq/PGNy5os7
         NNYNdD8EMn4Z9ziCMXUQgZlvw+4UQwPzMT++o7I8L0orfNqSX/4g76mSmrz6zlqg4ac0
         tt02S0wkrZn00d4LHSljtf6x6ljK+c6ua0NTijo7BEnmf02aCYwal3A0R2/rwcH6IHIK
         2w+fKSzFkNwyyip6dtGssL57Ph5jImNfl3kHj7NJzoHvgJWeM4aVugUjxy3ifxuTkGHJ
         2AY6J8IZXrqUPqPTOBGfnSjaYzHU18SZnj+GekPGnzKjCA5B+66jncq4kUd/wVqVf9Ad
         rF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864439; x=1795469239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=HxkhQ7duL7V0kQmXzqyo/5vmMFqoz9r4gvtBfQnUhmbhf7hlWrsLk856brJHL9Mo7E
         K8VRLJxi10lYg8SaMSjkz8Q7VXImIUXG++40pxSSOA7GJXzFGRgisrHHT0xTonBeQDzn
         4//qPR+c3DbYahaber2AbQpjpAZR0VDqlJtflREEib0EiCPgT0syDuUETcVtfAi9aW+G
         B8swCaWI9vvfbUSxBUXokcbz71blnRoUhPWVJajE4CaquDuCThEkc+MCy9hjAnTCzwKi
         mCtIuap1eFYe0myDLEKCTNi9e/QWKuqF9gyE+olC3pdXGMYgm09JEpLfJuAjLL1yF6+h
         0T1A==
X-Forwarded-Encrypted: i=1; AL+hErE0h0iu8PlUTZTaozYMUutP3JC/XE/ISGPUUcFZm8CGOUMeVkKU+/a8aO36i5F8+dXzxmdLqRBffKXZ1i7ailbB@lists.infradead.org
X-Gm-Message-State: APuU4Z8WfuzX7oo/lHWowWeq9nar/0aq5wLxIUkCPPp94EBbtVmq62dE
	Eif1sv6Nh/pfl9JZrA+z4MRJYp+FLDjSl+ptylgVreJ/1u7PRINGJfyq
X-Gm-Gg: AYBFou2afs22FumExQLNrBNG2MXsIGB209dGnKO5tehz4sP0dkVBHdzdn2E3ZDaNFaa
	J4Bv0+EqzCrFEs4UZw1brQ90CU0uYkaLb/RifKT050tzk+gzRcVMK1ABVRgO84NgVfQ6jIo56Yc
	s7qkxb7rA9BZVamVp+NCv2pMeTIZK3/94KhBfyfhryGydgCjBctu3GzbA0r8be714a6UAiH9dM0
	4oO7C98XytWeibMEKbgBuCn1LAAGl67jKBbotASHzrxB6O1IfDFfFhwRKbHET+h3wlwftqY0stI
	FvUi/uvAs9JquiVkSOYUjKsaDZdBHD5Wvn+evj/mge3auYpTAfh9DyUq7hp/wc7tZyF/B9j2RTT
	PTeKqa019ldTPNyRPgyFY6U2c8cLcWjwc8oDHqqNPZPdm5bIftzvCY+BdG+wKnLVdv88XGUGrt7
	qU1dS8/nSaxme/mDtClylwqDBSwBwW/1+YWv2UA65QFKml/7AriRbyiK7Td+ZyY8gOC5letvbIS
	+tnZxvgMZbtwhZVf/PwqH1aFcUrd6xcEEKMFHssiHhyaicvoIUS3tU+aksI7deqmPSpoHBKP5QA
	LgPbKehHQF0by61Ufj4Z6mGmyTKY22/nAQ78ejG7
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr255653315e9.13.1794864439353;
        Mon, 16 Nov 2026 13:27:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:23 +0000
Subject: [PATCH v2 07/16] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=JAnPagjMpge0X10XiR/LbxFcl9vIwvXlY8rdMR3b7TnG2zjS5Ef/3pOUFBSYZcopY2HJ+t+/s
 qtEtnXV/IW3BvhWLgk5yEo8YJikc5cpwNQrDqesXNsRHoPh2k6l5Th3
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132721_306040_269E5410 
X-CRM114-Status: GOOD (  10.51  )
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

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0


