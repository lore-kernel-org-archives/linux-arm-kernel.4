Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E608606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N9aw6h4T;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=f8wpEOph
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V/4tBO2K3lzOYZl1l77yELe15RR3PgBFIIRphRTzGfQ=; b=N9aw6h4T1hSGw1
	LozSQ12IGN8Pkh0sz8CoP3oRMcyLcU62kBYJjApB/mMbzWxw6JqnCn9zeeqECiwv7Jdd+rr0Nepxw
	VHWfQoNRH/nsRA86/1NW4ExXwm0VTnztqte1lNU/BbJBLchIrAA0V/r7ZlS4351U6axVdcDBL+I/y
	BMQuVL58879eJNuGkmtzi+YFL//FxQApk7aWwaxA+gJtDq21rKf8gPMYaEkoNHpLBDdOKPddIRUf/
	0rbw+tUxpdxtM2uRevTlSFAk3jdA4JoesZpdO1K8jdt++iEbZLaHRkL+QpNZgh1u/ca3uFU14AaVG
	eI5PdKT2lnA5EqbwMRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjTM-0000000H6jg-0BTz;
	Sat, 21 Nov 2026 11:41:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjT6-0000000H6aB-1gss
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:41:22 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c4d427836e9so259047166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 03:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261278; x=1795866078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/4tBO2K3lzOYZl1l77yELe15RR3PgBFIIRphRTzGfQ=;
        b=f8wpEOphHkD36NcsU/LllGELe6wVv6azWFB4F55DYGd9enYheqVC4x0HsLNhJ5DD3M
         NoWI5E9ndPK63AdVI7TGBBi3jJ8xBeNuh0MRppXowoUbG5ulgQBXStna3g8XJozoU7tj
         lVdiJK3B3N1jt1YSmMBzgmSqem7o+/h0hSoirRYDsT2Vqspor1LEWWJLA//bfOWPmyzT
         TIJWMfl1pmP6yryZK8APGr20A5P2S6QqYUP7C3/uhmwP+o20MYV6EqycxaldNPuSs0sO
         jz1NWig9lTsrBdjMMJl1TFsq+ULgBnWRkemVeTTXgdsy6LN12ywB/NoqluEwW8s8l7sE
         zn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261278; x=1795866078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/4tBO2K3lzOYZl1l77yELe15RR3PgBFIIRphRTzGfQ=;
        b=gUV1w8UAJS1uKRT+2zAx3aMO/fxzp02gQ0w8ZtB4GrtVeKijz2MQlSZj9FDiRZYN8w
         TP47UeJFqiaxRY4KD0PCAXVXu1QhABmdIPPX4/yhnKvvlkbOG1Z/a9hdxa/02G3wy8Pp
         gwl77voIJmRyl9ATQ9l9zQRcTDNLuFTeyr82FcfWGkcBC6k7rrDUNnLRIDDml/SCeJA0
         bDCnbi+8f4xFGbVXicyG/ShKijTP05Tz0BDyAmYChcE2chCJrbm0wxQb6NvqrDyefCdN
         JlHPQhYEHT4+QF4zr493pR9J9BII3bXhtyot7DAPeujFq1DIbGp9LekMf/v2IGOuqony
         ndpg==
X-Forwarded-Encrypted: i=1; AL+hErFz6ihfiLa5OfWbxOLrilZU1aQXa9B6K6p5gPD8s27Br4lMmYLhJnkZkWjrqP2aEyvs6UOBBuDDubiaKtNrxNGs@lists.infradead.org
X-Gm-Message-State: APuU4Z9tQCYE/E4uaE3qSwsiBQKwF3J1J1AIFEc+wsQaEXTaIQI3AxhJ
	epzL10oC0ligDuDPZUGLfS7sB/ZQ9XJ4mbjdPJdYeIgbZ/Quq4zqzc05IMF9lXg/UQ==
X-Gm-Gg: AZFdTZdc7bNio6tqmTAZR5hS7NIYUyKIhr6QVTzXt3IsMIdd70sRu5+98Kb99eQdjil
	Sp3uXlE1Bg6kWjdRzddY5QKFnytg4uMt5j07Jy7vHVOCcPI3yQ+lhoNAq+SU/FBeGx996zyvN75
	xx4BrS/Mg5PyAPx/tgU+F7tizngaxCtAqcfDZaOwLHnbSmPRM3UgSrGk7AIwS439HSUYO7vazlo
	3OkFzCvGhLSpPgwvIlgDHI9t6te6OwQwtp+2u1ni7SqthjEWyatiDrRydSFVs9VAL/ZI91zk3Cc
	SEn7udXXU8R1q6U+ffVNqZHnVhC8/ueDQfYlN1KvbBIV2hh3PwyBNu0+OCIhkjoQOBNBQ1SMHpC
	j50Qm3kedc5Tr45khyyU6+13tYZHNBB2jU6FSXO6DFerwIiSf7ZRD+B0SGlV4WfkJzYwibyw5c3
	zYMCg5rHD053lOeb2VhmNBfvukdAQPNOHVY9oQ2wrW02gFq8I4UG+r0nSU2CWMNgK/ruJVJQHjK
	trff3OYKG0auRCxuNqcKliEmcYjr1bDwQ6QiJbsw16c/VmKck7neRb6APJGgyBQ0PzHul7LTOKV
	+o+rg6WxmA07z/QoGiKeEeCPs2O07RSeFe4WndmcH2blb4+IHgqsefKOpPSh/GEMpd1Yu10Hf1S
	A7hthL6cgVkcVd2uBSwFW01p0USBeumyHNATko/qjXceSxCIHepOOmxrmy8sL7QqZHDnmniJKSo
	zR
X-Received: by 2002:a17:907:c17:b0:c4d:31ad:9dd5 with SMTP id a640c23a62f3a-c513ac86e26mr558143666b.42.1795261278496;
        Sat, 21 Nov 2026 03:41:18 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm195387666b.25.2026.11.21.03.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:41:17 -0800 (PST)
Message-ID: <8588725f-9758-4261-8766-5af518ec4f3b@pardini.net>
Date: Sat, 21 Nov 2026 12:41:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/7] phy: rockchip: usbdp: Fix runtime muxing between
 USB3 and DP
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Alexey Charkov <alchark@flipper.net>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Yury Smirnov <yurymonzon@gmail.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_034120_460983_96BCB571 
X-CRM114-Status: UNSURE (   6.77  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 20:40, Sebastian Reichel wrote:
> This (final) cleanup part depends on new DWC3 glue driver series
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588,
FUSB302) on v7.4-rc3, with dwc3 glue v19 and dw-dp v12, and with
mode-switch + orientation-switch on usbdp_phy0:

- RTL8156 2.5G USB NIC: 5 Gbps in both orientations, also across
   flips while plugged in.
- Apple USB-C Digital AV Multiport adapter (A2119, pin assignment D):
   DP on 2 lanes plus USB 3 at the same time. 1080p60 on a small HDMI
   monitor and 3440x1440@50 on a Dell U3415W (its HDMI maximum), with a
   SanDisk Extreme Pro at 5 Gbps on the adapter. Works in both
   orientations, and the picture comes back after a flip.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

