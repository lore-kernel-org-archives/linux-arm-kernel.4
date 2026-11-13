Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7011606B57F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mF5o9Yp7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b35Hdgkv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=; b=mF5o9Yp7t9MzM4
	6z1dOWaw8z8GflvjJVDeBH7/6N3fc5kGZaXhBKJ2kwO/gj9h9SUnMX+R+BEj22//ExZgvmPAJFIaY
	1pYPrz7qwSYWzJ1igNLBLDWEVWkg7niH46YvCEfz+TwqFFUEYuL6LI6X/y/RapJfQ0+yKLrahSJQ7
	6HN/3by3fw9LVKuJqyDIBpZKLr0dkNPwiV6z4jQT7+HsjeyE3bzv53ddwUo8nfqUtYNzJS/bm6I17
	f63P90hd5oG/lg0cELgD+9NFIey//OcNUQkwAlMecPkbf4wimLOVB3XWGwrCDIxdtMBmN6w/LrGIn
	mNMhb71KNph49cGXjonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIU-0000000BLSG-2OX0;
	Fri, 13 Nov 2026 00:37:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIM-0000000BLOO-2j7f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48fd2e38825so217935f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530253; x=1795135053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
        b=b35HdgkvADf3S2wXjS1v5hyItjdD1/Vnnf6OZJ7sQH2h/Um4JIB2IH0p+TV1Cb/lqd
         0HLirN4Th1STNzfvccLCI0ekE9kVdHOCgzJ4j2Uptoxz1QbvWKsM5/ZyHCeV2hBcDlvM
         PGHJT+zSL5k8r2DFZob7IjV2UL+uXOKLeuEPuPfdHUGuP8uJ/KfR1pGYeRrO3OvjCOZ4
         42W/dbAvS+QMLjY2FSTpJWJ3KG4PHOCNLakhag1Hx23PZiLtAnnQnjf9g4aFbK1mvxjG
         ES2PVNDTGx0YazG47h2dBnp3ha/jifgNpnF5R0MXjq92puZ/lUYYxMfa8vMhRd8yKF+C
         HBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530253; x=1795135053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
        b=JXz1LXM2z2ji90sZcX5Kz+/sXdN2Yd1Pf4r1iotKS8rMbKPbQHwf9Kc33KnUGa3DAM
         8CE2WjioeoTQyw5W8EDzmte4Y38+1gOmfBQXxS8Th/vF+MIM1GJmW1FeWgFuK5NHqD0y
         e1ZezFzvsgc6r81VJcr1tcC/zccRUqWiu/AVvAUEodf1EICFyqIBG5/oyN2CMiBJtWTo
         gn/mWTT6+zgbS6YGEq7avJOhwoSCFCfk40YcMAJF9SIRor6V5ux6UfwR+VsLnIc4q2xM
         OelvcsWxln8nZifcl2JOaP4gH5oj2NvSx7SdPawoNu0YXOiOG2qU+CR5yBnoJZgt1kAp
         n8Og==
X-Gm-Message-State: APuU4Z+xuMehTODfVfdAJEzZHAx0WuhRmPraRaRRO8RyMGiNybdtnP8O
	q03dc63IyCluQwH3/iIhS0wVvKQOxOJu6SA+rpHk9TEChiHt6Nt22gKA3tgQkqfoFP8=
X-Gm-Gg: AYBFou1MEQHrwY78BH3q8jOrQ1tPIMtP6bP6jmLorto9sUarAvQt1RZo2Ck1/ANwBu6
	nRekmgE5r+4q0BJjl0RvB1SBP9aC8qPySuf/sEcMjqKNgtbY+HKhvPuUAo7ujzqOymup9VZPOiq
	I+wAO/PeHD+RwNpGkd2WF9I45vRX+8QrHlgwfJtq1TbQBhGS3Pqx+5cpwKdnpGk8Psa8t7qlOSX
	lKwOObv9fLsawHfF/LciL0TLF6q5KT+W+OKtSzQzgJGwIxPlxOzXDsD1euarwtyLqKWt2ZvgYl9
	4SbAmivvPmu7fDx+KNxReo2z8DE7ZuEXu4smWQ3bS3gr7R3anY1KFFnXZv76JUsVGUP0KM95e7K
	hV/T8JUNJ7ZdpqGyI1lx+TS6s3PMKTHjVYGpwR1bOwiFx0srHRa4fLowSBitPP76117e3K+dtH5
	xuT27gKoNgYAKhDW1moi79JGStjqffAu7o5zWa6YYoOxZH45KBSbQExv2YplKafQwwU2OH49Urb
	3fQDsoWwNQ6WrVI/HqWrNMOtn0o/ed9I+UtS1S4J/9TdUWZ7/JJw+zmmBOlDOIO4rQCoMDVwnZU
	cp4xUKQLXFngJmERvs0npki9p6SwZ3pF8cpNWob9QuJIPyY56KLMpXZnUwLdO1cstsuxZ0ylqH/
	DAEk9Or1rQEcDbu+R80fitifGCnuSpriSrn5cQDTDnuGkMIXDMX9cvI8TNs+ir/kp9r9M1BSp1R
	t2TWpXbIAQAkpPUBAP
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr2290702f8f.31.1794530252965;
        Thu, 12 Nov 2026 16:37:32 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm1875000f8f.41.2026.11.12.16.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:31 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset controller bindings
Date: Fri, 13 Nov 2026 00:37:30 +0000
Message-ID: <20261113003730.3667609-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-noble-sloppy-chamois-c71dd2@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-6-ghahramani.navid@gmail.com> <20261015-noble-sloppy-chamois-c71dd2@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163734_694542_2DDBC3C1 
X-CRM114-Status: UNSURE (   9.29  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> This belongs to the patch with bindings/schema.

OK, the next version adds the reset header in the same patch as the
schema.

> Drop, not a binding.

Will do, the _COUNT defines are gone in the next version.

Best regards,
Navid

