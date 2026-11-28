Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7422606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 03:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mvaybr9B;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzqZPPC+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=; b=mvaybr9B9OuUkN
	WKNRd4ZzrIRoBhWdaJPXzCbx3XlhshOk0r3g45YPZJJ7vw0dFtQ8aaUfDXc2T4dWr5YmQQ4j/W+eE
	xbcJNH7136o2UCKWUEF/8HC/O5a4Qk3jXrCevVARbVJf7L36pp4DYmVAyGwHTpj6+KytjkkNjUJy2
	U4HV7f4lJ93moWec5aDLk77KbWgsdVBS6iAFsOwy+UWJCDAoNpeyliXSRLdTq5J9y6QbTHchTXfa5
	7IX3WgiFkG00F9NCEc9sqgVoVv6utp6/oXDYvptNdkIRnpORiPVvtyeiTqXiHiV+e8f3dckC6HTSJ
	DM3awOTCG3ISMwWtfFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9X5-00000000M7z-3y13;
	Sat, 28 Nov 2026 03:55:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9Wu-00000000M5O-2lrx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 03:55:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2f0426a65e0so52364345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 19:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838116; x=1796442916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
        b=fzqZPPC+uiO22dGT074Jcd96FmCYItfEgjrdWfIzSJLQ5SzuPJDrcirznBZmVQs6Sw
         DEUKYGNU6/qUWsuYs8x/epgduqpwAUU4U0+YK4GBj1ZEgf0ObgsaXumZre6T2jGInZIc
         CAfB3ASIq7oXlP4u+O70XUlWHR+nHmyFktLbuw4WOxlCzXZThXUThnfdkBFuXzoR/VtC
         zHRZQjopXxZJTH0qF4P/wie7HFJeqIQsf1sXOVw6KXmZK1fGRs4dpu8Hs/UhsdgDEGZ/
         vjefhhnEnqp94WtORhjhHefxmFWKNuylrst9wAdmnYfoeHQ5x2cTCg7YMAT10MXt6wg4
         L+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838116; x=1796442916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
        b=WBsbWUhzPXRXw/HgBwFALvbo+XebJt9xV+aNOMi+Nim2slE+CxnTdpCjSF/xdMRiQP
         rOkxcXD+xWXLCHxbDHoJPPmsi2Aw5HK5YwECJfsb3UZTQD5/Z5nrz+AhXmZ3LXidfoU/
         8Z00cj2EB+dlGzkyb7rpp/dbWWTKkF2De6cpVkmPlmL+5GzBWhuuu4bWXCTaiRxKuGTj
         vOwQ4ckuqgYYDnqlPi1cu1XgNiN/fn+LRZwwukD8ZO3kMtScD8PaR4ls74zfq/+PCyH2
         g0GkVh6mkEpqqg6yDc56kc3yhCy1ApPKkCj80e/hL5smMWaR/2xtbbPHii4IiO34RSld
         pwlA==
X-Forwarded-Encrypted: i=1; AL+hErH5q8aESR6XoZ96JXBwfNIh8GLXKVZRMiKRstFsbhK7oaoEnIGJvz2LsfvbkkObBU9aLLnzc4LVi5JrtiuN7on8@lists.infradead.org
X-Gm-Message-State: APuU4Z/CIw9rSci554WnwHwNUkZESYk+5hxgEQo83j08AcGWwUHlM0ar
	MZRCR6mGKgCUUyyqsk74RHgi9+QQ60jvys1mVk14+oqinHhvmwGBNnQH
X-Gm-Gg: AZFdTZeHrcPpSe030xSWq/48klbf0cfWMoGD8jg/IXkdH5EES56xBfkSoZw1V7fLPRV
	4fb+Eu5V6N/IDCecXEHEdJwdvW651+BmLUVfQI+7F5OzoB5A7lQj80iZY7sw13UuXy5DIGNesUC
	PY7iIucRbVtUF4xfQThrV/vGGceWcuYS+ofwp4nknNr8v6PF2zl1DghqW0AEX0WoSnNXtGjsJxz
	tDtLEQP/NOt/7wTSsJo7ACtheorNhJKaxBLMV1NO7/8CNVxaAwqp4f5HN+ekv42RghGZMM3WgkQ
	zzLceibAz7MHLRTc6OuiveNi75hnUJHLSbesCTWf3KU3v9S5XUFsdxFsdSyJWweaSpVXVUurnMD
	vHFZ/ayE1KxItqSOX4BjNnlgp99s4UPSp6NJdCIlEmcxPH5fReO+p5G/jG0uJFovN0IkSSDQnKY
	4aUTjtS1UFJvdDESNeLwB+aRx67G0YenJuF+8FLls1M2/mQ57mYulRcLaIqv6uu/VW/su+mtNHd
	yYbdCNtPoILV0cau3Lp24XtQ2rf73Ym9UQsUq6FL2Qil2KA20ZIjay+1cKaWohxHNrYBXO+qwpa
	gEC6+rkqesD4E+tXL2Y79uVxSpGZbLuvV27H9KAhp0e3orkd
X-Received: by 2002:a17:903:19e7:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2f03f271d6dmr235900075ad.72.1795838115727;
        Fri, 27 Nov 2026 19:55:15 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:15 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: cpus: add Phytium FTC310 and FTC664
Date: Sat, 28 Nov 2026 11:55:03 +0800
Message-ID: <20261128035504.760778-2-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261128035504.760778-1-idleassetsd@gmail.com>
References: <20261128035504.760778-1-idleassetsd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_195516_722730_ADE10560 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Chen Baozi <chenbaozi@phytium.com.cn>

Document the CPU and PMU compatible strings for Phytium FTC310 and
FTC664 ARMv8 cores integrated in PE220x SoCs.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 Documentation/devicetree/bindings/arm/pmu.yaml  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70da..658da1fdc4 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -206,6 +206,8 @@ properties:
           - nvidia,tegra132-denver
           - nvidia,tegra186-denver
           - nvidia,tegra194-carmel
+          - phytium,ftc310
+          - phytium,ftc664
           - qcom,krait
           - qcom,kryo240
           - qcom,kryo250
diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcd..49976c889f 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -79,6 +79,8 @@ properties:
           - cavium,thunder-pmu
           - nvidia,denver-pmu
           - nvidia,carmel-pmu
+          - phytium,ftc310-pmu
+          - phytium,ftc664-pmu
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
-- 
2.47.3

