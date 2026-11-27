Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A6F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x/c+LSK0;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=RN6aIDdV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SPY0tuFdVHQ7dfLz2WNvVjcy7URWN4vydjod081DBsQ=; b=x/c+LSK02E4HOX
	StcmHI6CIX+rMaf79d4F+U/aeBg6/5JocCimoaBCgI9mZIlcbWZR9cwHaRhNYdkDFCuosdttE5bgX
	js80UQAQGAxisGj5xZrztQOXJn3NjFUPVj1XfbPSx/Xw7swPrGZSKFoO4ZYwu+dXuV7NhpER462HJ
	EiCC8ql0h8xW21vn6i+lis8tjZHwiBvVSjxDA9Ui0pq/GIfk112EoGX9nOyE38sZ/ZKXjDmb21Iwk
	pgJbrXVSaHXqGkUnkBfSL2A6jFB9SvtvDKUp6yqWDWFsd/Sj/O34EnE5HqjoYU9c2fgtyWjXU/VxO
	dB5AwKQ78wwZ2H7c9BGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyHU-0000000Gvc0-3Icm;
	Fri, 27 Nov 2026 15:54:36 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyHL-0000000GvTx-2gQt;
	Fri, 27 Nov 2026 15:54:30 +0000
Message-ID: <0b4f724f-eabd-4c31-ad1a-25ab5ad886ab@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795794861;
	bh=eq4MYrvq/ToRLquDKmYljBez1teYhq+T2UM45Ird1cI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=RN6aIDdVUfsldjem/lBvO/YuGuppMEFMxBRI0FeZ8SbYPX/pTt73fyqnMcZJArL2g
	 KQslF9ndJoXso9eghBaP9QV8QPyC8gzkjBdyHlgchm2pvZQ0F2Pi+cRZ88Wi8gZYCt
	 rPdTTfHc+EI81PeJZorcfeYoPofseHnJ7uv0A2rI=
Date: Fri, 27 Nov 2026 16:53:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v5 00/12] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
 <446fa440-1537-4b30-8429-4d72bb70029d@linaro.org>
