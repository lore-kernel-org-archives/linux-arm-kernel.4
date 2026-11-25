Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6ED606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=waQb+/Tn;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=i7fkoV+7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=; b=waQb+/TnrG1bdYQ+1wtBbii17v
	S7CjcrQSyNSDIqonb1/fzPJkml6ch2RSOsU8A3VStvviVB7oGPnpbEjghLcFzsAQDfvSwAUK89wjg
	IPceE8fnAoyhP2pgHenNLZmeP/CnE0PnrLb3t4GWELvg6aYDNeg2+kPEaHOTvNAD/9GPDPvwXZIbC
	pU9F9Y6F58WBt6DeOumTP6yf0uJAznUhZEhuMjHU2cKOyFR/mQ2bKW3Q49bY8nqmCjP6mw4RGj1LY
	Czt+pNyB7CE26423Fx2Kgtiaz7Xitm66ruZrnEvgdrXyszYwaOmaQ6t04+RanlzkIibZIo01vGgY/
	ZqpcWJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWInZ-0000000B9uT-0DeU;
	Wed, 25 Nov 2026 19:36:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWInU-0000000B9sH-1L5A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:36:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3898582f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635410; x=1796240210; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=i7fkoV+77Bpuw4C062LBuexEakC/63Zlqg4zYKMuL1aHO50qfu73gQAGYR+184lB8u
         RUoVXNxgZxpydYRouvDbS5xF0Ubx23sqqiBuX5HQMxXZhpMQv98nCQTBNiBmu1+axdVg
         uc0bNYBvCj6OvFFJNrPTIecrS30hNtP+myS4lVE/IMIw8Xm8Y9O5ycotCXzZoPXAQBtS
         JLD/NkyYu7SdzV9h8mbHObOZVELEUsYw73g3DpATutPzvl5r1+Iy038kkxSMeY22pNsO
         GtzYtRIuh0qytxNOCN+aw9JjP5oAED2iOZiVe67miKYEk2b/C2lhgx0yvtFyyY6lf+UJ
         S0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635410; x=1796240210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=etzQ1zXOVtXd6nLdM/p1WZugEfJ+E35ZWy+EofX9xymp482PwkzR0m1PYTOcdfFWrs
         S3NpWPYuzqHk0EWEOniThcSJGs/kSjaO4zrUxD3yPUviHUomY2QrbjYldK8LDNG2+XZd
         TdaXU/Ujk4aouftdDyGnmds5leI0KvhmVfhogD80lreG18V+4UIPyeeEgnA5H1lh+HVs
         GORm3CjCvvUNcWVXo5JGPJywhpNdrkiVrifpZ+JdtX4PrApa0RSnVE5tzjslyBVjw45F
         TTsC7HNMUx6uxYycPUHdpOKh4Z+sV9Fc3sfvw98vWpM6nr54XMMgE9JRNRuTAKfSdPcU
         vP9w==
X-Forwarded-Encrypted: i=1; AL+hErE31hm2Crlwrx6mP1gU2UoXgMpjnjSLSpXNT4vSbtuP7tFTSUFK1u0miboLcJ1+F6v7QmViGWgLcOT9e1uO0R4X@lists.infradead.org
X-Gm-Message-State: APuU4Z/18zcZcxTMuFMZzd5SbRGel0VYiGfoV2rWFT+AhdHUN69B9aD9
	Yl6KFTotomnVw5yoqEYrj1n9inhHuEyNFtZWN/gDvUVkEyA2zXnQLzW33is1H6Koc2w=
X-Gm-Gg: AZFdTZfzXJbJqKnDobPyhRZHWi9jjWX34IQn413fmntNhb0T5YdnO7DBtUcTr3c0GkN
	uM72+Ec17cdCKFOqnj4k7vbn7a7y/Wt/xk41n3FpKWwFKAWs4s/mS4QIoSf1JnVG6p4SmksxKVf
	4CE6L8NzB2C0gyOh8gDH6ihe/m+FtZAtijEESMfBJ5HjbHn182X1NRugtxYycMrrBwRobuyAD/k
	8MXMCXxaM3sbNlmYXX9OeAs7MkbYOKdR9VuwTRjgyjEuzaS5ViyiY5uSdq7MyllZ8ZjBUYkUvfa
	k/Y5KDO+kE+ULCOBPYxUlFiZDBJvCRToS/8aw7AntFzG+xazMs3l0HB+N6L/JStJNjt86gc7oZA
	JcLsbqUUL/7YDmnyqd/1B7zQi1oK75Icd7uLqlokf9APrVohovMVekYMNSqFkzy6KugLbd01aqc
	wajx+yCNoj4aBqAC3UWduyb0MCtIFb4ukpYI50n9kzOtXoCGXNTsnRsbzdEmac+fZMtdzq/Xu0r
	4gEGq+3IihUG1ztDtKvoz9avFrE9uR3ikSpUovhjMREuKwyt8FO+pBtA3ZbH/9lgbSKNZ8APWLC
	a3ASzseNsY/DpvyJfrkcCWOFvFtxsJcdBvCaveUJVlhe4wJ27sCH7ui7I94B0LCqrL7AisjuTtr
	osMwZjq4Zfw==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr24341175f8f.38.1795635410326;
        Wed, 25 Nov 2026 11:36:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:49 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v5 0/5] net: Derive stable MAC addresses from a unique
 device ID
