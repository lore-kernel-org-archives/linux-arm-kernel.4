Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77DF606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HWSyD0pf;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Rq0q5Xzx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EYl3x4KFTe1dpc4bktfuekDHeh02aSOmfJOAZ9DaLew=; b=HWSyD0pfh01rsq+B/SIP0RVTgB
	Uwh9jFS7qVzBUrKOWl8SfJoD7hBb8H24Zh22DCvlgNRCw3uhicayRzo/fy7zEfrhUZcRdv5/Hdchd
	RHBDkXGNhpnv10aGMEFH+UO9wgj0ZJvqmIHcHMgRbOG7pHgV2IYHQbZj2MZKC8njvvD+KAmeVh/kG
	nKxiRzKqYm6/t/QYlrcHB4JIFBTWqkMTBvzg0bUOOT/CwcT5jeVvTzatn8rp5g/Ou1807jGxc9JWh
	HpuBlREOGCGcLzZBubQWOMS4OKOF25QIA2Yh+Dl/9vI01f9XBhe6ZlxOMwHPrfg1hN+d5RVAJ1gGK
	aMtLbATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbu-00000009IdK-2qK4;
	Wed, 18 Nov 2026 15:30:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbs-00000009Ib9-0xV5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:30:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8600155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795015806; x=1795620606; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EYl3x4KFTe1dpc4bktfuekDHeh02aSOmfJOAZ9DaLew=;
        b=Rq0q5Xzx/pdTMU5kYgYsYKDWz7s1dHP5vlII6sc+koL+eXoKKlaht1p951mQ0p40Cz
         fGJ+Qc/LmY/1MkFPsnTbS8K/7KVb+vqv+wWM14+xLSM85ULtxNF2OM0idBMBD8GGKwkF
         bNL3L34Hte8bX5kvdtvSnww4E7t5EWTDmlmqwsRadGYMJyU9vvVCmtf9v7pOwKD0HL66
         eeqIg84LOQGYSpJ/5XhemVgoEpg+mqRbfAB9V3vMcVnDo5z8DXb43F63x838JZE9G2lR
         JNBFgx8Wr0QzmMQUnHJi8fLM1WW5TCKshND4EfqXVWKayo3gn4z8vZixKX8y9R59u9ue
         vimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015806; x=1795620606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYl3x4KFTe1dpc4bktfuekDHeh02aSOmfJOAZ9DaLew=;
        b=OPbnfk7llXDMzyo1oHq+UKBrP/MjV3WP6noHGfS+i6kcdXDSbrqQ5WKugvSGkPHMgo
         xAGXNPNUtmCvhIxOejBXP7zgSo9Lxo0R8W1MWXAQ8ltMq7hEqz4u7mrJlCszETOdmSD2
         lpr099G5vufrUc4XhiQqMu7CEwJgzAHo4U504CZ/cVesBMgRgFXrn0JCPflfFu4lEaqS
         S8ECzeufe8JkzCnHyteqrQKd8/6IYvz3oSQZnWIRL5G+ZTOCvXyBQxjT7+1DLKC9gYo/
         FiOWYUXysTVVG/FIYRWQTDovZ75H1vraSkEr48l2jWLH9gEcD8NyRtpZpFNHmCVxgqst
         MXXg==
X-Forwarded-Encrypted: i=1; AL+hErFHlPXL0H4jwuhuaUDf8NBJzV3d7Mu3X9sPd9rlLeriK7V9m8vDCE6RRTJcvnz9bvRaQShZOqZu6fRzdewE5MmV@lists.infradead.org
X-Gm-Message-State: APuU4Z9RMJjyNqU6O2AyUIoX6Z2mm+gKwjxYIRxnQtmODxSm3uFLyQYf
	gNviPAsky0gtv86/rktYAhMvKvEl0IKm13g4UboqKChK6Lw0mC3Ip1yBGb/CMe5IA/g=
