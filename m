Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9562606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NITfbNbo;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wXkaLk8R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/leW6zs7HC40lM5Yv1F7Yi0moI4pxhI/mUly1W4apXs=; b=NITfbNboI2RuLEEF/g9Nn4z9jN
	/9VDrXDOjYMgK0CoiiWtLqdYL4it3U4koh9roNHq6p/vNxfXtfrMwq6bkUDlLHqbra31i+0T6Uo/R
	ChUE5bjJfu2Qs0wYybvwT2Q0g5MLO+2l2SbS9uyInjTw51zb9HBLFIYSDjZYcIApNqbcrXQpyiimi
	d9CrfMqWOQOJvUzRbJ6wEL2maWcVfi3AsyWjVrcsBb8ps0Bn/f8uNvBBxoDuynQ/XhP0jJMi9VDvb
	/siCGxhvUjHxkEKrjyMSg7q57HO7oGYh89/N0XtVqBnhTof8CBeViia8XFfqJnD/lCFCTV8Iroxm1
	K25edbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy02-0000000GrYV-3TD8;
	Fri, 27 Nov 2026 15:36:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxzA-0000000GrPS-2Ngr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:35:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso5219650f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795793739; x=1796398539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/leW6zs7HC40lM5Yv1F7Yi0moI4pxhI/mUly1W4apXs=;
        b=wXkaLk8Rfo4+SgHwR+7eR7PWiblGL7b7ZR8K4zXE9q0+qkjR7i4Ivb4FqY2QA2LSBf
         kh7sZBxODbd8EX5DNqZ8yri1wvxu7Ycjd5hQkRgBlhBmBWhGNRSD+PwVz+/q/6/OC/VB
         FXCxmHOZ6uxH+zLpZVqantTtW5vgt3j6o2Aj+XWCFyyZliaLKjEz1ovEzCnHw+0ZDfne
         8mKz+eE1+rA6MgtHD0Djdq0zjm4dqsK/T355OZVMHgoh1KrNYNg+tndP0y2HeMfJ1C9I
         jJMHAy6fKeWB2qUkzdmN826HcSywVINLQCVRkICPIF6JoOIw5Xva2jYFbCc9shw9TIk/
         5ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793739; x=1796398539;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/leW6zs7HC40lM5Yv1F7Yi0moI4pxhI/mUly1W4apXs=;
        b=VmoJH0uDc+u/H8ASDbwr2M11hdryIuk6NG9kHn9UqOOuzbjDu9gcPc3r6n0eA/lt+R
         UdZDPc63SMMb1rE6fL50d1V7Ii7arEVx1u+K34BxwPMlrWvA6m3VI4WR9DDGo4U1HsF2
         x7Vfp/wOMjr2RkPoyRscN0Hwu121Aa2FhU3EAOqe8qG3acP016lcyC7bSxwmS2vuGWDc
         LCzgpSbLQ6IX3e/cEi1dKwkbbNyvz+moRcOIxsD+t5s+yrg2zmSMMo26MCr/hbJk7zKR
         K5jO2RMJLHmAW7wrpYBFcTOCgBVBin7SsN/I0lmjkIwf163a1t2zz0pzqYNEe8Mrq6vE
         64pA==
X-Forwarded-Encrypted: i=1; AL+hErFAjcHnQYAf4JpPfOzqQLdfuAf7uvfWgwrEzWXKNNaNdUVIq7aA6iQvcYPwhFpbT/9NeQaHp2UrC4TnoklXvCD0@lists.infradead.org
X-Gm-Message-State: APuU4Z+YcaGI95ZVc0E1GdDQxFIeHtXbMl5kc6JfMTCyI6S0kfayVBpU
	mq1b/HssdnatndaNY/xyZmwzlKvV9FYq0Qqk8RNke9FLq0JTIAes4ZQZoZpPlSwpA5I=
