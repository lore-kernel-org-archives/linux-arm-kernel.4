Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3252606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=psu5aQt0;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=op2wZBVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=; b=psu5aQt0KsLXmt3ebz8mS9PNK4
	H207XP5TRbIzVeV4PGjNwpcsTQWJr0mAt6BYQgthJIToDSEPnU4VmVafUcH94k3ZM/kC6te1C/Cyc
	vI8LP46grWVJWv0NTb7llx46K6rWAlBkdpwTVB/5aciLGEhE9eOj7xAMQ20p+ADq+XXXAfeMtkGy3
	0iabEPodOMZA32b0G0LEFkHl3AE6PZQGQUTPuhZfvXGOhs9SiKBWNkm0NKn15rgLQd0+c87Ky2puB
	gMuQgCmAhDuINWMS5lGzOpy9pZbddmc9HqEORqwwIYmYeU9JV6klRThIxejM53hwFFtUA4Mm7L4cb
	geZK6g4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQGA-00000002hOh-1VXy;
	Mon, 23 Nov 2026 09:22:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEN-00000002gmk-0YHy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:21:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28530555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425650; x=1796030450; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
        b=op2wZBVuuXhlJGX2QXrSW2VQgsLG+TYG87iFosMhs6I3hBzsQc3btYnDH/mZFMgz2S
         WrPCL29VIUqbOHs6JOYpCVPUcNakGo7d0lyMpRqxS/aMVxK+42RbHTcNoer/pM760TfI
         7WS0PK0XO+A8EeKGoYnA6MdOF+nrHGwN+X3TFnwB/IUrPrvObYxikk5rzg1A3bxVYQV/
         7CeaOq/IJwlQAdHKRy0S2wmSbV7wPlwdezPmzcnGntU59ceWcCpzBe6E6N1GPis/oAH4
         ybldwQRRara7Ljwf/CxN/LNkddjdIaULTRUStnjOnv59Jjq7yylOoC+pTSNDpAoD2X0A
         D4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425650; x=1796030450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
        b=Jknp5n1PSurtSEVkMnpBMZYQbfONXo2IKKVReG+Xts3mpQP+IIflVLdgetbL717T6G
         kANgPkBqbPCVzMKXQ26mIzS6zilBnr4kUz0D0RNIOp2Z0tX6p/wJfKPG/Q3nV+cPpjrM
         tviflC4BQzvBSVkqQf2TDc0kE7irIsGiC9rLqFxnSVNpoqgbe9y95zJct9QWg7uF9/ZA
         90T8knvAAj4QC2dVUpBYC7rUAL+8iKi6gTLDuv1prjINhVzugIl4Ox8SIgBgrluOZuKB
         avuGrhpYefUL5OA1dMnpE7VlFguXi61Ov1UlzEAlIRWq2R4CZunIqKCmxVH3gLz1BKDZ
         KrUA==
X-Gm-Message-State: APuU4Z9A17w5eywajzFS7cbbSaJxWl2VS54zoH6IQte0u7AxRynKOAzt
	mqHV/nIzUz8pxiLTGNkZ+fo6zh4cZHtLvLmxuT1DGZu5C45lmS4kopxA4ly10fybSm0=
X-Gm-Gg: AZFdTZf6InDiGWAtaqQtdaNb4+7CvIamVBz4mW6KY0XPIAnzsnmfIZFYVFbDXs65FPo
	rRgiNSTEbG83fH+M++6WTFXZwPOHfA2ZJwW4tguJkSD/AQAY8BG74qCUssbKLruFnSfyf5+yfBM
	HiS6g3VA//xC5CaD1qVLhS7vP1qbjawiL5A4WGg8f9+2w04krBbHQgLYmrFb302fXI3gDwCuh8K
	7CQrszPxQMJ+wiuSgC7Csq+rJaWsC4bcwEIyunBTuE33aktC7PVTmjqCYhF/fCezG7lr4SPv0AC
	7cR9Xpyr9Gzid/ps8tPPTI8af1Lq6nEuczl/V1+mMjDMZalorL51zTL2U/qrlIpyKdG2anOOq7b
	35DWuqDpchtjY1vZ+In2ugaZUKfg2I9AZq4cC2kyzQCVl+aNeOUdjKAw9WYV1KEu6FPyb7E45Lh
	gYEP7MxWDtUYCFuU1t3nnDJcu7RaMm3XWgpxLDyKruX03dbbTXk7lIvXROQcJ0vZWnCF1T3ytNA
	frIPzWOiSaTiIkhg626DChhQMJ9zCMP7jJfXfzalqxw5ycRaQbC+YhRBmQIYaZ11s174EK0O6Nh
	Fgkrn7yg1w9NTHaK+o7kCE41CaXo7vjnfO5DkHBb20DIb7/XqT6ewT0YJgNXRk0RjjxceExliB8
	UqFbFMKcLy+tV66K0DOcTDeHIO4kaDWkRHVTBgMBkPlsFRA==
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb887e220emr216644145e9.2.1795425650233;
        Mon, 23 Nov 2026 01:20:50 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:49 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] Describe the Amlogic S7 clock controllers
Date: Mon, 23 Nov 2026 10:20:44 +0100
Message-Id: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WNQQ7CIBQFr9KwlqSA0NKrGBfw+ShqbQVqTEzvL
 rVNXLic5L2ZN0kYAybSVW8S8RlSGO4F2K4icDb3E9LgChNec8Vq3tJpTDmi6WlqKNyu1GXqpeV
 yryRqBFKOY0QfXl/p4bhymuwFIS+mbRHxMZVaXme/WFdtKfWXEt6i8kIoyV335IvImoQUhr4Pu
 avaujFiD14zYE4zzy1aAQbQazRGt9ZJ5VjDyXGeP4a31iD5AAAA
X-Change-ID: 20261028-upstream-s7-clk-dt-f5b25465e9ec
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_012103_556348_DDD37096 
X-CRM114-Status: UNSURE (   7.97  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 clocks come from the firmware, over SCMI, and from the PLL and
peripherals clock controllers. Add the SCMI node and the two clock
controllers to the S7 device tree.

This series depends on the S7 clock controllers series [1], which adds
the bindings and clock IDs used here. Jerome applied it to clk-amlogic.

[1] https://lore.kernel.org/all/20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com/

---
Carlo Caione (3):
      arm64: dts: amlogic: s7: add the SCMI firmware node
      arm64: dts: amlogic: s7: add the PLL clock controller
      arm64: dts: amlogic: s7: add the peripherals clock controller

 arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h | 27 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi       | 80 +++++++++++++++++++++++
 2 files changed, 107 insertions(+)
---
base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
change-id: 20261028-upstream-s7-clk-dt-f5b25465e9ec
prerequisite-change-id: 20261026-upstream-s7-clk-3fbe6f33652d:v2
prerequisite-patch-id: 9ce04eba818962dbb245b10f1709937eb8054600
prerequisite-patch-id: a02fe1ec065748194293c458aae0bd6f6e7f152d
prerequisite-patch-id: c04475f82637c268ace81e969b67c159a1b0ff4a
prerequisite-patch-id: 8b60ed5e40d0bda09cc368292cdd7cffc621fd8d
prerequisite-patch-id: 7e4acbe8258ab4bf7b5bfcaa0c7b764b011d8105
prerequisite-patch-id: b9efe5d77d21ce83acca108e1050c5ae1dfe9701

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


