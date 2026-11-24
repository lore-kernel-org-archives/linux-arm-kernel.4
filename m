Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F0E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=faWxmstV;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=gtJrI5TA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=; b=faWxmstVeIlM5k
	p+d0xNoX+Hg2OD9OGFfQW5Xkc0azbkN1BLX23mxwHx+qZWhOY/5MtSsWGbjDVOoacB68W5zGKrVoR
	TirFw/lYWK9mKc7rE3ZuVShJoJateUbGncKS18sPfCPwxAC700R24/yyFCuAIXgKTV8Ixl9BhC33a
	Fuv6ngou9BC6DVqXAw6aoCx5Zttt+8lAQ9npnPLSW6yM5v+UM4dHGjLob6deJMmBf6mNcifrbXxix
	uBT9bMjxwILaWZxEArCIZJ9UoClkBlNZSp8nTZPhpNH5RyPUJHQHT9mAgbtRmcynuUJl/2PPKJmtv
	i8v37O0dL56TaYmu8Nyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGy-00000006T4q-1PcF;
	Tue, 24 Nov 2026 12:05:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGj-00000006StJ-2iyg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:05:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so47182445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521904; x=1796126704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
        b=gtJrI5TAe7eONZo1Y7gScWjkdPa73AlpxtInRl63XKGi/TN4NGKAjzNmKxrt5zFitY
         WxIZj+rCVTcXxnUk9To5KS0B5TYoLmJBw1k0SuIO7h9yYC+GsFXvBcA2a8zKCxKdBBKY
         6mdvlbMT1eFPS86vF4vKbm2G5mFsTOgTIddtJDWUMe0aFJYhDKJhi1Cw6aDt3yIHbpol
         rBXGJdzi9ZsmMNmuYaG3AXvaaO2mCvxJ4I9n62b/S1Vjb8ooEG5DBiG5JpccTD4fJGkU
         MULyj8skiupY8H+xLbt9ej8BtaZNCga/8hGR5ORAKQPVRa5f9qzpIKVCJYaECIMwc+vX
         h2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521904; x=1796126704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
        b=LKLB0jEojUiE8V6OhiTQm5VDFGJDu57RTECrzOF0ej5eAYEuzmaPaO+vUqQAROoLDo
         9mSx4MlTAJTpbp7v+7PgQ9Sb1ObDYkO6CcKaBGkDJdZn2qtNj88vc3hi2xvY1/Tpv1b6
         Ho0kA0uN3tZlPNhC/E8v5VLudt/kcT1AU5ukxCPhQlk2/44YPSPbvoCWltr/hPemBxoB
         w7aTb0wgHFAux6+AdkwjP1jMZp60udtURSiDVvHGZTP/ppnv3z25dOK5nNU3PZ9I64zK
         fmOfUH06TEZRIHKwAR5lG1r7yB4/uqbniPfsP6D+VhxvJH467cqFeqBlVGqFbtffF0j/
         9PGA==
X-Forwarded-Encrypted: i=1; AL+hErG2AQWuAp5f+bVzsYOruHJO3gejrKhDzsTp5LIakCXK8iViOzAKND7K+bMNqrdH/S4BNVQD8wCAJ8cha1ujWBD6@lists.infradead.org
X-Gm-Message-State: APuU4Z+BHtPIS0HEU3nr2SeJV7a13SDK9xFw25WAHtH+7gCDmIzfBfjN
	VtWCJEnYWpJm80YjV4SBzm3nUzu9xv3Ng5bfHmuG84hDXGhQPqFpWO5qsvv42oYrSVM=
X-Gm-Gg: AZFdTZe4VXk5l6vi1h3JfL3C04z29z1NE6giSf7YnLL28NDDxYUxcAx9Ou8MhL5jJXl
	dwSaKnpfxPnkTcLna99e51t0ExioUuLuT0Nqj0Bl4qD6KrMK13s1YbhSBYNDiGS6xVF31dVBOft
	Iwf2jAwppDUTzsDbwespfeRsFNe325n/4Ieg18b6Hy9kUo+bSJkd5bnY3qlH3SArJuaV8CBEbGB
	cnIjEPlnaHulgeOEReJ0X7vQgkkepgmkgeKCq/0FsBrMLcGF/gm/uZw92mKWztBZhPX69Rbbtit
	8/z3pyiCHXKUTODjvYflV9HJ0v7Rdcy95j2h8t9rxx68fco3GyRrPt6XWc8oZRouyxVPQn8Tav9
	XPwBSV0NfhI2lfiirYcHp5Hg4o/20Cospt0ASH3x9bc5m1+tGRoUKBP/nSwJxUZPVILF3BlbKgT
	11YN4YUJemupMss5ABddxeT7EnkY4Fv/0pxW24WTbF4/z/1K6fqnwMLqeigoO/XQJ772uK6rAhq
	lw920ZFqVHOJKt4gszxXx41Ic7k39SrLhyKyV+S/AqQJmw9f1EiQmh9Rw1S6cZwf+iQ9B/u5WCB
	7LqWUbmPjfe7lHNvVZ5YtmZgin1iIKKTjzTqDw6TF3GErAh5Rxz+mrb27PXzkr8YoH6HUYOzxfs
	2LJOhLFNT
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb8892a21amr273175025e9.34.1795521903923;
        Tue, 24 Nov 2026 04:05:03 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:05:03 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:35 +0400
Subject: [PATCH v4 5/5] arm64: dts: rockchip: Derive GMAC MAC addresses
 from OTP on RK3576
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-5-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=alchark@flipper.net;
 h=from:subject:message-id; bh=tZOur1/QC2p0pVqmEykIV1YH8t0mT0OobMPfGwIip6s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gZzMG2ZIVa1VaHNpl5i+Uabx29mRjirng3cKjfv8
 przth/OdUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVrQmMDLPE63JuX70qZ+aS+dFd/8Xf5FePN6WYKmtVc1981MhzvoeR4WagBYe
 7mGGu3MfyE5uP9na396055ZHrZC64m1Eobu5dPgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_040505_729753_0F9CDA4E 
X-CRM114-Status: GOOD (  13.22  )
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

RK3576 boards without dedicated storage for a MAC address only get a
stable one if the bootloader derives it from the CPU ID and patches it
into the device tree, which not every boot flow does.

Mark the CPU ID cell as such and reference it from both GMACs, so that
the addresses can be derived from the device tree alone, whatever the
bootloader. Boards which store a MAC address of their own can override
the reference with a cell of their choosing.

Note that the GMACs then depend on the OTP memory being accessible, as
the thermal sensors already do for their trim values.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 2e83a73ddbb2..55892f4afe60 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2070,6 +2070,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -2118,6 +2120,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2317,7 +2321,9 @@ otp_cpu_version: cpu-version@5 {
 					bits = <3 3>;
 				};
 				otp_id: id@a {
+					compatible = "rockchip,cpuid";
 					reg = <0x0a 0x10>;
+					#nvmem-cell-cells = <1>;
 				};
 				cpub_leakage: cpub-leakage@1e {
 					reg = <0x1e 0x1>;

-- 
2.56.0


