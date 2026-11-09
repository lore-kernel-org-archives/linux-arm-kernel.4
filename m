Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F967606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BQzLynNU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjPtbDIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=; b=BQzLynNU4yYfTo
	auPlNcjncO3mz3szO/LT8eKpGXN8RSw1f1cXXEZr+SzKvnUcn2WLP3dxIpQIxOVGOAKDE56jqjx2P
	8oJy93m1hUN0IXhOOa5oWw4RpHxtH9fRSRdzFH82OJge8fL7PP+3xUlC9oOU8+lIfucQUftxudjE+
	XLjIcCPxO4pFfSYrlRecX3tQAQrRyaTM5qVo+E57FvF0fEUj2WP9pU6AkfdmR8QtxO2ZQJdT19kHl
	c9FkFlH7fS64Xgmjz2vUSFxjqq2jeRN184K0P+n5Fm+wawlS6bhDtVIouv17pEGYtoGirS9AohBvd
	vth8K5DMV0lzKw2HXGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKh-0000000GyMz-46Ir;
	Mon, 09 Nov 2026 00:33:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKe-0000000GyII-1BP3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:33:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-490a0e72588so164364f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184434; x=1794789234; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=TjPtbDIQt5IS+Kwh4jkijO37Z2VAMCbZUNP2HjxxGDHPzNlpEMOt+axGVEcymjN+ue
         90MO1jFLv+o7uGuJriHcDAyRISykl+gU9xEFeuGpUvsf1cB36lrURNZ1rB0awPW4tRez
         6JDqnJUJI3CtsfBSm9FskdxwQT/HByPbcrQ2eiCyS8+hd+2wQY0Pc5LmTdCcO7+z1KJr
         z/2MWZx4xfKkTvqaJhG4ry+JFsij70lxMwCu8XgOD2TpkdP5X64BLCYWQnm8sODNLguH
         qOd0qPAAQsMuMKUDS14iIz5HPXQ50j9iyL0XEBPcyacKQbZ8n65aHN7Rd0sqJor14JqU
         CKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184434; x=1794789234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=ucAzJA27nkkr8C6l5OCbUiWNfZp1uvuF7Ndhji8PD4F2a2t/e/bLll6bcJEJ3qy/Rk
         DIrz000KWuXuTjrw/yetL5sp+NECj7HFg3U4W2AzsXaflKvUcg4qonQH8vfGYiXRWA1B
         B6M1gInqXm7Q1eRwopA4o7BOdXC8v5PU9BhNfhn/2XnS27exf3z9P49Cl8B0xLK6LSRd
         uJckAOEXHsuXFJmv1cx5Br+Js4pyF2rGXM5fRr0Zx7SUgJi3a2fgsv2KBWL9cnbPakW2
         MT2m2zsiwNq9pv0zICi/uFvoCYbtK5AoxfwFm7oJoLm/Bk9pj4btiRufKeAG2WMkCesl
         KavQ==
X-Forwarded-Encrypted: i=1; AL+hErHS8QtHqp/oR7pXmFudhoRxhYkCk+GTSIX7SWFQNag/uVwMo5FR05CnRbeqajQzj83YdxtJ70I5iQNQOUW50hd5@lists.infradead.org
X-Gm-Message-State: APuU4Z8/rP5S9QvOHWob5HIToLE2eEJOxzQHHbSQanoSorVcllRcJaxz
	RbDqi2eC9N/ar+SSoTAeG3Ni+rEei1EkZ+CwNgOKLvcFVeEx896lN7TC
X-Gm-Gg: AYBFou2NiJYA8z4lRl/21wXfSvt7SFqkgn7IXAJALhiF+eux1hpS07V1bW5WwsWHhPA
	ifZceRlAKgNtksZA+auFTWnHYnyQG7vcIKbz27QKSwZFlPH5oiiQ4NEV1TzMP2H5MkNNLjx+PpZ
	o+vEwunALOvDtIZZ9fbn+Zguo+m6zVQoA/3AGqDgSni2Ob3BCmTbjkaJVPtn/3ikav1rgu0ENua
	/6yCNfTk3oJPhp9DyKRpekjq+SPK+UJb1Wb7k7Pr7co1YeWrHvEzUeFyGMwLNFm7/xjASzc5e1G
	JTfb5tudXqjrenauSmo4IET/xk2aXCjOu8ycJH439LDtAPkoNV9UF6r4MAgoksqSelX6ltPsWrW
	WBX73/ThIUsgC02qIMRQMhFRf4Gyz/VOanikZ1SpZ/OJIk0YjflGiJHGjkK9u5WFwKUXqb34PER
	Gr29zrO+jlPvkx370IpeMLhYiL4xi8jEK0d7wJ71opU5uRs/uIKzENy9KiMMCSFsx7Z/7/QJ0Xt
	E8To3gM+WoKmlGO9/AseHQgH8jdAIfYUcgAUbJBdOqe4ltBMaJ6bjP+1HwFg4O34jmVwQoUw85H
	Wl8Srg3EKbGH+gZeFCgViU2jGJRrtRgPYoERNsVSAw==
X-Received: by 2002:a05:6000:186c:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-495856e15f7mr5379354f8f.41.1794184434351;
        Sun, 08 Nov 2026 16:33:54 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:18 +0000
Subject: [PATCH 06/17] dt-bindings: arm-smmu: Add Halliday SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1112;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ePrzoruUVeLDRq3OCS+DiCl1d/Uk3kZuK6w1BATsFKY=;
 b=pH81WehGSEFzi7T7LS+ShwXYAfu5lsev7imaA1JaeNifItRSFvMkK3a/y3Fr2K8IwuXgQfeAv
 1F1xnpR5tNxDdiiDmSxt0TVIqWh9HxtwfbMTz8uhxpsozlK3LlCAs7D
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163356_345945_02CABAE8 
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

Document the SMMU-500 on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0


