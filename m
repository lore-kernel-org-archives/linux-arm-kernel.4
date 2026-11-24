Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D74606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c1/L4gOf;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UdocUu54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=; b=c1/L4gOfkTTs6/Vc9RCvrY6rjn
	erbfFCWdbBY6LMvTNKOWa5BDG2M2js5Hx0Vk2FQSBwR51d5SuR6D9j2tN/S8jlaNKcXXbtZApFgzc
	j3P4n6q5p7voxdx323cSXDppG2z9plOVVPOQ+kzOZkRPX39deoKy/MztDNZInBk/m1I22TBqvXdPx
	jFgklHxu/ivXr4Z4OYJGfxKvjSciMRVKBrvQViVLZw8qgUp8Qu523ah99531rbEA0R8PCBzxq5qEf
	PEjbkizWJMsUhtHkxYe8+OU87kvDSHoqJTXhupTzC9nQydc0EtqLwNnADwhtKqfiBi250HknUyjHl
	CcBFLd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt7z-000000074RJ-0K8g;
	Tue, 24 Nov 2026 16:12:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt7q-000000074OS-0bet
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:12:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so40527345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795536728; x=1796141528; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
        b=UdocUu54gggqTUHivGFN9LyoIrTSrQeYHz7Q5/BnOuqXSTdVHc8hDWVuwmn/FRk32u
         9zSrj5vVvuKbUPu6ZRHdNl1m07gM2RJFy74CLYEikqtxvsyXhl9EyMNjt/jci5zzrQCY
         dDRJ12hE9qqLqywN3ALWLSTqpW+uLkgK12vwLtUnwTE1TIOuYKMAZ2W7F71h+dw8Kasx
         4C7pzE7mq5t7IpK5F6Zlcp1r909TVDUV/hqK0cFM68iAaIxngQudwlTUzs+Uoj83mYOQ
         kT9FV0kIyPaOoAZLOiSeRQNer5z2pLv6DtiHcORnH3I2VTBDYMMweRPZWfua5R5EmNgb
         95bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536728; x=1796141528;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
        b=cdxKjI9zpXjJiL1OJ0Hp8ezKlXVBHCnenDdh7lj7KSzku0Ufj5e+j8A2QH3JFcQ9+B
         E8cvc7MfQ/1U0fCC4JU7YMIGY/w3MFVzke+cB+HtPtLHTqKd69g5xrqn3A79r7xSNsWs
         naE9FLHRlGc9n3cK4zg7I8Ts+l7UAEdxrX53YbEt7Kv/NgUiF7oi9zS9zgdSb2LJ1eAj
         h+dbbS4Uf9u0xkwsZMRJBYkQW8E72WOJyvWQ/T3jwHh64lM4HbU430hG5ThFndiZu0b3
         TBpUU+FmRey7GGn36ypCS3gSFwG4+4HUOFz1o8HTFXLn8ptpXXoYIKXybfKHVuiQVFxJ
         YW5w==
X-Forwarded-Encrypted: i=1; AL+hErG9t5iX5L7NYMac5nCYiIWzrzBYQbSO7XFkVdWRIXFE+GTdRQDDm1jJ/f4YTOCaShy/DiZZhLGojST7gp/b/i8d@lists.infradead.org
X-Gm-Message-State: APuU4Z+a+cGuk89Jhb78PpEe5qUceGvgK9szqaetsoUYM25iqmtsPTsO
	YxNrzgUS+YgvDd74V54Nx82lhEDRFKcJuQs8YCJuaEgc4w9HT/A7baDun1nvdzWmGp28qrzFUfA
	SyQXLwgY=
X-Gm-Gg: AZFdTZcTa9zNMSVko8xPi9MlLqscs3gOt5G01LvO2EM/6pXg0oS5H9aXauGkA1MDLOb
	3Q5CBL/IRlbyMAtQGvT7Sj5DtvK8GLQ8Fb1jaGvIKPvXT7vKuFlB0NhRz2BDkJ1QkrnIlTvZ1G5
	mOJBBYb8bPoedlbeCk1opgfbNEVxzLCNx7B0cNTHng/+4auz7kZYx8lrwswvRYvKdWrxHx0WBta
	IPce94ueaTmUayxd4Rn9wR/XKYPTSaDpkc7yUC+2FcMNAP9kiHgastq/qElwZMiPvR8rBx49EBM
	OfoZc3V9eoids9dx6IngiVFjnz88+wkVwZHqt71yXr5iWsffrkwTt8r+29JVM+QTbYv71m0lzvi
	mM8NYmSESKEAq5gdZU9tQj4i2v/JvRBHaUhtcAZnVWdql5qYcn7jD+mRfDR5hLD26/hwdxoXpQ2
	3JHxv5RWDCk9pJeWqIaqzBz4mqapQYEpfahKhSC0iiDCdq+jmowisglYPjzPko9pHku8XBLMnxL
	EhH+WeJPzhI+FZnWfhV8sYOCFa/ZE7Zq4XOlDzUa4KTIBZmywhGq+sdo6reRPesUxsXlHSx9XIp
	/FgTNocJO2VTgDCspfRoJTDrcYF0c6HNcLuwCdy+PH5l8TYd1VHqc6yh53L5awQuIMrizpDa+Eq
	IQ1LWS/YC
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr344659275e9.9.1795536727863;
        Tue, 24 Nov 2026 08:12:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm358970025e9.0.2026.11.24.08.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:12:07 -0800 (PST)
