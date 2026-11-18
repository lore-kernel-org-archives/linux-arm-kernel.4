Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13194606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pRFIn6zg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGHzhase
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=; b=pRFIn6zgYS2HmUaCWBTKCAIBuS
	OiYMCOEgUw5ObKBsxMLfVAp7or++5ONY1V9vNAsTfjW1o5mkrUYBcMetrj0tvw6P9Rx2OcFOjn7/Y
	/RMwzF/x4GH7Ao9xHloVa+2yNIQ2X4+1i8ITIdXCBmXik3QG/NTogQQI2aH1fhPWTTw+Yc/5CPAiZ
	Ex4oXSpkdo6p1yzeo1j/puyH5UzSG18pHQSwBIdR8+T8Xi7DYpcyb2NhvSKs3Q7hv+93d0ZDHnjs4
	z59cpEwbc2vO6Fd9PG4O/DNYji6WWdZVuffA1/bhYLXAXk8ljrhH0eVSODzbN2UwoER9j4v3IR5fS
	y1VAxOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbGJ-00000008CIe-0EBB;
	Wed, 18 Nov 2026 08:43:27 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbGF-00000008CF8-2HJE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:43:25 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-382c3c9671fso686791eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991399; x=1795596199; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
        b=eGHzhasel10V/RUDBgkyH7VF4YACI3UI3vYUhlebAAs0TiiQWqoVhRItz56/648bCy
         9paXc7uWTmFzLlNdxg4ARuMS3F8BZIFS6MURtsY/b+Iyw39w96wIiPArkiCD1U2Uorbm
         58k7n79w1O3eH0EogNGFickBjuBGFudQW/rnyjEyZv806wgAbC3FZ7+5HX2ww9ZlN99D
         hJstVs94hHjRgcGslVoWE7gKYfj/cR34/Qct7qpiwYT11f/U7OynRMn+fqc+jOC/dDzN
         5My2sFjhbsA7nyr2IrZ/fgoLViXoV1y60t4UE7NLLRVpiLUpEnWLIca6NtnnbLU9nGjs
         vRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991399; x=1795596199;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
        b=r9JlVx3sxUmXaCmH8eSQVsL6d+LbSWNy54aT4haxzaQGxUVjIagkJT2IeUlBMIX5F3
         s15xkO7tCUPrDN8vsEYhgVJAFRMv17v5ulFOVuxPDUr6g3RvAuWA34KM7W37vtVaZpxK
         c8ftikDVJaLiLj0fdK+8tr51aRW3SCeAoMYnLaEvzzr+GtuZZyQIt8LGoRgeAz1zi5Pu
         Yc1hS9OFnzcduzmJbbexpzSz1RLZxpzbioyE/7LCK5vM/mny2yuX2OszZufhSq+2UrRu
         jeUjHCmj+NzgcKCc+qL3MrdkkFTjyWOJXYMSmjUIIdVnp+vriU9D1y+hipejZUqg8MnD
         KDgA==
X-Gm-Message-State: APuU4Z8qUR8Dl92J9Qi07hAy1rHw15H51/F0Xx7StasrDOCT0EN1MuiE
	hXp91ySZnArOxeDLNegeQjLBaovV986I9QM2Mvla8kh4Oq+9mLtft6eF
