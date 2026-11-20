Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C985606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNoSrXjw;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=3Iy8yYkJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K6vwty36fbvOEYt/rnRieouyTlj21/gT8dvewmNyeDo=; b=lNoSrXjwjOX0Q7
	iPrYGsLthLu3i1nZWLuQipaygYKjxycQ3nuGzxIU20BmxddvDs7AaBvMew4mZaJKrLQN6V36JrBYB
	6nHdReQJsvbwL/1P1+l3ayJ5PCbW/C3z9eMKUwrvA18E4XsYuWZNdmj/CDcwqC1+nj5rsw23Jqyv7
	2S8AHtMm4OUJAU4xghHfiv8AYmqvYQk2CUmd/GjI0/Ccx+b+txSVbxWMjZ/0xAB6pRq3ceroSC+p2
	pf64dJ5L8SNSpezYT829qCnd1ffIF64Ecw7h+ygb3/EIQVTgqQlxHfhzJCbJ6bSKPbZ/MwkREPoyK
	CItso/fYA71LOIAspv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMB2-0000000Eepn-1tlL;
	Fri, 20 Nov 2026 10:49:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAJ-0000000EeRz-03OJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:48:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b467581b98so6944095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171701; x=1795776501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6vwty36fbvOEYt/rnRieouyTlj21/gT8dvewmNyeDo=;
        b=3Iy8yYkJMnyn42Vcp4AYDyYV9zvOwTIbuzK15w0Y2RflDO0dwmcTUId+ZMRsQGVUOj
         +IH/x2BX1Sf+FWex9gM4AgDU0knfhnF5O6TGdoPd/F4o+EfBy4+L8EsYHLNo6ssHRC8T
         z8+KE0xP1rUlKirQh+rmNjsMZPwGp4tLDgxgFXlM/a3dT0i9hSVhrhp/8fmUP4fXWu2p
         RCNWJrv9TZH12KPfIRwx8YfqZHLG7x1HkLTdstra3ecaRlpChBAUm40umRRxABVlY0pj
         2qMQzOjUyBfneqlQi1fZ5sVB+FW7xmtwthOYBTHOV/8/T8nHoLUshhjfuRxCG21IB4ix
         u0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171701; x=1795776501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6vwty36fbvOEYt/rnRieouyTlj21/gT8dvewmNyeDo=;
        b=ua5x7emiH4S4CXE3/qFa49jjEQYNZQKQtnumCIl+RYcLq24CreN4fxGpfQnADTbFBw
         jFos7Q0fKcMccdZajUpUTukq6dt+W4z4TLxabY7GMQi+od9bxCJffFhpmraQjzhlbBko
         YtEXxyoRmIk9PQX8g/uOJnKrXGkX/Swlwur4sLjhDwjaXtJXdJTKfznXXWYBvAMjxILD
         L2TYolX1sL3arftsAKwQtwWifebyHfSwPxLSp8yXxIXwPA9CBu0hwVREPLvpKq3ZcGy1
         GXVyBGWi1+qAGZShrwudYsQF/XkWkF2vDwIw71qt1P1Q24fo9cMLQOoTqyOCdjlUm7LS
         GbcQ==
X-Forwarded-Encrypted: i=1; AL+hErFKZoGf/fKOIERl2I115NdP6EUSXeX0NR4pY8/vfMIyLKj/oSqaDUSubEnFB6Wg0O3zY654iYLJspbxekHw1rsa@lists.infradead.org
X-Gm-Message-State: APuU4Z/XPBDcwZkxmZXN4YEUJJ6zvLNBqZFDSqURqEs8BiiBbgMjNmMA
	BlcvaavFOIXNYckSiL7mJAgHnJykiRXAvgXXo53KhYCO5ycFxTC5j7aN7nDLU77fIv4=
X-Gm-Gg: AYBFou1eexpL3DaFwR2b8odrkISn3f+i47+LlbDFiNGxj+pAoQZJRqsrkXs+2GzD3TP
	C3VgV+ujdrBNS4CyzTjvV5wSRGeU/4kJH0NshqqzHKcRrsnZrs5koR05NvUHxBJDT/ESe0XgzZN
	yjDayWMtKqtTB5RLNPNS5GPPo2/GkZzuUZRQrRn+wa2UP5O+qJqHqZqxUSfmpMN4siMhJIH110V
	q7T1p93XYh1TJ0/2H6qc2e8qvZtg2iQzhLxFN73+teg/abAG2QLG3+N9hkPSYs13eKwGqjIoSN3
	N3F40+1R8Fir7BfyBBdRJW2uWRXAeOJHJUUnW4OP6cqutVmt1nOnbGqR/eRg5pyJmTFm10c7tOl
	/pJH23fm6bqF/BV1duLZ1ADmdyyTgdki/M1xsRTIMZMiKzJ0ili1aMrY7AvPVm0dVUPpO2TVENv
	aKVMtHBhbeB/kld8gM7ENjr2+leEYSv05DMGHbwGzpCseJ+Ohuqtob/xcjFDZmbmcExsA1NoxK3
	jt/z1Z/TzVlX+sxr1xcK1ew5HI8FIDDseqBpeKdkQfvuCBSytChEeVX2WlDcGK1rQKPrDpr11/e
	FRcps8ublA47+wQ1prha6dkSPdSeL2SJ/COZhuwCFx7o/HwqhXFYnQfL6h5nUkQyEXrNdVQcXtP
	1Tsxr0iIx
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr52978715e9.9.1795171701461;
        Fri, 20 Nov 2026 02:48:21 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:21 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:10 +0400
Subject: [PATCH 2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by
 their ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3576-phys-v1-2-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=alchark@flipper.net;
 h=from:subject:message-id; bh=aEOUC6ekrPOrGiTuRYNi1p8Y9du8BazFw7AJD/RWz+U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqObG6x98WmKwc/vhWVP3Jn/R9C/Odpb4pp/5Md1ta
 v4F65vnOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqaREM/8OWT/j+ZRmPzg7xvSc+/c8/2fkg1lin78yXtcElTnc0toQyMuy6FtA
 3pfr/wXWCjHNufhHL/Bw697/nvmCNznSRuKRaZU4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024823_547586_457570ED 
X-CRM114-Status: GOOD (  12.35  )
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

Both Sige5 GMACs connect to an RTL8211F PHY (ID 0x001cc916) with its
reset line in the PHY node. With only the generic C22 compatible, an OS
has to read the PHY ID registers before it can bind a driver, and only
that driver releases the reset line. Unless an earlier boot stage has
already released it, the PHY stays in reset, never answers on MDIO, and
neither Ethernet port comes up. Booting straight from U-Boot SPL in
Falcon mode hits exactly that.

Name the PHY by its ID, so it binds without the ID read and comes out of
reset as it does. Name the node ethernet-phy@1 as well, as the Realtek
PHY binding the ID compatible selects requires.

Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index c5b2f22402f5..b8547395c608 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -775,8 +775,8 @@ es8388: audio-codec@10 {
 };
 
 &mdio0 {
-	rgmii_phy0: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac0_rst>;
@@ -787,8 +787,8 @@ rgmii_phy0: phy@1 {
 };
 
 &mdio1 {
-	rgmii_phy1: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_rst>;

-- 
2.56.0


