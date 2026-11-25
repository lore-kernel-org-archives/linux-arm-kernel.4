Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520A4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GuFBy0oT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4Ao0u4N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=; b=GuFBy0oTpFydhV
	ln81S5KdPUFDuOcqWyOm8xJKdpa8R+mdeuhtmikCSd1Kkgsy81BjqaRXaeYp8QDOoCcD12t1XctfU
	vnshtAck/L3nN1eswfYFBbjiEUepX1+Ca5zmo05tMP/LiRGFDU7btbOAFwgSB0QF35Lu8yz6Y5W9j
	I1igK1rpITmvKIStwHT1FTisVIpewXgSJwToBtoP3uUakn3oH7DpWVHuA2NjZ40rCpDRzLC9PIW9V
	gOPG1+uHD32leDOvH1zH/zd1tYXph/KcKYO31WlE3suD1WaoOrxUnehAUKb8OB8kiW5ShxpIcWg5x
	nQz3aAYcc7Mpu+/op1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vK-00000008JmQ-26Td;
	Wed, 25 Nov 2026 03:43:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3v9-00000008Jd8-2H25
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:43:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso50159585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578225; x=1796183025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=a4Ao0u4NW4XsAg5iMGn16+ijoktkHWRQxydvxNdpyxKHmcGmqrEOz2+4t7A26PCPTF
         /nCsW2uBvsa0rJltaeog2bHzC90eNSQOOjcLByjNfnne0MROLp0suntu/g/yX1Y+ouXv
         MuGxrc3E/QpMp+d6VX0sSGg+IWSJMITtOE0ibYs9iX+ceM+YTRK2m3YC2dWREiUlNBgZ
         CWi5SiIjJ5O8dRS4cewE9wskNFZUpVSvTk1kSmgslAMHmPwLwcZ2IK+9hMEHvVSRqgyI
         1U9CVyVyoGfzmcB1dXeWTlUdJdw7w2lk3MEybrGwSWUy9RA7X3R5sdubRlswbWhFM3Ym
         bxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578225; x=1796183025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=A4SIN2Iurl//Zc0IT5XwfDTSfyDU2a38IEd/6NwCI0GNdxMdznsqjDPkb71HTwAXK2
         /B+Y3+0/q5VxzYas7MhzF+oQ1M5n8Z6mmBhanbkqbCLL22Ph2wzHcqCAAUptCH56/u6o
         PPoMa7wdvbwuAjN14SijF4FYaCH0HeC1DPLmQYWz2uJi3fpP9HWywnzqBLa+vNHq/O3N
         kDgTrvjwXPRyw0xcrU4A8r4fUjYEH+tYEbVKEyhK8qt91GI1CdA7UapE1lsxHDonicqJ
         jQoV9KtegwWn+mjsRSG3DqwGBlYEd2/Bnq8PqzC4BL4UglEOBeCeSNBiG3L6ctl2hEPA
         aGPQ==
X-Forwarded-Encrypted: i=1; AL+hErEOFqi9lS6v/m2JRsnj8NwXNnazJVW8skCz6NU6aBRgtePOEbuhfcM+wv6ZaOgXWTS8JSkyos5ND//TYxvmYczS@lists.infradead.org
X-Gm-Message-State: APuU4Z/GbqjkO5zhVn1RWwNvpDw7NIpTqOEYlpcf2JQ1TwzG6EGOzvMI
	ffr+GIvx9QAUVM2KxzxDrJpM+FH8eitITZisFHurg2CvynSLXoSxgeFq
X-Gm-Gg: AZFdTZdelH17QnpmPv57pkZztBAhXjjqUSA0QrUQjBJJr0ayOPXMjKtD78Pg/OxzA12
	qjyCFI0YyczNI7nSgdzi0bpKTno1UWksWLZIGNp20CpR7giV7ZSsNMP3YColW6/maM6FODY1NzX
	7j+PjK+IzbFgCakIFJuNzjEr4RytisjR3RdICLeKo7v6WUa2gZZWh/ImS0FONQLnYC5yinx+Y3K
	QrtuD8WuGHsgWHJxuJ3I7w06wTGE6faO2da15fBnzyW/W2VqgliB0a4pnh2q5IB56kCCuR7M9/m
	kJY8cTqAaVxG/Lu/ey4DqyFEf9LrHJtAymlAty6KqvomSzBQrpYaMnhp0BhluTtmlnra1n1aqhG
	rG7EB8IBtzzid0eBFqixPxdvs9Elv4Lj/UmQtBQtUAkNJ+uD3X62PSnPd7+huR/ChxktX0Xslnl
	0BPG7b8N3NkuVAuNyPrm6Kc0Lzvk+gUvLuekARKpq/8ALVvH+p3gvttQNuyy0J2AQYp7OevI4Gh
	Wmf9YjDHqGgqWHuKKzWhQXeHQGiS0Zyl27kp0SNugA2RhLcDiKn/+SiGzQY5y5y/84N84k7K4Kb
	r/4GF/1n28N1QDNdzAx/9aoUXT0dhju98YMR8w==
X-Received: by 2002:a05:600c:a087:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4bb887c9fbamr346060575e9.3.1795578225601;
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:59 +0000
Subject: [PATCH v3 03/14] dt-bindings: arm-smmu: Add Halliday SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-3-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=xCVPapQpg3IOzKVtAOHGmXsvfGx4fLaMkQfgRrvbjtK325rtMzpV4avhI4qPqmiTdlTgkoLxC
 dBxQBhGhobHDwrnWCUlsJvGEoN9HKps7J2KipZyJFkE2yjFIhJECBv7
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194347_629786_E775BBD1 
X-CRM114-Status: GOOD (  11.00  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