X-Gm-Gg: AYBFou2v657/8F5tAgOSmtnqb7jKXl99n1O6zyu405nH6/nAfaDcmjqdPq/n8g+GA/8
	9Fwwe6dWY0AKhQg3ndAJPLHH1Q2XSU3itONQhNYw8Wlt/WMwqLpWb4IaUwZcQX5bbO9oWRO6Slf
	prdWEqiWsY1QP7nQmpODOcMpV59/NHrLyot6eQ1Took6fvJGOdFqpAXm4lAgxG6N35UI7zVu0yb
	SjlKgdwn0jnBQcrpPhRQiSvE00sknLrKJQ/nZxN+SAFx4JVp8VVK3kXKiu/OcNX57t8IIszdoXZ
	EBuMZ9UHPc0WntPVCNzZsaXNEo6h3TwfWOzytspOU58BRc57N56+nqQoTpLNg0ZkwlMmhmea/cJ
	66zN6MeBX+mHJhN7L0fMKT2+5Qakh/c338QifBTTH/2hJGNSd1+G7fkzZOyZLWHOTwaa5GxWAMF
	H9X8FIE77jUizmTXCGnubF4bDbMPHK91G/fOHJokAqJ9YOAWRAxrkcm1ojyuS74GgicBmdkySxW
	U3RuzOs03k9VL73aTpa+GjO3tAiVcHz9SlmJaxcpB4WYnNNbTWlcA+56jvUd2nchiQxchj511IX
	+DfKBTkgrhs5C7FIHJw56n39UvsfORDlb0Mvym/tL4sjKfbqzx8hSkYrK7ujW1kCbQyeAmmTjfN
	3TJzKvw==
X-Received: by 2002:a05:7300:df0c:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-38280d307f2mr2424732eec.25.1794991399408;
        Wed, 18 Nov 2026 00:43:19 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:18 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Subject: [PATCH v2 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Date: Wed, 18 Nov 2026 15:42:58 +0700
Message-Id: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABJl/WoC/4WNTQqDMBCFryKz7hQT2mi68h7FRTSjTvGPJEqLe
 PdGe4BuHnzw3vs28OSYPDySDRyt7HkaI8hLAnVnxpaQbWSQqVRCCIXL7IMjM2AbM/SB0AaPjdS
 ZllaoXBuI29lRw+/z91n+2C/Vi+pwnB2Njn2Y3OcUr+Lo/XOsAlPMVG5vuqkym9+LdjDcX+tpg
 HLf9y9bSRolzAAAAA==
X-Change-ID: 20261116-upstream-greatlte-dts-f29792d1689a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_004323_629825_1CA82DB7 
X-CRM114-Status: GOOD (  14.44  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series adds initial support for the Samsung Galaxy Note8
(SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
Galaxy S8 (dreamlte), which is already supported.

The device tree enables:
 * simple-framebuffer
 * 6GB RAM
 * pstore/ramoops
 * gpio-keys

This is enough to boot to a shell in an initramfs. More support will
follow.

The keys, framebuffer and ramoops region match dreamlte, but the board
gets its own file instead of a dtsi shared with it. I only have this
device, so I can't fully check how the bootloader lays out memory on
the other 8895 phones.

Like dreamlte, it boots through uniLoader [1], which sets the DECON
trigger control so that the framebuffer keeps refreshing.

dt_binding_check, dtbs_check W=1 and dt-check-style in strict and
stricter mode report nothing. On the device I booted next/dt64 with the
arm64 defconfig, plus ramoops, simpledrm and fbcon built in. All eight
CPUs come up and the kernel sees all 6GB. The console runs on the
framebuffer and all four keys report events. A panic triggered through
sysrq was still in pstore after the reboot.

The test image was flashed to the RECOVERY partition and booted from
there, with this kernel command line:

  console=tty0 fbcon=font:TER16x32 clk_ignore_unused pd_ignore_unused panic=15 rdinit=/init

[1] https://github.com/ivoszbg/uniLoader

---
Changes in v2:
- Sign off with my real name instead of a nickname.
- Link to v1: https://patch.msgid.link/20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com

---
Trần Trung Nhân (2):
      dt-bindings: arm: samsung: Document greatlte board binding
      arm64: dts: exynos: Add initial support for Samsung Galaxy Note8

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 3 files changed, 126 insertions(+)
---
base-commit: 65ffdae53a6d522519fbd66d3cabbb4622e3e5bc
change-id: 20261116-upstream-greatlte-dts-f29792d1689a

Best regards,
--  
Trần Trung Nhân <nhan.094.vn@gmail.com>


