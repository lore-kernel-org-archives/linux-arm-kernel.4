Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0094C606C715
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WdxCue10;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=ndG0zBXt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mm0Tlr+mV6dnPz8Xs2eWla4wTBomddtD84Q9Vn5aR0U=; b=WdxCue10aRUt2E
	M09ie4Yx9aUR65pmdA9YSJRI75tWIOW/sShANOrJOor6eliQVqlsP7Wa7Z6EQoVgTUuzNW2nvlTah
	6QmrnGjjO6moBXFsKBHfgc2Hn9vLxLjnhIjU5dvUPbZ0yrxrtfkMoAFHnernvt90Wu5bjtmGtmb8T
	TaRIo4osL3JXR2rnD7zykpyvCuh0kSp5GV1ZYyA3k8ckK+3DfCpjkatr6m9yTcHU4W6TXynEG38Op
	th5vIvSPDXdCHbxgLl0PIwLBjS7BcvhPuydJZZ1snImwTENaYnjvXyfpkyqQpUorajhpcC4puiLQb
	WA/DjRHmlEmYuwKZWzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlRQ-0000000A7DJ-2I4y;
	Wed, 18 Nov 2026 19:35:36 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlRO-0000000A7Cj-0IkY;
	Wed, 18 Nov 2026 19:35:36 +0000
Message-ID: <bb027d3b-6a43-4dd3-9771-3448c86996b5@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795030528;
	bh=q1cF5XXNw8wayh7tmwKgKYk42pA4x2pEosRpTQBiONs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ndG0zBXtIkXmu8cIOYlH+3B1SMMIDc0k+dvgANzIY8Ozgmjct+TTGgEoa7gSphunO
	 0AXufkyeSVgWo3D6KVe6HRmfyLS3iX46o/Pl+5HbAgr5n5x9SLYhGz28KNTSqlOcPY
	 MsHPzH5KILeT1ZpzQl3i4QUKSPEqHlbunwygoMmE=
Date: Wed, 18 Nov 2026 20:35:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH 00/10] phy/drm: amlogic: Extract Meson HDMI TX PHY into a
 dedicated driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <51831581-525f-418c-86ea-3b5c6a80709b@linaro.org>
Content-Language: en-US
In-Reply-To: <51831581-525f-418c-86ea-3b5c6a80709b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_113534_797955_4F50FA66 
X-CRM114-Status: GOOD (  21.57  )
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

On 11/18/26 13:38, Neil Armstrong wrote:
> Hi,
> 
> On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
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
>>    as a child node of the HHI syscon referenced via standard "phys" and
>>    "phy-names" properties.
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
>> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>>    PHY configuration ops, along with the temporary legacy creation
>>    helper.
>> - Patch 5: Document the optional "phys" and "phy-names" properties in
>>    the amlogic,meson-dw-hdmi binding.
>> - Patches 6-7: Clean up manual HHI clock/power-domain writes in
>>    meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>>    to use the generic PHY framework.
>> - Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
>>    phandle for G12, GXBB, and GXL Device Trees.
>>
>> Tested on:
>> - Khadas VIM1 (GXL)
>> - dtbs_check and dt_binding_check run cleanly with no new warnings.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>> Ronald Claveau (10):
>>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible
>> matching in conditionals
>>        dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy
>> child node
>>        phy: amlogic: Add Meson HDMI TX PHY driver
>>        dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-
>> names
>>        drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>>        drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI
>> TX PHY
>>        arm64: dts: amlogic: Add HDMI TX PHY node for G12
>>        arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>>        arm64: dts: amlogic: Add HDMI TX PHY node for GXL
>>
>>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
>>   .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
>>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
>>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
>>   drivers/gpu/drm/meson/Kconfig                      |   1 +
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 ++++++--------
>>   drivers/phy/amlogic/Kconfig                        |  11 +
>>   drivers/phy/amlogic/Makefile                       |   1 +
>>   drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++
>> ++++++++++
>>   include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
>>   12 files changed, 513 insertions(+), 136 deletions(-)
>> ---
>> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
>> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
>>
>> Best regards,
>> -- 
>> Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Overall it's very good, but I would've prefered a more sequencial move
> to the PHY driver, with an exact copy of the code and simplification
> towards the current PHY code.
> 
> Anyway, the sashiko review comments are good, especially the one on
> patch 6 to keep the driver working on old DTs, sorry my bad...
> 
> Neil

Thanks for your feedback, I am analyzing/testing sashiko feedback.

About the suspend/resume unbind/bind, I do not have any issue on my
side, but I can change the orders.

About patch 6 and the old DTs, I will reintroduce them with the legacy
check. Do you know what would be a good timeline to add a require on
those elements and drop the fallback code ?

-- 
Best regards,
Ronald