Message-ID: <afcf78be-b017-485c-8e11-402b0948c9f8@linaro.org>
Date: Tue, 24 Nov 2026 17:12:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 0/2] drm/meson: add HDMI support for GXLX2
To: zinan@mieulab.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260718111527.119231-1-zinan@mieulab.com>
 <ac5ef957c03ab3bf3fdb464680f3b024a883aefa@mieulab.com>
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
In-Reply-To: <ac5ef957c03ab3bf3fdb464680f3b024a883aefa@mieulab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_081212_419191_568F93EB 
X-CRM114-Status: GOOD (  30.31  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/24/26 15:19, zinan@mieulab.com wrote:
> Hi Neil and all,
> 
> Following up on this GXLX2 HDMI RFC from July. Since then, users have reported working HDMI output on several
> S905L3-family boxes with a downstream implementation, including a P291 board. Their reports are here:
> https://github.com/ophub/amlogic-s9xxx-armbian/issues/3604 <https://github.com/ophub/amlogic-s9xxx-armbian/issues/3604>
> Before I refresh the series, would you recommend keeping the proposed amlogic,meson-gxlx2-dw-hdmi compatible and a
> single MMIO resource for DWC and TOP, or describing the two windows as separate named resources?

Please rebase on https://lore.kernel.org/all/20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr/ and adapt your patch.

Thanks,
Neil

> 
> Thanks,
> Zinan
> 
> July 18, 2026 at 8:15 PM, "Zinan Zhou" <zinan@mieulab.com <mailto:zinan@mieulab.com?to=%22Zinan%20Zhou%22%20%3Czinan%40mieulab.com%3E>> wrote:
> 
>     This RFC adds HDMI transmitter support for the Amlogic GXLX2 family,
>     observed as an S905L3 (CPU major ID 0x2a) in a FiberHome HG680-LC set-top
>     box.
> 
>     GXLX2 is unusual in that the display pipeline, clocks and HDMI PHY follow
>     the older GXL path, while the HDMI controller register interface is
>     directly mapped: DWC registers are byte-addressed from 0xda800000 and TOP
>     registers are 32-bit registers at 0xda808000 + index * 4. The existing
>     G12A access callbacks implement this layout, but using all G12A match data
>     would select the wrong PHY initialization for GXLX2.
> 
>     Patch 1 proposes a dedicated amlogic,meson-gxlx2-dw-hdmi compatible
>     without a meson-gx-dw-hdmi fallback. Patch 2 adds dedicated match data
>     combining direct register callbacks with GXL PHY behavior. It also handles
>     the GXLX2 value for the 297 MHz PHY bucket and adds the compatible to the
>     Meson DRM component match list.
> 
>     This RFC depends on the separately posted common Meson DW-HDMI regmap fix:
> 
>     drm/meson: constrain the DW-HDMI regmap range
>     https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/ <https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/>
> 
>     That formal bug-fix patch bounds register iteration below the directly
>     mapped TOP block and prevents the legacy 16-bit indirect interface from
>     wrapping. It is intentionally not part of this RFC so it can be reviewed
>     and merged without waiting for agreement on the GXLX2 DT ABI.
> 
>     I would particularly appreciate feedback on two DT ABI questions:
> 
>     1. Is amlogic,meson-gxlx2-dw-hdmi the appropriate block compatible name?
>     2. Should the DWC and TOP windows be represented as one contiguous MMIO
>     resource, as in this RFC, or as two named resources?
> 
>     Evidence and disclosure:
> 
>     - The GXLX2 addresses and 297 MHz value are factual results of analysis of
>     the HG680-LC vendor kernel. Firmware SHA-256 and focused behavioral
>     evidence can be supplied if useful, but no firmware, kallsyms dump or
>     disassembly is part of this submission.
>     - Public Amlogic-derived GPL source documents the ordinary GXL 2.97 Gbps
>     values and public GPL-2.0+/MIT source documents the same direct DWC/TOP
>     access mechanism used on later SoCs. The implementation here does not
>     copy a vendor function body.
> 
>     Testing:
> 
>     - An equivalent Linux 6.6.18 implementation boots from eMMC on the
>     HG680-LC.
>     - 1920x1080 HDMI video was physically verified on an LG 27GL850.
>     - Two-channel HDMI LPCM through the display and analog stereo audio were
>     physically verified.
>     - The downstream 6.12 port boots from eMMC with working Ethernet/SSH and
>     has physically verified 1920x1080@60 video and HDMI LPCM.
>     - With the generic Meson non-CEA mode-range change already present in
>     current mainline, 2560x1440@59.95 video and HDMI LPCM were physically
>     verified on the display's native timing.
>     - The RFC port builds on arm64 and its binding passes dt_binding_check.
>     - 3840x2160 at 30 Hz has not yet been physically tested. That test is
>     required before a non-RFC PATCH v1 because it exercises the
>     GXLX2-specific 297 MHz branch. It is not a blocker for the verified
>     1080p/1440p use case.
>     - No other GXLX2 board has been tested yet.
> 
>     The initial RFC intentionally contains no board DTS. A downstream-only
>     HG680-LC DTS is being kept as DO NOT MERGE until the compatible and resource
>     model have received initial feedback.
> 
>     Assisted-by: Codex:gpt-5.6-sol
> 
>     Zinan Zhou (2):
>     dt-bindings: display: meson-dw-hdmi: add GXLX2 compatible
>     drm/meson: add GXLX2 HDMI register support
> 
>     .../display/amlogic,meson-dw-hdmi.yaml | 7 ++--
>     drivers/gpu/drm/meson/meson_drv.c | 1 +
>     drivers/gpu/drm/meson/meson_dw_hdmi.c | 33 ++++++++++++++++---
>     3 files changed, 34 insertions(+), 7 deletions(-)
> 
> 
>     base-commit: b0a652436b892eb9a036a031b33099dca036faaa
>     prerequisite-patch-id: 0a689485bbc3c1d77d52aeee0b81e4943d1e904a
>     -- 
>     2.43.0
> 
> 


