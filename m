Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CCD606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lucWiSR3;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O6vB0Y1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pdQlb2CsGbWPGWlbFcx6D3f/AbXcJrTux+zl7o+qrMU=; b=lucWiSR32IGR6lVeQLSsl+piTi
	W+E45FQqobNjycldLC80TBzFQLSayEz48JKfvqOZAWBqLCiP72bWRIotfOzi7n3EWgCChS72Y5JlV
	2Mca2xlRF8x4wKQQ5SrxT+b61dQH0P1uf1U50L0If7v/kxE68VMQ/6rnyWuGiw5EU1NbYRE/5Nyad
	KX/bRQ3HoILQv6jjqEy9xbEmMThvIQwtzzSI4/bNHO3syVsbJqABtHDLZ6EtzkBg/3/AKwu9jj1zt
	Dn0HPEcSa8glI0ZHTwQ9evZKIy+FOStLjz48bhQYXFJagQ0I19MwmmEU5GryfdwIVnAVodZHn+TWp
	B4MvcJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx2E-0000000B7gt-3maK;
	Thu, 19 Nov 2026 07:58:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx2C-0000000B7fr-07eG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:58:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7609835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 23:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795075098; x=1795679898; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdQlb2CsGbWPGWlbFcx6D3f/AbXcJrTux+zl7o+qrMU=;
        b=O6vB0Y1aGqTZIDya6p6hkNt793Si3/UqiPJ3xWr+HddfiHtN/W2JietFYDkrPhzcwc
         xBqbfEXdhZLxrfM6vsUoNLVDgCC3/8z9OO5rwJFfK4D7xCJZUxvjl0ocUzerHauo7u9R
         t4h90FlMaLPgtc5OQeu9Rs20nmD6PXruZ2Yn3qCp0YqOsLvQfJc8dSib2kTDdYEHsUw0
         7qcyPTaTiCFsAywwi8dHFcwnwHVzH4ofvKOGtTxTjNhCroJ6CziTcnLRHuIHR6wmQD6+
         Fpr99qKyXOPE9VFJ2kjFNj6iA0aSMox7/c31q/v1/5P8vfB7uE2Y6mZqFs3sQmS0e7KO
         Bs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075098; x=1795679898;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdQlb2CsGbWPGWlbFcx6D3f/AbXcJrTux+zl7o+qrMU=;
        b=cJ+UYK+CY6qXcQ7r5RmlV60vx397TW7zCxhwo00PcOBZMTYfyNn4EFz7yf63mm/jql
         Wqh491AGcglPK7GVQB+cQa/pdibDc0gqzR4uqrIWqcLOvNyvYIJYvsY9yy3XNIdcwqD+
         dvdyLvYxA7mdbTth4PnGSULCQWzdmdCpHicQlOUQ8wHOspxH+TiDVkt214Hk9vf1MTtt
         SxMdNYisxmAF+enXwgMSwhZMnxF76bReFKHsPLeyNq1iapViCC/AzUmiVLe1XQxko2bJ
         ELSNmb+NSA7rfP8jzt8yuHkLgGD7W5itW2dvw38XIPKySZqPz9T5H1PEr7pn1I9Jresi
         uPWA==
X-Forwarded-Encrypted: i=1; AL+hErGrj/80eVajVfl/QvH3EiCT6vGTSJ2QptXOS2wkYFgVddQ0sOeZL/ZRLCWXmyfw36Wj2ktG8J7XGFoyC2MradhO@lists.infradead.org
X-Gm-Message-State: APuU4Z+jjRv2E5QWDjQO9pR8ZQizYc+rxhcSZt6KuMHahErJNrmzgRy3
	0AvcQX+7Ma1nuwyjMZX4W+WVtPBSW0ATkfidP/ZQK0p+mnCz+jDMLQSnKhkjVvFI7vc=
X-Gm-Gg: AYBFou3HrT2Z4hwG3apKws0Ph3S5Fh71/crczGEXB/LJ5Ck+dPDdyQqV1ypD/+Ypr/T
	gUYESjud9+jG2ywUF/TWnpl2vtQPICwGxLPT9IG/cV94a1QNn4TaBX8wP9FdP6ayRBFJUYEr0o3
	3gEXsoNavNLTLrOVGpIZ71LkGVikrfDgFtb31UzOE+s0XkacWx/ydpUpyaszwkxtK08Vgki71bK
	PJTCUvV2DNvqQnwjXT/Y+BHimmLxUAUZoJTq0BrFTnQq3sdR00Zs694b9fF9392/+NcXty5OyYK
	kgFxqlddBwN/R7tehAOlGpq7ji5lIN57zfqwrX2JloG6uqr4bwV3BSM8RWZ3eUIsr5A4mcjApV/
	cs8pHDy1HaKELUWEnsAulOY/fQA1BIl72nSQ3U5aTu9DLCM+nPoYI3MXnFRtmHeX0OVuHuIz18y
	xIkHTiLnoai2ZVsdKOQz4k5KqFkbODia8dds8ecwN7nn7fu2HAbSGkzboDZqnPWvLO7Z9XRmG7A
	6wSxwnd7L+MiJvGEhEArHbh6HoVoFiz/m5kK1eEJoIRzjvD9SjahY3cDdTSBWWGElh3LgKQsXpt
	GGD6jyb4G0cYWhuKC+x38l07Gz7dZstnCQdPkcB83oCY6pwFrHcBFWRjT0KI4YejkTxFptkxod1
	b/OAwo0lx