X-Gm-Gg: AYBFou0p/6Il2sQVreCYJmhjkphn6iuRVZjdG5P8g/sH+okiEa1DuwiqK3daqcj3tpL
	Q5NkpJUqxDgmvGCVDTtBgR3LCrGpadlr3smdrGB/LYnNiKTyOiMh79gBQqSudAnehmOLGvSoeIn
	vyqGUgRIhsmOYP1JnUkIJ1RyakTFMtK5bp5qKcSlvgEp9C85fPtioZolbmu32XGyrZ32gkVBzwf
	/8hkqS+DuPv1rXNmV6D4mlIP8ZUy8X7pOWvijaaUIRQKfiq6tN7oNMrBxGji+MznLNLECUXc5yU
	ClY2Xf/jt+7uHAg656P4CMVcjyiDLfpdIzBJa+GmJrNynIa+ne2CpEWpytFrQTkVTHFx9TA6NOP
	oqpOLFK0oy76z95BFqp7iMRzeFlbQ286pgxdViop+rVRO+455ik1DrNyq9OAUIdij9NmalmdmgS
	TFjC0di67/erGb+PT0fdJrcmb8dT1nCy0nsEoo7iA7bgoBjwC1V/DWe9oj5iwagbIvaSt+4E7Mw
	ByECeLY3I+nvscB4sgjPYdMoP8ARyzXAb/aqtdg6fcA7/Lq8+vFZFL3Ktipu7GgqSCRzyFemefs
	f0gnCGi/88jlmmaOJPQj
X-Received: by 2002:a05:600c:3556:b0:4bb:6519:477e with SMTP id 5b1f17b1804b1-4bb7da24a4dmr59631565e9.17.1795015805629;
        Wed, 18 Nov 2026 07:30:05 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm275894275e9.3.2026.11.18.07.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:30:05 -0800 (PST)
Date: Wed, 18 Nov 2026 18:30:02 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 2/3] KVM: arm64: nv: Forward CNTP_TVAL_EL02 and
 CNTV_TVAL_EL02 traps
Message-ID: <80eb37d600ee6fa51f4c5fb478a31e8f0be180ef.1795014776.git.dan@pereq.eu>
References: <cover.1795014776.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795014776.git.dan@pereq.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073008_273421_EF5FD1B2 
X-CRM114-Status: GOOD (  11.23  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There are a couple timer related entries messing in the nested
virtualization traps.

With nested virtualization you can run a hypervisor in L1 and then you
can run another hypervisor under that one in L2 and a guest under that
in L3.  Without these then if L2 tries to read or write L3's timers it
instead reads and writes to its own timers.

Fixes: c271269e3570 ("KVM: arm64: nv: Add trap routing for CNTHCTL_EL2.EL1{NVPCT,NVVCT,TVT,TVCT}")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/emulate-nested.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index bf4b8a44b9c4..9e0c15e6be47 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -942,8 +942,10 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 		      sys_reg(3, 5, 14, 1, 0), CGT_HCR_NV),
 	SR_TRAP(SYS_CNTP_CTL_EL02,	CGT_CNTHCTL_EL1NVPCT),
 	SR_TRAP(SYS_CNTP_CVAL_EL02,	CGT_CNTHCTL_EL1NVPCT),
+	SR_TRAP(SYS_CNTP_TVAL_EL02,	CGT_HCR_NV),
 	SR_TRAP(SYS_CNTV_CTL_EL02,	CGT_CNTHCTL_EL1NVVCT),
 	SR_TRAP(SYS_CNTV_CVAL_EL02,	CGT_CNTHCTL_EL1NVVCT),
+	SR_TRAP(SYS_CNTV_TVAL_EL02,	CGT_HCR_NV),
 	SR_TRAP(OP_AT_S1E2R,		CGT_HCR_NV),
 	SR_TRAP(OP_AT_S1E2W,		CGT_HCR_NV),
 	SR_TRAP(OP_AT_S12E1R,		CGT_HCR_NV),
-- 
2.53.0


