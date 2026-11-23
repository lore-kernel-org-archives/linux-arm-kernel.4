Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E55606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1VVtFON1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnrJCbJT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MCL/17WsccgKeSGSYDbOou+8EFE+Z2qWaxPQZDEGVhw=; b=1VVtFON13N5EcGPqt7QMZF3xay
	AtEBgSczmidt8DDFv5k0jz4Ns1GzwvvRoOfUh+xabOnhXBROVl1mfhlzJiOeQIvHChjFakDc0v9lq
	YmWm8REBp3ZnALh1zPpO8K7tWPbgFold51l8b54R1t10f/AL40OU1RNKez92xtOCfirNuoEzfqlLM
	sgip6ai2pCTEaoyxMeKfy+eYMPA4RayEaDvbADu3HyTY8wzwe4XeQuPA/umkdDa5msL+gDXP80IOi
	i7wAsMPRiislXBfI2fmcGkcXQrh/1Db/QFXthhuPxV28HyF3W8NXExkEZuIpNPiaO0MDIylCb6Z32
	OByN4Ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZs4-00000004gib-3Bas;
	Mon, 23 Nov 2026 19:38:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZri-00000004gUk-0NYW;
	Mon, 23 Nov 2026 19:38:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D704C623BC;
	Mon, 23 Nov 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795462692;
	b=IA7oqavKK1LzlgTqDLpJcusFNP1nr5dqaDT53bbg3NAfQKSuVf+H2al0reTmKwlbtmRS
	 4unwEQbK+SRNqef+7Itrw4pRbDyLTkUukL/3HOPhT6QkimJhfunvkBocD8yYGT67pUc4X
	 cOCt0+ZR9iZvFYHxmTguH8fMDWBg9byXpWu75beCAjvelGEv9+DISLOo3YRsALEuO1scu
	 EolKOHOJPX5eyECU5HaW+bLFO2c5TievEcAIVNPuFQLNcFD53QMFL2zb8LibYOpRKGUYv
	 p0kyqutBX6l1AOoJs57q93lYdb7AnyDjVu2m8wvYT+x37U18ijCBTY8qAVoqhJvCW3Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795462692;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MCL/17WsccgKeSGSYDbOou+8EFE+Z2qWaxPQZDEGVhw=;
	b=CfCIB3zM114vmXCNVSdN2Tb7/Gv68b4wn3+SOUHGXOS+5ljV0yDjD65nXWKHSil2rSKg
	 ECUZgtKlbc/fXXGTPVedTQb2vrN/EvvIOS4AhELO63QwzHvvfBmc7q/UeUWf2aXyIfVLv
	 FTuIM/O3DNzKz7kDt9ngRKKtwRM1O+cDM/8ck4X5UlJzaVjhMPJ5VfS9PIpIsuCoL+Uv8
	 ZHHdjoS4SMocyckqvNIgVI529nc2hZyuLND/1zCvoQUs4R4g8cEP0AtRAF7IutI0W5qRx
	 6iscs+l8ktMXp8B1bTZXNrlTxaZix0IgbGgtmiC8Kq1mntsEzD5gVt9kDg8QluEhnqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F37A1F000F4;
	Mon, 23 Nov 2026 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462692;
	bh=MCL/17WsccgKeSGSYDbOou+8EFE+Z2qWaxPQZDEGVhw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=EnrJCbJTUblVRM5BSZUHKTCXi5tqXFq491hwbzy+0c3GhvhnGrbt+2GSCwrmBfOEe
	 5+c/SGzbe3h+mzWsPKlvtCnCeq6rc+kToAHLGzf9nd7tZKkzKWRBdLh+scwbahTSPR
	 wDOph43ck6kIjG0zMiHfH+ycjulO8jOk5IR7ddj+pFpOoA6Pq/5AnsCbVkKa5slNG8
	 UMbmk7YreLq3cWvEyWFKo7GiQJxvlAG81w8nZIxt1fO9LDc/MoQ+WAaOlop+ih+/2J
	 FFMXOO/47IuheY+0EhCHcaDQaenKLpKNG3TsMfYR1biqcJEUlLD6Q8RuhUql8mpd/Q
	 i3UqSR17U+H+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 976514C68D;
	Mon, 23 Nov 2026 19:38:00 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
Date: Mon, 23 Nov 2026 20:37:32 +0100
Message-Id: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPyVBGsC/33NSwrCMBSF4a1Ixl7JTWLTOnIf4iBNbm3EPkhqU
 aR7t1GE4qDDA4fvf7FIwVNkh82LBRp99F07D7XdMFub9kLg3byZ4CJDxD00FLsWXGjABjIDQe0
 aPzygr5+gjFXcZHvleMFmoQ9U+cdHP52/O97LK9khkelR+zh04fnJj5h+v5JeLY0IHArixhYSZ
 Y72aG6ebrsqsBQaxYISfJ0SiZIuE8IVZcn1HyWXFK5TcqaqvFIadZ5znS2oaZreWKqccW0BAAA
 =