X-Received: by 2002:a05:600c:4e86:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb8609ad6dmr6876015e9.0.1795075097389;
        Wed, 18 Nov 2026 23:58:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:3611:76ad:c4e1:77e7? ([2a01:e0a:106d:1080:3611:76ad:c4e1:77e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8532f1a9sm15704175e9.3.2026.11.18.23.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:58:16 -0800 (PST)
Message-ID: <04447713-32bb-46ff-8dd9-ba00bce186db@linaro.org>
Date: Thu, 19 Nov 2026 08:58:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/10] phy/drm: amlogic: Extract Meson HDMI TX PHY into a
 dedicated driver
To: linux-kernel-dev@aliel.fr
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
 <bb027d3b-6a43-4dd3-9771-3448c86996b5@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <bb027d3b-6a43-4dd3-9771-3448c86996b5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235820_158643_BE71AF57 
X-CRM114-Status: GOOD (  26.29  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 20:35, linux-kernel-dev@aliel.fr wrote:
> On 11/18/26 13:38, Neil Armstrong wrote:
>> Hi,
>>
>> On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
>>> This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
>>> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
>>> dedicated generic PHY driver.
>>>
>>> Until now, meson_dw_hdmi directly manipulated the HHI system controller
>>> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
>>> resets, and manage power states, as well as manually ungating HDMI
>>> clocks and power domains already described in the DT.
>>>
>>> By extracting this logic into a standalone PHY driver under
>>> drivers/phy/amlogic/:
>>> - Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
>>>     as a child node of the HHI syscon referenced via standard "phys" and
>>>     "phy-names" properties.
>>> - The DRM bridge driver relies on the standard generic PHY API
>>>     (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>>>     touching syscon registers directly.
>>> - Legacy DTs lacking the "phys" property remain supported via a
>>>     temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
>>>     backward compatibility to be removed on next phase of component
>>>     removal.
>>>
>>> Overview of the series:
>>> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>>>     add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>>>     "hdmi-phy" child node under the HHI syscon.
>>> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>>>     PHY configuration ops, along with the temporary legacy creation
>>>     helper.
>>> - Patch 5: Document the optional "phys" and "phy-names" properties in
>>>     the amlogic,meson-dw-hdmi binding.
>>> - Patches 6-7: Clean up manual HHI clock/power-domain writes in
>>>     meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>>>     to use the generic PHY framework.
>>> - Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
>>>     phandle for G12, GXBB, and GXL Device Trees.
>>>
>>> Tested on:
>>> - Khadas VIM1 (GXL)
>>> - dtbs_check and dt_binding_check run cleanly with no new warnings.
>>>
>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>> ---
>>> Ronald Claveau (10):
>>>         dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible
>>> matching in conditionals
>>>         dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>>         dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy
>>> child node
>>>         phy: amlogic: Add Meson HDMI TX PHY driver
>>>         dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-
>>> names
>>>         drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>>>         drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI
>>> TX PHY
>>>         arm64: dts: amlogic: Add HDMI TX PHY node for G12
>>>         arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>>>         arm64: dts: amlogic: Add HDMI TX PHY node for GXL
>>>
>>>    .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
>>>    .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
>>>    .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>>>    arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
>>>    arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>>>    arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
>>>    drivers/gpu/drm/meson/Kconfig                      |   1 +
>>>    drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 ++++++--------
>>>    drivers/phy/amlogic/Kconfig                        |  11 +
>>>    drivers/phy/amlogic/Makefile                       |   1 +
>>>    drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++
>>> ++++++++++
>>>    include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
>>>    12 files changed, 513 insertions(+), 136 deletions(-)
>>> ---
>>> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
>>> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
>>>
>>> Best regards,
>>> -- 
>>> Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> Overall it's very good, but I would've prefered a more sequencial move
>> to the PHY driver, with an exact copy of the code and simplification
>> towards the current PHY code.
>>
>> Anyway, the sashiko review comments are good, especially the one on
>> patch 6 to keep the driver working on old DTs, sorry my bad...
>>
>> Neil
> 
> Thanks for your feedback, I am analyzing/testing sashiko feedback.
> 
> About the suspend/resume unbind/bind, I do not have any issue on my
> side, but I can change the orders.
> 
> About patch 6 and the old DTs, I will reintroduce them with the legacy
> check. Do you know what would be a good timeline to add a require on
> those elements and drop the fallback code ?
> 

The problem is not necessarily the kernel DT but the U-Boot DT which
could be used by the kernel.

The U-Boot DT was using v6.2 before v2024.07 and after it uses the synchronized
DT from Linux, which coincides with the v6.11 DT which contains the DT clocks
changes.

It seems most of the SBCs distro uses recent U-Boot versions, and some nice distro
ships older U-Boot version, so it could break on those if a new kernel was deployed.

But, U-Boot already set HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0 when probing dw_hdmi
since 2019.04 so considering that I thing the risk is super low.

Add this to your commit message and send a v2.

Neil