X-Gm-Gg: AZFdTZc9R0M2IRZTChXwbreZqOIwmoCI7cc8PUUqEcmctDvKvv1PBBlYL2klTxnCyni
	1CveorHOh2K83wk0ai35bEFvXoKemAVqU7ttyxNnCrV+XFMOLrQ91R4ejV8V/e+PtKPvyUm321c
	tqKwlvP4nroiiSkCbHupY0Lw/oKnIOerAzxB+O1G6iMcuo8f+smmijZBduexgsEI2LB2xWbBdEe
	PpUIjAdpF6b9w8/oUP4dEldzV2+qJ4+G4JC1NAMPd7jpwKraY4Z+VDFAZyRJDBBkltEie+Yg8DY
	SpzpHrEPLgRXJd0f6gO/epFsmZF/qIBngc+LQBryg966edtuxWx29wftTmiFJg2Zdb0Dz/Mn8RB
	PmOlIa0Cy+VZ6RaYjvtRMc8PGlFSKTLZNarxBa6f7+zCeFtcPxcPhSn6TkPJM4vRNqXfPm67u65
	Y1Ei4G/uI4ZUMAzSEVC6oFwU2byWaQNF1Bv4wtCo1I21JYcvYFHaTRFcVXWrORu6Jq/Y4IR6GDV
	OEhyAfj4kBCMR+0zL1i0iFJ4RA1I9rvMsHW9pbmZYG8sg89IF8qCh5dOzEd3Rypi5lqe2wDzvbc
	u6jYvtwRI3q/mr9oLxrkoPgLkwx0LsFxR5/bmdBFlcXCpI4j+IRBJSjJBj5LrFy7Paa6dGD3LhV
	H01yJGdnLXWorhSCQk+DSFrHAOe1w8A==
X-Received: by 2002:a05:6000:2997:10b0:4a8:12d3:c0b2 with SMTP id ffacd0b85a97d-4abb47b2244mr36965476f8f.23.1795793738453;
        Fri, 27 Nov 2026 07:35:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:c897:5d9b:d0a4:e684? ([2a01:e0a:106d:1080:c897:5d9b:d0a4:e684])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm48927658f8f.33.2026.11.27.07.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 07:35:38 -0800 (PST)
Message-ID: <446fa440-1537-4b30-8429-4d72bb70029d@linaro.org>
Date: Fri, 27 Nov 2026 16:35:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 00/12] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
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
In-Reply-To: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073540_713570_65DC68F2 
X-CRM114-Status: GOOD (  28.59  )
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