X-Change-ID: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6495;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=8BBL7D6KEkOqqUCYRvfX3FXKVr3yWufhCAQshS4EaPc=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzbLNKZfXt3L3mZlbaw9uXdn/qqlp0xXdqvntzHP0hJLW
 vGztsO3o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZjIxGJGhts1H0u2Jhi+rU+Q
 8tus8fBJqel6v6Oam5qS98inKhV+/8vwP9d7e85/VabS7c3rPz7Icl92l8Hw3vNKRiUxKbHJE6w
 cGAA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
dedicated generic PHY driver.

Until now, meson_dw_hdmi directly manipulated the HHI system controller
registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
resets, and manage power states, as well as manually ungating HDMI
clocks and power domains already described in the DT.

By extracting this logic into a standalone PHY driver under
drivers/phy/amlogic/:
- Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
  as a child node of the HHI syscon referenced via standard "phys"
  properties.
- The DRM bridge driver relies on the standard generic PHY API
  (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
  touching syscon registers directly.
- Legacy DTs lacking the "phys" property remain supported via a
  temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
  backward compatibility to be removed on next phase of component
  removal.

Overview of the series:
- Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
  add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
  "hdmi-phy" child node under the HHI syscon.
- Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
  PHY configuration ops, along with the temporary legacy creation
  helper.
- Patch 5: Document the optional "phys" and properties in the
  amlogic,meson-dw-hdmi binding.
- Patch 6: Make meson-ee-pwrc power up the domain memories when the
  domain is already on at probe time, as this is a prerequisite for
  dropping the explicit write from meson_dw_hdmi
- Patches 7-8: Clean up manual HHI clock/power-domain writes in
  meson_dw_hdmi (relying on runtime PM instead) and convert the driver
  to use the generic PHY framework.
- Patches 9-11: Add the "hdmi-phy" child node and wire up the "phys"
  phandle for G12, GXBB, and GXL Device Trees.

Tested on:
- Khadas VIM1 (GXL)
- dtbs_check and dt_binding_check run cleanly with no new warnings.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v4:
- Patch 2: Change commit title. Sashiko and Neil review.
- Patch 4: Change the phy min_rate to 15.9 MHz mathematical limit.
           Thanks to Sashiko's review.
- Patch 8: Drop introduced double free with phy_destroy.
           Add missing device_link_remove()
           Change the device_link order and use prepare/complete in the
           VPU drv for drm_mode_config_helper. Sashiko's review.
- Link to v3: https://patch.msgid.link/20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr

Changes in v3:
- Patch 6: reuse meson_ee_pwrc_mem_power_up() in meson_ee_pwrc_on()
  function.
- Patch 8: revert the code to v1 and add a device link to solve
  suspend/resume order in dpm_list.
- Link to v2: https://patch.msgid.link/20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr

Changes in v2:
- Patches 5,9-11: Remove unecessary "phy-names" for uniq phy.
                  Thanks to Neil's feedback.
- Add Patch 6: Power up the memories when the domain is already on.
               From Sashiko's feedback.
- Patch 4: Add a 600MHz max_rate and a 25Mhz min_rate check and
           exclude PHY_HDMI_MODE_FRL for phy_validate. Thx Sashiko.
- Patch 8: Move phy_init in dw_hdmi_phy_init and phy_exit
           in dw_hdmi_phy_disable. From Sashiko review.
- Link to v1: https://patch.msgid.link/20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-pm@vger.kernel.org

---
Ronald Claveau (11):
      dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
      dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY
      dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy child node
      phy: amlogic: Add Meson HDMI TX PHY driver
      dt-bindings: display: amlogic,meson-dw-hdmi: Add phys
      pmdomain: amlogic: meson-ee-pwrc: power up memories for boot-enabled domains
      drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
      drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
      arm64: dts: amlogic: Add HDMI TX PHY node for G12
      arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
      arm64: dts: amlogic: Add HDMI TX PHY node for GXL

 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   4 +
 .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   6 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   6 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 drivers/gpu/drm/meson/Kconfig                      |   2 +
 drivers/gpu/drm/meson/meson_drv.c                  |  16 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              | 223 +++++++-------
 drivers/phy/amlogic/Kconfig                        |  11 +
 drivers/phy/amlogic/Makefile                       |   1 +
 drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 319 +++++++++++++++++++++
 drivers/pmdomain/amlogic/meson-ee-pwrc.c           |  19 +-
 include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
 14 files changed, 561 insertions(+), 147 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09

Best regards,
--  
Ronald Claveau <linux-kernel-dev@aliel.fr>



