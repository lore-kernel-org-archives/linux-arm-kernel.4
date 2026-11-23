Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A242606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H7fyHCbe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2PcPUT/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vPQa4vtqRqby5WDNW845XbNQIUuJKanxgqfCE4nY6Wg=; b=H7fyHCbeXqR5IW
	A7Mbn8AXfksdvYEtIzDUHzc3ZIQYypeKKDwM+7SndSaqBhuPPkjP/yCUDsr/UhhE54I1vK+/qeYLd
	VlrI0HgjQZLEyc6WcRUheiyE9SkjF3Ck7dJb/NFt+CRZyLrGGEnWfnJQAJSJHd/PwhC1a10krXiMA
	VYffMTXZq6tRGZObwj69NLM1Ysl2gymbCGzO5NrC6sOKJfH7TdQZmETQRH0ikcBxkGY6WgxFgpDwn
	udpa5MgFj4U7gbFpMkiq+FnN3AYg49tZNPyXV7OGqTrW4DLicRvOoeLn6Fud6+MyPhkbdSGQNheXa
	KV6VMJO6QSm48R9e5ClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXN6-00000004HFC-2zPF;
	Mon, 23 Nov 2026 16:58:28 +0000
Received: from mail-dy2-x00.google.com ([2607:f8b0:4864:36::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXMb-00000004H7E-0rSE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:57:58 +0000
Received: by mail-dy2-x00.google.com with SMTP id 5a478bee46e88-327b1d5824fso3083916eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453077; x=1796057877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPQa4vtqRqby5WDNW845XbNQIUuJKanxgqfCE4nY6Wg=;
        b=V2PcPUT/6KhcYrG/y4YNa/A1VRdPgZEb7Ioy9XlLgRLxaSKIHl3M0EUp4rDECg9zV/
         xDw5d17xWuc15AoAOj78tqvnb9QR/6iyBTp7KmvDqhd9Ky2rwTvP4rFnzNqmMyujYzu1
         ub9eMZkBHCFyqQQuSUreXq+UZMO6jWQj+KyXyrCj5E2La/oTi66yRM07zk0ahoF4J3Cw
         Ow3jdx/4JWLOB2+lh5T7t318JCV6Nqeewq4yEAAomI2C9eaRzq8Z6mZEdH7GhbP0ukl9
         Ayt4Iqdvl4k7EbHSf+erJXCm1Jf7trC9vBW/sZucoMF0pLtGLsRIoft23vkffk6Vzrkw
         OepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453077; x=1796057877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vPQa4vtqRqby5WDNW845XbNQIUuJKanxgqfCE4nY6Wg=;
        b=vOhD3udL7lLpnrNi3s8JZTnqHjFGGt4QT3v4TI75PC5UqV/Snf3M4aLdsdYz3Fw9eb
         0ztbI+vxu/S7+IafJ8l/RIuyJ7tIvddgUCoGpjYIozxd8taXclICtO/K931NYqkbJoj/
         5ejFkuOlk93hg1KL2TAlTpVRjDRonWRiD0AAdJ1+qFFMFssXti1OCFYcr6pVh7YV+piG
         s/8CZ1CxBwN1ecQPeO9m3MSZmosTCHgJnuy6ohmD2+x0f19uvlYZUfH6l5SWZKGyoifc
         CGWwfjojBTgzhReSppdQGZLQ9mWaYutWWtgnx565rajy6kc8F93RUmazHGmPQh3L/cgS
         QlZg==
X-Forwarded-Encrypted: i=1; AL+hErGfq5+id3J4vEpEG/yaX4eJYCbb+BJddyzGKmNuUioLEfQltQjiBfAKrc/lkf3Pb6Ao6Mp6CzAJGvUsQTi2TdUA@lists.infradead.org
X-Gm-Message-State: APuU4Z+BZy2uXsn7Vhb7gb3tR8i/M7W/rLnQjpPE/2uJ5y2VG/qBmBQQ
	SP1Ww/pWg6OKGhxFH2q0MaqiPmf3Xlwxv0v2wOGMPfL0rv4i7J3ktGbm
X-Gm-Gg: AZFdTZfnUZAv9XgKTPs1zASKWZzF1TRR1765Q3OMhHGEf2hBxi9gTzKGSqtb9OGjRee
	W7N0W63G70q7mx2POHOlVcWs0QAwnEVkmDqFItGhznZjsEBUFu6S/HrhRXhhdX/Juc3uVaI0fMZ
	1c27xUZNfRCIDo/GwsDj3RI08GxTkl9E3GpduiTbQI3lZrApZamlHQL68XsnRNtFU38Bj2vAmcP
	wW7QRDk4RhI/o7XWI9fXW/j2HK9YoLWMvPV91iOOI8Fqmjur/JzOwuMlpvoO5EzihrqqEDn7ykO
	X3qNQ5Cn2/G4Ouc6YTK+808HAhv4J5fdLimvJASf4xPoPB76T0tECFJvQRbv9kATO+cZii8AFmz
	evYiTslMGoIdUlpEJhkhYCq6Tw0GFSH01LEqmZehiHj+y+ShaWYmuV9qEZQ5Ca2LNTTg/MeH9qZ
	+5fpIA+kh2Cilajz5tMjfHJ/gUevusTBDQa+idU8ebn7sE5Cg6jUdmRcIgL0O1G8u9Pfm/PBoSl
	tNiNdqLtdp5uxuIx592WYYLTRY6BClwCTtvVyBUg17vw16j+Qrvl10VEZcy2dmHJiBkKNdhVts1
	0jmDaM5uRsvVgaEV2AR++IzomVUfntY0LMmrqONdgqKeLiHQetqC2/mtYcQ=
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr13616256eec.6.1795453076526;
        Mon, 23 Nov 2026 08:57:56 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:56 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 1/3] arm64: dts: rockchip: rk3568: add XPCS node
Date: Tue, 24 Nov 2026 00:57:01 +0800
Message-ID: <20261123165703.667564-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123165703.667564-1-coiaprant@gmail.com>
References: <20261123165703.667564-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085757_250977_437C9067 
X-CRM114-Status: GOOD (  10.41  )
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

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides the
Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII interfaces
via its four MII ports. Add the XPCS device node to the SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and requires
the CSR clock (PCLK_XPCS) for register access and the EEE clock
(CLK_XPCS_EEE) for Energy Efficient Ethernet operation. The PD_PIPE
power domain must be enabled before any register access.

The XPCS node is disabled by default and must be enabled at the board
level when 1000BASE-X, SGMII, or QSGMII is in use.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
through the phys property. The SoC dtsi intentionally omits this
property, as the SerDes connection is a board-level design choice and
different boards route XPCS to different Combo PHY instances. Although
dtbs_check only validates required properties for enabled nodes, boards
that enable XPCS must provide the corresponding phys reference.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 2f42bf26fd9b..c8f846e5ad9b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,15 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3


