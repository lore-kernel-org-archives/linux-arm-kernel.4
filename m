Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A63606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VIpRzkH9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCo/X3X8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=; b=VIpRzkH9hE1PZB
	D2HL7rPwjnbvyji+1SyaKK27tLcO3DgciPc4T7M1sd1tU1KGR/67faFDv9s3pgw9vYZvcedbiTSrf
	GWF/pyUFrsklNkk0ehUFdVqAOxw2OcJKah1+Z6Zrvyb8rBwyv7DZjvYC5u/lB5iZer0HGwTDklTvt
	jovB5Mfj5jNFrI7IZBmfZJshxpQXXgC90G3IWWXGVYhSjwbr0inczX3FbfYlCYuqAqe2OU8fdFK+3
	ZgW9qU265zsbu/GjDVMcyrcsJDUahl+JPo1sYAVlabWxqMo5A+0kEzrStTraQMATdahCOXFUKK90D
	hEj/L7HAm6DkV9Sqyb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3w0-00000008KLd-12Qa;
	Wed, 25 Nov 2026 03:44:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3va-00000008JxA-177S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:44:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso1781845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578252; x=1796183052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=sCo/X3X8PQAS+OB1zFMmHJYuYCX1Zl9PKsf8XpjvYNsNIzOHUzn9bVjxLRMbf7uSZq
         DPJYDgJ1kCXnUUbsfTBR/29ORU2RvyTHFlBJVvCSzTmxuG26DOdwMqTDG3cpmAK7Sitv
         5P83i+JGLSkqDrXUazht63xWDeNfQm5lica3aDJ+QTjCG5MH3wjP+2gb0GCtYD+IV3dy
         PyNgde6EhnispdlNGCW63dviPV9LinyPeh4PxJhpbwhz2/8vrQ7IzmYyW3Z/Ruirp81s
         dMcgS5RlZCfEG4tM4opu8p88YsqPXOdqBFRC2O1BW7GgqZ4t4+5kXm0czi4jhrKPcWww
         Bhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578252; x=1796183052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=X8If4D/yB6/38c0IdwUkAErZ75JI5yxu+NDnTYi6T5fQy9UENN2oDfuTMZOvbgTqIj
         Z/DrFE8+RhYBkrGZgp1XPWRmmaQEMgHLXJQzW5546JI53Na910SzMjzZ1opR4mKzUg0M
         Pw1pFLeFzG4nw/6fCAIP+fQXzi+Ogwcbdvh2mB7upRHzyP3N1Iiitn509/mqX5csssuR
         dwcmPxinIZRLY+noY/EkuhKyvXh8ps5VnD6aYXAdbr9hL5gnjbWOzzOwv/E6MAljbwE1
         zGqCZdt9/6y3LJa/0Vx8BK69eBGiQrdDY1roXFxfgOwqaoIV7O0UoPIsA6N8+I7we2MZ
         jkhw==
X-Forwarded-Encrypted: i=1; AL+hErEiKPCRBzQfbKmOSieLJqIfBvZ2G0efgJ3RKpQT14nyQpmJcyE4uZPtPEipo5hzR0H+IcWZrfFyrUewbmWxVzTt@lists.infradead.org
X-Gm-Message-State: APuU4Z98Gw94naozPrDupZCt9EiX8fADvoa4gO7tN8Yw2GS8aPvzgHqE
	fVCcH5RdFB0Pk7V5aCKTk6adibdR9W/dgIg8dXZYlVl23fNVdOu86UN0
X-Gm-Gg: AZFdTZeeHj/BsFJaeAWV+pRagBc/tXMi1yV4kCk5uqgSx8aUQDA/uJFeSCbPT5WjW7A
	m8t5jO7y9/he14wtyRjHEtLNdPa3P2xATKCYciUP1+rJJN+qwITuDHLqn1ljxj0p0ekEAmxetAo
	e4ll4pkgDNF1X65dDzlB34zcCH5p6dUQ+sLtMI4ykaQVYmyxjh2ilZPwz+F5OGJDe/QG6KVNpoK
	1MNIz/X0AFv4FwqaoRzf6oR3c185CHnYVBrXwGyDsSzH7pvrzsJ1xj+J0G/5fCEeIQMAZ7Z+K7F
	CLIrHGHxijcP7jwxq2xSap0mfq0OETcDVvCkO+Hbt8fyhTfB0gVjVwVDAyWWHwqmSYCntmDRg+w
	uZNs9E/8CrEa1p+bsdfrGgEK3/3Rg6LLQMrkvGCiLP38AmVRPG9a6SUF5dimLPoz4lNu/Ob8MoX
	yqIN0DIcbZ3cb24B4bghbCzwOisBMdZeeRUQydV+ussBRGfXyBa5m/GWFnQg77Gxhmjni61jxA6
	dLpqc9LciY1+WtPKfbH7aFPOovyffu/rvuZWEulZJ616t48MaQIQeRwdJShzFCLARfBbzsvmmaU
	6b+vG9QkVWM+IssMx0iPy7E/4C2bwe7rCPnjp4wgV/FnmxrBNHE9u8wVjiY=
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr399963545e9.12.1795578252392;
        Tue, 24 Nov 2026 19:44:12 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:10 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:04 +0000
Subject: [PATCH v3 08/14] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-8-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=991;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iODhhsd3yfvGtcciUvxgx8qkDXgsEtkBlczLh6ZRfrQ=;
 b=lvcDevXHoUjfOVIKmGcAADmxVZULBy9zMoHqx2H32a0E3wUM2ikLAFlGNM8+8Y16B1yXdXwzE
 0y99BcDJDu0At3F9ibFbmmvIZEbRo82dQ3K+iKDoR8DVQfXtRsOln6S
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194414_341589_0A810070 
X-CRM114-Status: GOOD (  10.54  )
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

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0