On 11/27/26 16:27, Ronald Claveau via B4 Relay wrote:
> This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
> dedicated generic PHY driver.
> 
> Until now, meson_dw_hdmi directly manipulated the HHI system controller
> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
> resets, and manage power states, as well as manually ungating HDMI
> clocks and power domains already described in the DT.
> 
> By extracting this logic into a standalone PHY driver under
> drivers/phy/amlogic/:
> - Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
>    as a child node of the HHI syscon referenced via standard "phys"
>    properties.
> - The DRM bridge driver relies on the standard generic PHY API
>    (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>    touching syscon registers directly.
> - Legacy DTs lacking the "phys" property remain supported via a
>    temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
>    backward compatibility to be removed on next phase of component
>    removal.
> 
> Overview of the series:
> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>    add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>    "hdmi-phy" child node under the HHI syscon.
> - Patch 4: Rename the Meson8 HDMI TX PHY driver to be more SoC generic.
> - Patch 5: Add GXBB, GXL, GXM and G12A SoCs to the Meson HDMI TX PHY
>    driver, implementing the HDMI PHY configuration ops, along with the
>    temporary legacy creation helper.
> - Patch 6: Document the optional "phys" and properties in the
>    amlogic,meson-dw-hdmi binding.
> - Patch 7: Make meson-ee-pwrc power up the domain memories when the
>    domain is already on at probe time, as this is a prerequisite for
>    dropping the explicit write from meson_dw_hdmi
> - Patches 8-9: Clean up manual HHI clock/power-domain writes in
>    meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>    to use the generic PHY framework.
> - Patches 10-12: Add the "hdmi-phy" child node and wire up the "phys"
>    phandle for G12, GXBB, and GXL Device Trees.
> 
> Tested on:
> - Khadas VIM1 (GXL)
> - dtbs_check and dt_binding_check run cleanly with no new warnings.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Changes in v5:
> - Add Patch 4: Rename Meson8 HDMI TX driver to prepare other SoCs
>                 integration. Martin's review.
> - Patch 5: Adapt the GXBB, GXL, GXM and G12A SoCs code to Patch 4.
> - Link to v4: https://patch.msgid.link/20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr
> 
> Changes in v4:
> - Patch 2: Change commit title. Sashiko and Neil review.
> - Patch 4: Change the phy min_rate to 15.9 MHz mathematical limit.
>             Thanks to Sashiko's review.
> - Patch 8: Drop introduced double free with phy_destroy.
>             Add missing device_link_remove()
>             Change the device_link order and use prepare/complete in the
>             VPU drv for drm_mode_config_helper. Sashiko's review.
> - Link to v3: https://patch.msgid.link/20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr
> 
> Changes in v3:
> - Patch 6: reuse meson_ee_pwrc_mem_power_up() in meson_ee_pwrc_on()
>    function.
> - Patch 8: revert the code to v1 and add a device link to solve
>    suspend/resume order in dpm_list.
> - Link to v2: https://patch.msgid.link/20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr
> 
> Changes in v2:
> - Patches 5,9-11: Remove unecessary "phy-names" for uniq phy.
>                    Thanks to Neil's feedback.
> - Add Patch 6: Power up the memories when the domain is already on.
>                 From Sashiko's feedback.
> - Patch 4: Add a 600MHz max_rate and a 25Mhz min_rate check and
>             exclude PHY_HDMI_MODE_FRL for phy_validate. Thx Sashiko.
> - Patch 8: Move phy_init in dw_hdmi_phy_init and phy_exit
>             in dw_hdmi_phy_disable. From Sashiko review.
> - Link to v1: https://patch.msgid.link/20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Kevin Hilman <khilman@baylibre.com>
> To: Jerome Brunet <jbrunet@baylibre.com>
> To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> To: Vinod Koul <vkoul@kernel.org>
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: Ronald Claveau <linux-kernel-dev@aliel.fr>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Ulf Hansson <ulfh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-pm@vger.kernel.org
> 
> ---
> Ronald Claveau (12):
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
>        dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy child node
>        phy: amlogic: rename Meson8 HDMI TX PHY driver to be SoC-generic
>        phy: amlogic: meson-hdmi-tx: Add GXBB, GXL, GXM and G12A support
>        dt-bindings: display: amlogic,meson-dw-hdmi: Add phys
>        pmdomain: amlogic: meson-ee-pwrc: power up memories for boot-enabled domains
>        drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>        drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
>        arm64: dts: amlogic: Add HDMI TX PHY node for G12
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXL
> 
>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   4 +
>   .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 ++
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   6 +
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   6 +
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
>   drivers/gpu/drm/meson/Kconfig                      |   2 +
>   drivers/gpu/drm/meson/meson_drv.c                  |  16 +-
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              | 223 +++++-------
>   drivers/phy/amlogic/Kconfig                        |   9 +-
>   drivers/phy/amlogic/Makefile                       |   2 +-
>   drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 391 +++++++++++++++++++++
>   drivers/phy/amlogic/phy-meson8-hdmi-tx.c           | 160 ---------
>   drivers/pmdomain/amlogic/meson-ee-pwrc.c           |  19 +-
>   include/linux/phy/phy-meson-hdmi-tx.h              |  19 +
>   15 files changed, 627 insertions(+), 312 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
> 
> Best regards,
> --
> Ronald Claveau <linux-kernel-dev@aliel.fr>

We need to get the bindings reviewed first, then PHY drivers can be merged.

Afterwards I'll merge the DRM patch on the next cycle, then finally the DT.

Neil


