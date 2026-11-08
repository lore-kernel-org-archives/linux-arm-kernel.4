Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716AA606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UxcrX+o2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ka2RJu3a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m/q7Am6D0wIn2Fgr9L3+qxJVWKoo2liSucz2FimhZjw=; b=UxcrX+o2exfKmmJpZrlNJA++Eu
	1XkeVG7QUTnmPJQCl1ygPJKyR8chk2yZiquraJ4yMuhLB7AKhM15MN0ywk+8NzECEIibUX+M6kcfP
	1zia/r8iO/eADq9TknZcj4lXcCX4YJIYrYMLX8iHkCIgoZa4W4a0MD+fZlltixkm9cipwGdKD51Ts
	f+h+jqGwDCZTkofY9mv41KqYjqCr2auD3ZzW1VX3pQGBPvIsK8Fjy96Ct8MF0JKGX4LoDPM+SPWkc
	3bFpdICWYWmrOqgmD373heHB3DlSVMXFqd1UdoWsZ7HTqOov4OIrwpRazy1hPBFci+QS3bZX/3Yug
	14AoFgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPqn8-0000000FXoH-0PuZ;
	Sun, 08 Nov 2026 00:29:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPqn6-0000000FXo5-2CL7;
	Sun, 08 Nov 2026 00:29:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6751860D57;
	Sun,  8 Nov 2026 00:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD63E1F0089F;
	Sun,  8 Nov 2026 00:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794097786;
	bh=m/q7Am6D0wIn2Fgr9L3+qxJVWKoo2liSucz2FimhZjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ka2RJu3agEgLzYDFBBm5fkd6IBPdTv2jnKlGseVM3JbLRXZC23mWUbrrLY+LB9lZ2
	 hBo6vFFZfT205VG19kFXihinVH9T3vxwZqufUJ98zGe8Y1Bb9LCGbymXStjE6pq7Ne
	 jDCGhlxn19gM3ldE9tPzrovVLeQZ5BSrb8f2fTL45dqKyb/4MsX0H19fPMLmlUWKUy
	 fdu8ULFdfpDM2ND87xRJavB/yoO/UqUSSqnIEX3l84RmUr8AN2HNy9CvMrhHFSS6tc
	 fgIMel9Ef5YWeWKwq1aqhGNgWvkJLj/bXmIgAqtYj8bWNP50Z75vfa3qlgXaZufXoU
	 o2VEIvkPg+bHw==
Date: Sat, 7 Nov 2026 18:29:41 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: anand.tiwari@oss.qualcomm.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Shashank Maurya <shashank.maurya@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Message-ID: <au_BvH0rEKpgTpc3@zenbook>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
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

On Mon, Nov 02, 2026 at 01:01:30PM +0530, anand.tiwari@oss.qualcomm.com wrote:
> Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
> The DSI0 interface from SoC card is routed to either the 22-pin DSI
> connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
> connector, through a MUX which can be selected by a hardware DIP
> switch. There are multiple daughter cards designed that can be
> connected to this B2B connector.
> 
> The below B2B display interfaces are enabled by default in base DTB:
>   - DSI-to-HDMI using the LT9611UXD daughter card
> 
> Below overlay DTs are added for additional display configurations:
>   - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
>     daughter card
>   - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
>     panel with touch via the 22-pin DSI connector for Lyra
>   - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
>     with touch via the 22-pin DSI connector for Lyra
>   - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
>     Lyra with LVDS daughter card
> 
> These overlays are applied on top of the corresponding base board
> DTBs.
> Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/
> 
> Dependencies:
> https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com

This was rejected 3 weeks ago, so sending this series wasted both your
and my time.

Regards,
Bjorn

> https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
> https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
> 
> DT bindings:
> https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---
> Changes in v3:
> - Added GP CLK Frequency Dependencies
> - Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
> to ascending GPIO number.
> - Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com
> 
> Changes in v2:
> - Fold in the hdmi_connector port remote-endpoint indentation fix.
> - Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
>   patch; the dt-bindings dependency is now declared as a series
>   prerequisite (see base-commit/prerequisite info below).
> - Drop default-on from the DLC0697 backlight node.
> - Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
>   panel overlay to fix a dtbs_check "too short" binding failure.
> - Reword the PWM_CLK defconfig commit message to name Qualcomm as
>   the SoC vendor.
> - Remove a stray blank line and non-ASCII characters from the AUO
>   LVDS panel overlay.
> - Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Abel Vesa <abelvesa@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> ---
> Anand Tiwari (2):
>       arm64: defconfig: Enable PWM_CLK for backlight PWM support
>       arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay
> 
> Mohit Dsor (1):
>       arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support
> 
> Shashank Maurya (3):
>       arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
>       arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
>       arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
>  .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
>  .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
>  .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
>  .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  7 files changed, 493 insertions(+)
> ---
> base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
> change-id: 20261019-lyra-display-upstream-post-24656268a902
> prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
> prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
> prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
> prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
> prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
> prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
> prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
> prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
> prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061
> 
> Best regards,
> --  
> Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> 

