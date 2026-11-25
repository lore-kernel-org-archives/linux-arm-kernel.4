Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3CB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YjKCLwRr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbyKzcw1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=; b=YjKCLwRrLxTseE
	fggACQxy3RNhGIrEVUYtIp8V//EbJ4/X7woVbUK2vDm1r00zi4T7oQbCOISl80qXQOoB2u+UByPTv
	G0wQb0Tul33wHBuiFnHQkPVtms24KRdflUGVtiVRtU4e4A7yt8l6XZCWfRObs/yvDiIeuT5V9+f0g
	K0x8HYzas3QY9VlYww6wkbDlj5/MIgMgBKwQ58BgB2qoFX5/LmSkG9ePUZt22kQZmIJWvBjyyTvbH
	NnoixqlykrTGqwzrtTBdsQctmFXf39AfvKDYcYt5lsgOK7xiqJFiM6Nxti8nk9BgS+J3IjgScwwjM
	jPdGivP/PoUVaEyg/U+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vA-00000008Je9-1OtH;
	Wed, 25 Nov 2026 03:43:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3v4-00000008JaW-2fES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:43:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so48469975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578221; x=1796183021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=QbyKzcw1jFZskRLA/A5y5xz3gnDO1ZDruyVqk5fWaJVVY7kQ3vCQducvCiwgQrVLF/
         ye9A2WG8x2I8ch8ZC3EdBHYbfGNfhZyivX8X7xzM9iohwWfFXt7l1El+XREq2NAUZdaN
         bbxNCjtnDRMvldP/fExMG7dYuPrtGupnSUPCetOYf8dTRgh1dfZWK9CIri/vQkpA4vai
         3GAj+tYwAPwoJFP+m6Bxtar1I/ieG4AJf4z4Ugo3D21mKJoShL/ImYktJujGBqF7wypm
         ZDo7MI3ruDqijWwSMNl2Vce7sadQqSJ0iWi9fk8AhZBRij5L8MCy1E1S2nj++Ha02o4G
         B6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578221; x=1796183021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=1yub33rf0mKTteTjPxzz3DP+S0kGO1Z73ZLVKBQ0K1M2OFDulTCdNOLIA4qpf/ZDZQ
         lrRTzWWzhtf3F44DPSyYRz800R0A81+Y+CoefLYvgQsNpCcgQnfRMO5XFajtdtb0VTxB
         NzuuAuW6iYFd4v7Ja0dhTN2VInqCakxoSAWqbl5bjwRpUafpaODGacFNPYDaYAwfmSnM
         XA5mPDi7qTwBp0V6rbVSdM45gz7X8ibIfEzcv9SAIvp3vK7JLAbBveGzwK2rFKX994wa
         NV3S6uoh8c7JNy8xto/6B1DPrpyK+18dA8FJBd7UzWzpv04SfTsZkeDFzWOJI9pCxhan
         pOyA==
X-Forwarded-Encrypted: i=1; AL+hErG/M3uEjxEEb5Tez8wyC3gAiNTerkP0q0P7TXf1jVbo/6QvfRhL8KODMmGqsFUBEujioTVfwH2f4eLnNqFWNloB@lists.infradead.org
X-Gm-Message-State: APuU4Z+zYTzXqI8rgYXuVDIZg/jUo8oOudBoa6b5MnotabvFYdNkIy8A
	X9IP+S763h3sAcomBzOL4PIsFlsbttwuvEEh+i7JYTGzpUtYComZ6muX
X-Gm-Gg: AZFdTZe4OY7UtMpCzpK01uufHgy6f3f0094LcDiwKVVKfQrcqQzsaP7q7KFyQg+tWey
	RQgPC2zZyjOKhBZLkwotPCR3VRLkrQOxee+vRREufTNgbFSxw8KzpCi4uBpIofvkFcXf8oGPoKV
	vP5hK/ocqh+8lXbMUhFCDTre3DHqjLcal7nwLEESpxcqSUmLjNf60zKtxz/Yda+t84Tw9Qwziml
	nLhiaf76geKUl4qwqNb2CtHD+Mbll/xh83O6S0vF43HLDdc3vSIoEm1c+TILI0XZcOJejpVBrxy
	yX0mDLKU5SbOcd9Gf3Z1RWS1XXeECe6wi24WcrrXo4QlDPuhbL1E2h9fXmr3tyQHkApJnYapOGj
	VDO6ZBuXkNUVf9zG5NwtUSyGdxvKHsW41uGDMFiuLyr1rRUu1muX6n3Lcmj/c8OsdjlBal4Mr5C
	qOilhYeFZzUt8/X4vNNzyRrunH1QtnO7/SwHU/2y0fKSPNqNMsWtrTe3BOBgnM4cc82u9ezSkDr
	7o2B197m/5IMo+gvle8WkQcmlu8qwhnhUykQHf44usl+TKiPj4E3zLWydDdEjmFUDRfrpHAoWok
	KDDHyHxVfP+GztkLa9WqSoqLim8guvqGUWhZwA==
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr328092505e9.34.1795578220699;
        Tue, 24 Nov 2026 19:43:40 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:40 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:58 +0000
Subject: [PATCH v3 02/14] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1076;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2tteAd38AfHrvk8Awl3RAniXNSdGBzL0LwEwE8e7LoI=;
 b=5C7/JmmmJaij3ZDCjC7taKHJ7ftfQrXNJKeux4QbuaH+Zgcx8qkDlh+sISv0oWyhLHGJ/5oZb
 fvQPpset2HKAWFH7uV37/GtdVaAFBb3EKxSiKjnd+R0Yi73lf00uJQF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194342_695793_92FDB8E8 
X-CRM114-Status: GOOD (  10.99  )
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

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0


