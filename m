Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEF606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H4ARgS7P;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZKNDEIyF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oiYEUoevGz6B9k90gxoZ1hb0nRNZKhcTPfPp4iW8drY=; b=H4ARgS7PgQ1az48HP+SLoD882U
	mdHeOate8olPLrQ/rjCcliuLijUxu2h0AKUZB/5YzVEYSJ1xSGZwSLNIbpoRBNbYEeHUanfOfXU/Y
	XkI5LJiYxjlw7h47a5sapa2kcFkfngFe/7IUV+BrX1BE8Vt2tIjg6whWZg4/sksoZsUA2DtkUcNVO
	yosRReIs34Sj2RULbRkmCk7XkGHpL0ZszveycFfZ5wjkv3YBaX4KaIIqM71fRcZ6d7PSI2Zc/GfM5
	U2US8h9VE/Zmrfvg/k850Y6VMahCuAuyhI3L4u18hJAN+BwH7DmDBAnrY92NGV20ZZOZ6ekDun57n
	wejZLoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9D9-0000000FbMr-29RL;
	Sat, 14 Nov 2026 08:34:11 +0000
Received: from mail-m1056.netease.com ([154.81.10.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9Cv-0000000FbC3-2mBq;
	Sat, 14 Nov 2026 08:33:59 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54aa8867e;
	Sat, 14 Nov 2026 16:33:45 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 0/4] Add eDP support for RK3568
Date: Sat, 14 Nov 2026 16:33:35 +0800
Message-Id: <20261114083339.600986-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d930ee5103a8kunmf52e980410224b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQxkeVkpMTktOTx8YS04YTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZKNDEIyFwrTvda+a/dvN3MOLDUUpNdafjehWACrhn+URRjLHh75AxazHiEalmTfkxl1+C1GJGU5frloJ8GmhskEQ8wlp41otoFFpnpC1ETXgSgvH28Uz9hOgJrst5SgsC0p5HZkqIF9ZfrJf/0gxCvdBFciYoSPvlEYlhfubsEY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=oiYEUoevGz6B9k90gxoZ1hb0nRNZKhcTPfPp4iW8drY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_003357_960589_3342AEB7 
X-CRM114-Status: GOOD (  14.90  )
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

Picked from:
https://lore.kernel.org/all/20261030064905.2248999-1-damon.ding@rock-chips.com/

The 'rockchip,rk3568-edp' display binding, the RK3568 support for the
Analogix DP bridge driver and the RK3568 support for the Rockchip
Analogix DP driver have been applied to the drm-misc-next tree.

PATCH 1 is to document the RK3568 eDP Transmitter PHY with Naneng IP
        block, along with the eDP PHY GRF syscon node it resides in.
PATCH 2 is to add the driver for the Rockchip eDP Transmitter PHY with
        Naneng IP block.
PATCH 3 is to add the eDP controller and eDP PHY nodes for the RK3568
        SoCs.
PATCH 4 is to add a MAINTAINERS entry for the Rockchip eDP Transmitter
        PHY driver.

Tested on RK3568 EVB1 board with LG eDP panel LP079QX1-SP0V.

&edp {
  avdd-0v9-supply = <&vdda0v9_image>;
  avdd-1v8-supply = <&vcca1v8_image>;
  force-hpd;
  status = "okay";

  aux-bus {
    panel {
      compatible = "edp-panel";
      backlight = <&backlight>;
      power-supply = <&vcc3v3_lcd0_n>;
      no-hpd;

      port {
        panel_in_edp: endpoint {
          remote-endpoint = <&edp_out_panel>;
        };
      };
    };
  };
};

&edp_in {
  edp_in_vp0: endpoint {
    remote-endpoint = <&vp0_out_edp>;
  };
};

&edp_out {
  edp_out_panel: endpoint {
    remote-endpoint = <&panel_in_edp>;
  };
};

&edp_phy {
  status = "okay";
};

&vp0 {
  vp0_out_edp: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
    reg = <ROCKCHIP_VOP2_EP_EDP0>;
    remote-endpoint = <&edp_in_vp0>;
  };
};

Damon Ding (4):
  dt-bindings: phy: Add rockchip,rk3568-edp-phy
  phy: rockchip: Add support for Naneng eDP phy
  arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes
  MAINTAINERS: Add entry for Rockchip eDP phy

 .../bindings/phy/rockchip,rk3568-edp-phy.yaml |  46 ++
 .../rockchip/rockchip,rk3568-edp-phy-grf.yaml |  80 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  45 ++
 drivers/phy/rockchip/Kconfig                  |  11 +
 drivers/phy/rockchip/Makefile                 |   1 +
 .../phy/rockchip/phy-rockchip-naneng-edp.c    | 471 ++++++++++++++++++
 7 files changed, 663 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-naneng-edp.c

---

Changes in v2:
- Apply the lane-dependent TX configurations in set_lanes() instead of
  set_rate(), and store the lane count for set_voltages(), since the
  Analogix DP core issues separate phy_configure() calls and the lane
  count is only valid in the set_lanes/set_voltages calls. (Sashiko)
- Initialize val to zero in rockchip_edp_phy_enabled() to avoid using
  an uninitialized variable when regmap_read() fails. (Sashiko)
- Fail the probe when the chip data requires GRF configurations while
  the "rockchip,grf" property is missing. (Sashiko)
- Rebase onto latest drm-misc-next tree.

Changes in v3:
- Restore the PHY related changes which were missing in v2 for
  unexpected reasons.

Changes in v4:
- Restrict the avdd-0v9 and avdd-1v8 supplies to the RK3568 compatible
  in the Rockchip Analogix DP binding.
- Add the reg entry for the PHY node and the ranges/#address-cells/
  #size-cells for the parent syscon node in the Rockchip GRF schema.
- Map the PHY registers from its own reg property instead of accessing
  them through the parent syscon regmap.
- Model the PHY node with a reg property under the parent syscon in the
  DT.

Changes in v5:
- Move the APB clock (PCLK_EDPPHY_GRF) from the parent syscon node to
  the PHY node and enable it in the driver. (Sashiko)
- Split the "rockchip,rk3568-edp-phy-grf" syscon node to its own
  binding schema, instead of extending the shared Rockchip GRF schema.
- Validate the voltages against the effective lane count, to also
  cover combined set_lanes + set_voltages requests. (Sashiko)
- Select REGMAP_MMIO.
- Drop the example from the PHY binding schema, as complete MFD
  examples belong in the GRF binding schema.
- Rename the reference clock to "ref".

Changes in v6:
- Add a MAINTAINERS entry for the Rockchip eDP phy driver.

-- 
2.34.1