Date: Wed, 25 Nov 2026 23:36:37 +0400
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNy27DIBQE0F+JWJcI7gU/usp/RF1guDT0YSNwr
 FaR/72QSFWq1upypJkzF5YpBcrscXdhiZaQwzSWoB92zJ7M+Ew8uJIZCGhELyRPr6jbhk9z5Da
 eg+PvxnK0vQCFTnSdYmUaE/nwcWWPT7ecz8ML2blatXEKeZ7S5/V3kbX3z8UiueBkeokaWuEtH
 PxbiJHSfqSZ1ZMF7hnYYKAyamg9gRkk+t8MfjNSAm4wWBglbKsbZz02fzDqnlEbjCqMUwKHzoC
 WEn8y67p+Ab0IaeKhAQAA
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5804; i=alchark@flipper.net;
 h=from:subject:message-id; bh=i85cUXhyWb7m3a6ui+zF4b9HUAnpfV7UPHIO1a7Igto=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5y19/A21y7VXBHY2fcuT1DMuHaewckTewWz88TyO
 W4mG+l2TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX3njMyrF9XWXL25prW7JVf2c0qD+Ql25xfV8fvPMng3/aTB6K3/GRk+PBaRrW
 QQ/Kyc0jP60UlW0IV5zNPfRXnsrzoC6Pc+VIufgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_113652_412912_671DB73A 
X-CRM114-Status: GOOD (  24.33  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Derive the addresses in of_get_mac_address() instead, as the last resort
after any stored address, from a "unique-id" NVMEM cell referenced by
the Ethernet controller, so that a Linux image can use the same stable
addresses regardless of the boot flow.

v5 moves the derivation out of the OTP driver following Andrew's review
of v4. The CPU ID cell keeps returning the raw CPU ID to everyone, and
the Ethernet controller references it as its unique ID rather than as
its MAC address. The derivation is picked by the compatible of the
referenced cell, as the algorithms differ between vendors: Allwinner and
Amlogic bootloaders also derive addresses from chip IDs, each in their
own way. The addresses are indexed by the controller's "ethernetN"
alias, which is how the bootloaders assign them to interfaces. Doing it
in of_net.c lets any controller with a device tree node use it,
including PCIe ones, and needs no changes to NVMEM or to the handling of
"mac-address" cells.

On the Rockchip side, the existing CPU ID cell gets a "rockchip,cpuid"
compatible. Its location comes from the cell's reg property, so no
per-SoC data is needed, and other SoCs only need the compatible on their
CPU ID cell plus the references from their Ethernet controllers.
Controllers without an "ethernetN" alias keep getting random addresses,
as they would with the bootloaders.

Patch 4 moves the RK3576 OTP cells from the deprecated direct-child
syntax into a fixed layout, as the former does not allow a compatible on
a cell.

Only RK3576 is wired up here, that being the SoC I can test on.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived from the CPU ID, and both GMACs get them
when the kernel is booted without U-Boot proper at all (via Falcon
mode). The raw CPU ID cell remains readable alongside (e.g. via sysfs).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v5:
- Moved the derivation from the rockchip-otp driver into
  of_get_mac_address(), with the Ethernet controller referencing the CPU
  ID as a "unique-id" NVMEM cell (Andrew)
- Indexed the addresses by the controller's "ethernetN" alias instead of
  a cell argument, matching how the bootloaders assign them
- Added "unique-id" to the ethernet-controller binding
- Dropped #nvmem-cell-cells from the "rockchip,cpuid" cell
- Dropped the net change accepting longer "mac-address" cells and the
  OTP post-processor
- Did not carry over Ryan's Tested-by from v4, as the implementation
  changed
- Link to v4: https://patch.msgid.link/20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net

Changes in v4:
- Dropped the NVMEM core change letting post-processing shorten the
  output, as cells have a fixed size (Srinivas)
- Added a net change letting the NVMEM MAC address helpers take the
  first six bytes of a longer cell instead
- Made the OTP post-processor write the address into the first six
  bytes of the CPU ID cell, keeping its size
- Link to v3: https://patch.msgid.link/20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net

Changes in v3:
- Dropped the OTP read serialization patch, applied separately
- Replaced the SoC-specific NVMEM layout with a "rockchip,cpuid"
  compatible on the existing CPU ID fixed cell, so that it works
  alongside other fixed cells (Ricardo) and needs no per-SoC table (Ryan)
- Moved the derivation into the rockchip-otp driver's cell fixup hook,
  which also makes the layout module unload issue moot (Sashiko)
- Made #nvmem-cell-cells required for the new compatible (Sashiko)
- Dropped the dead match data and address validity checks (Srinivas)
- Allowed MAC address indices up to 255 rather than just 0 and 1
- Added an NVMEM core change letting post-processing shorten the output
- Moved the RK3576 OTP cells into a fixed layout
- Dropped Miquel's Reviewed-by from the driver patch, as the code moved
- Link to v2: https://patch.msgid.link/20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net

Changes in v2:
- Switched from a scope-based guard to explicit lock/unlock calls in the
  OTP driver to avoid mixing styles in a function using goto error
  handling (Sashiko)
- Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net

---
Alexey Charkov (5):
      dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
      dt-bindings: net: ethernet-controller: Allow a unique ID NVMEM cell
      net: of_net: Derive MAC addresses from a unique device ID
      arm64: dts: rockchip: Move RK3576 OTP cells into a fixed layout
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/net/ethernet-controller.yaml          |  11 ++-
 .../bindings/nvmem/layouts/fixed-cell.yaml         |  24 +++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |   5 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 110 +++++++++++----------
 net/core/of_net.c                                  | 105 +++++++++++++++++++-
 5 files changed, 200 insertions(+), 55 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