Content-Language: en-US
In-Reply-To: <446fa440-1537-4b30-8429-4d72bb70029d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_075428_290484_67B5E2BE 
X-CRM114-Status: GOOD (  22.57  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/27/26 16:35, Neil Armstrong wrote:
> On 11/27/26 16:27, Ronald Claveau via B4 Relay wrote:
>> This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
>> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
>> dedicated generic PHY driver.
>>
>> Until now, meson_dw_hdmi directly manipulated the HHI system controller
>> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
>> resets, and manage power states, as well as manually ungating HDMI
>> clocks and power domains already described in the DT.
>>
>> By extracting this logic into a standalone PHY driver under
>> drivers/phy/amlogic/:
>> - Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
>>    as a child node of the HHI syscon referenced via standard "phys"
>>    properties.
>> - The DRM bridge driver relies on the standard generic PHY API
>>    (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>>    touching syscon registers directly.
>> - Legacy DTs lacking the "phys" property remain supported via a
>>    temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
>>    backward compatibility to be removed on next phase of component
>>    removal.
>>
>> Overview of the series:
>> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>>    add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>>    "hdmi-phy" child node under the HHI syscon.
>> - Patch 4: Rename the Meson8 HDMI TX PHY driver to be more SoC generic.
>> - Patch 5: Add GXBB, GXL, GXM and G12A SoCs to the Meson HDMI TX PHY
>>    driver, implementing the HDMI PHY configuration ops, along with the
>>    temporary legacy creation helper.
>> - Patch 6: Document the optional "phys" and properties in the
>>    amlogic,meson-dw-hdmi binding.
>> - Patch 7: Make meson-ee-pwrc power up the domain memories when the
>>    domain is already on at probe time, as this is a prerequisite for
>>    dropping the explicit write from meson_dw_hdmi
>> - Patches 8-9: Clean up manual HHI clock/power-domain writes in
>>    meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>>    to use the generic PHY framework.
>> - Patches 10-12: Add the "hdmi-phy" child node and wire up the "phys"
>>    phandle for G12, GXBB, and GXL Device Trees.
>>
>> Tested on:
>> - Khadas VIM1 (GXL)
>> - dtbs_check and dt_binding_check run cleanly with no new warnings.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>> Changes in v5:
>> - Add Patch 4: Rename Meson8 HDMI TX driver to prepare other SoCs
>>                 integration. Martin's review.
>> - Patch 5: Adapt the GXBB, GXL, GXM and G12A SoCs code to Patch 4.
>> - Link to v4: https://patch.msgid.link/20261123-meson-drm-create-
>> hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr
>>
>> Changes in v4:
>> - Patch 2: Change commit title. Sashiko and Neil review.
>> - Patch 4: Change the phy min_rate to 15.9 MHz mathematical limit.
>>             Thanks to Sashiko's review.
>> - Patch 8: Drop introduced double free with phy_destroy.
>>             Add missing device_link_remove()
>>             Change the device_link order and use prepare/complete in the
>>             VPU drv for drm_mode_config_helper. Sashiko's review.
>> - Link to v3: https://patch.msgid.link/20261121-meson-drm-create-
>> hdmitx-phy-v3-0-f8f471788076@aliel.fr
>>
>> Changes in v3:
>> - Patch 6: reuse meson_ee_pwrc_mem_power_up() in meson_ee_pwrc_on()
>>    function.
>> - Patch 8: revert the code to v1 and add a device link to solve
>>    suspend/resume order in dpm_list.
>> - Link to v2: https://patch.msgid.link/20261120-meson-drm-create-
>> hdmitx-phy-v2-0-93d622d9bb07@aliel.fr
>>
>> Changes in v2:
>> - Patches 5,9-11: Remove unecessary "phy-names" for uniq phy.
>>                    Thanks to Neil's feedback.
>> - Add Patch 6: Power up the memories when the domain is already on.
>>                 From Sashiko's feedback.
>> - Patch 4: Add a 600MHz max_rate and a 25Mhz min_rate check and
>>             exclude PHY_HDMI_MODE_FRL for phy_validate. Thx Sashiko.
>> - Patch 8: Move phy_init in dw_hdmi_phy_init and phy_exit
>>             in dw_hdmi_phy_disable. From Sashiko review.
>> - Link to v1: https://patch.msgid.link/20261117-meson-drm-create-
>> hdmitx-phy-v1-0-9e0ac931381c@aliel.fr
>>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: Neil Armstrong <neil.armstrong@linaro.org>
>> To: Kevin Hilman <khilman@baylibre.com>
>> To: Jerome Brunet <jbrunet@baylibre.com>
>> To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> To: Vinod Koul <vkoul@kernel.org>
>> To: Manivannan Sadhasivam <mani@kernel.org>
>> To: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> To: David Airlie <airlied@gmail.com>
>> To: Simona Vetter <simona@ffwll.ch>
>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> To: Maxime Ripard <mripard@kernel.org>
>> To: Thomas Zimmermann <tzimmermann@suse.de>
>> To: Ulf Hansson <ulfh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-amlogic@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-phy@lists.infradead.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-pm@vger.kernel.org
>>
>> ---
>> Ronald Claveau (12):
>>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible
>> matching in conditionals
>>        dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY
>>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy
>> child node
>>        phy: amlogic: rename Meson8 HDMI TX PHY driver to be SoC-generic
>>        phy: amlogic: meson-hdmi-tx: Add GXBB, GXL, GXM and G12A support
>>        dt-bindings: display: amlogic,meson-dw-hdmi: Add phys
>>        pmdomain: amlogic: meson-ee-pwrc: power up memories for boot-
>> enabled domains
>>        drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>>        drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI
>> TX PHY
>>        arm64: dts: amlogic: Add HDMI TX PHY node for G12
>>        arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>>        arm64: dts: amlogic: Add HDMI TX PHY node for GXL
>>
>>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   4 +
>>   .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 ++
>>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   6 +
>>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   6 +
>>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
>>   drivers/gpu/drm/meson/Kconfig                      |   2 +
>>   drivers/gpu/drm/meson/meson_drv.c                  |  16 +-
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c              | 223 +++++-------
>>   drivers/phy/amlogic/Kconfig                        |   9 +-
>>   drivers/phy/amlogic/Makefile                       |   2 +-
>>   drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 391 +++++++++++
>> ++++++++++
>>   drivers/phy/amlogic/phy-meson8-hdmi-tx.c           | 160 ---------
>>   drivers/pmdomain/amlogic/meson-ee-pwrc.c           |  19 +-
>>   include/linux/phy/phy-meson-hdmi-tx.h              |  19 +
>>   15 files changed, 627 insertions(+), 312 deletions(-)
>> ---
>> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
>> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
>>
>> Best regards,
>> -- 
>> Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> We need to get the bindings reviewed first, then PHY drivers can be merged.
> 
> Afterwards I'll merge the DRM patch on the next cycle, then finally the DT.
> 
> Neil

Thanks for laying out the timeline, that works great for me.

-- 
Best regards,
Ronald

