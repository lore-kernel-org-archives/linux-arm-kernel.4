Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LToE+cSd;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=pnTV3rUk;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=v0PQFITT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y6MFsJR848hDKlT6yRNlCrkbOqj8NXxBK6s5bzRs5EU=; b=LToE+cSdMWRbSvwHvZewlaK9pG
	MwqYat2qiUfchXCer7T4dGGPnsYOZPuGQKZY+TNoPBrg8lvO6NXBVx3BHd4SRqnsUXXJu+cFdGfna
	M5jQ6Bra0gmNVX1SO+jNHbCAaJwzRM24B9y0IR60XUsTkF+dZmWWrDOen75A9GAMsX7ovH5uZspsU
	053R1jJaPr7hKaWG1opKoOA7nj14vrkGsMsCKHuRmV743893oFisBYgzHgaADCXbPFj+OLXLE+f3L
	qglf2fEieOmVjSlR8pohFJJcz9JtoOpzWTV2iy/wMOouP7/iMPUjBFegk/8ws/huoBKWA5lUXEp7C
	Lxezq/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUf8X-0000000GpPr-3GSS;
	Sat, 21 Nov 2026 07:03:49 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUf8V-0000000GpPP-1Ytt;
	Sat, 21 Nov 2026 07:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795244618; bh=y6MFsJR848hDKlT6yRNlCrk
	bOqj8NXxBK6s5bzRs5EU=; b=pnTV3rUky1wTpx7WZl/YdMR/M9lCMFiOZ1JXVu2GEdzJqQ+GQs
	MFuWzUlwHY1xog183PNaIuxuVXhKbqEugix63YBSDrh/IE+RTsdE76re58MgHAFTPRS1aal7XNl
	FJX7OH7gGRnwIeZPfbSTaYHwjn7DdqTTh5TzVUBd15vg8IwW8BSHz3b1sZFMxoHZpQ3hW8vhfiT
	PZXLSCcZixJmKOkAFM6vpxq0WqwZv43A1H4XpCZ8Qsr1N6FZIeUpHf63C/gRB5prpjdyK4Eo6XM
	o8LxpP5JI1slqpkKZhZHTOtPvOku+UXOKSXUmliH3bJYzMWD1B5DSkUSzilRKMB57xw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795244618; bh=y6MFsJR848hDKlT6yRNlCrk
	bOqj8NXxBK6s5bzRs5EU=; b=v0PQFITToLHHenvvFwALitpgYoImLm6IpD98o83/7wgK8LsRRe
	gZP2fuTLDVtkUumxuFWEx0FYm5HoBrdJobCQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 21 Nov 2026 14:03:33 +0700
Subject: [PATCH] arm64: dts: rockchip: Add CD GPIO to Orange Pi 5/5B/5Pro
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-orange-pi-5-sdcard-v1-1-e431e7c46ba0@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g2YKa1tr1JcjJmo6UIlURHEu
 3dql9+D9+/gYioOr2IHk1VdxyGDLgVwH4dOUFM2hDLciQLhaOc6Kd7QE0dL+Hxw08YrU5AK8nE
 yaXU7o+/6b1+aj/D8K8FxfAHz5uU4dgAAAA==
X-Change-ID: 20261121-orange-pi-5-sdcard-98cbfa3c12e7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795244616; l=1254;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=GlkIkeKkP/1h8FvPs1WjPhMAPwcbwH1PJfQKecMiU5U=;
 b=Xy+Q6JAk0IabwF5I0M+Duxwok/VQCgn1KhBMgtBPMB5h0vWgSrT8MnrcUhEpn7HctJ6Pc5nNm
 IXhKmWfrXX1AMdPUPHjCOpITe/4/eS9xttfK0TZL/SVsWo1ZPal9ScH
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_230347_602922_B8955900 
X-CRM114-Status: UNSURE (   7.73  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CD GPIO is currently not defined in Orange Pi 5, this breaks
SD card hotplugging.

The SDMMC_DET_L pin is connected to GPIO0_A4 on both OPi 5[0],
OPi 5B[1] and OPi 5 Pro[2].

[0]: https://drive.google.com/file/d/1Wsp-Q7IyG0Ky_W-z1n5oXcFG4oqIbtOb/view?usp=sharing
[1]: https://drive.google.com/file/d/19iPdpAXhA1vFkVOgG5Sz7L6cV8BB6004/view?usp=sharing
[2]: https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/view?usp=sharing

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 2db6ee95e504..8fbb0ba19b74 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -282,6 +282,7 @@ &sdhci {
 &sdmmc {
 	bus-width = <4>;
 	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	max-frequency = <150000000>;
 	no-mmc;

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261121-orange-pi-5-sdcard-98cbfa3c12e7

Best regards,
--  
Dang Huynh <dang.huynh@mainlining.org>

