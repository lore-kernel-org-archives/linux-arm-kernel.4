Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B02606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZfvhC8B1;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=Rzg/DfYh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=; b=ZfvhC8B1zNgb4S
	1muvLxHW7riRa1sfTnPoiyRJWrv7gII14HVn0H3X3ZrbNlNRNpeD++2qMcCBb4HyWn6QosAOua4DV
	KMtPefZWPgA2exgzjUScNLbhaQVySZSrG1Eg9YR1JDIKdJOUNwZdXQRqzk7TorAMpOr3cPyTwe4yB
	2YXk+emeRTryvoqYBBHS9taX6lwfkGAPhwgc0L5IWa8xk8/ysiaR7u9Evu4XEuKuCVs+fcA2MCiNW
	Fw7PngT9VToBWHl8SgNN/aicXPbFFqwJ66hJ/7uVfg6k3tXR5gM/7PhtArVcENQpyxZhvHwqrxJQf
	iC8isEcD+HQX9XVe2fDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjXr-0000000H7iY-1ho4;
	Sat, 21 Nov 2026 11:46:15 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjXn-0000000H7gy-3slG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:46:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2721738a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 03:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261570; x=1795866370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
        b=Rzg/DfYhZpx397nB4DF6r2rXo4z5KamGE6WNrPMh4mHNhE2duIY/vDJgzDbaJOlnAZ
         NKmXMcNX1saba4fFI/oGkIpyj4L/F2q2kViuWQgs3LXy1AQe4hUqnJRMcAKgQM12BKxN
         OcFmUNBbIIOE6yTsYt4zAXeIHI2zGykpr6fJpAtfgtxdUrWp4dn1nARja7pfeKIXVbJX
         MZqUWDgL6iFktV4CQCyEixEBxur8nLtCJTPEd/QWoL3daScZVaSCuO1Di3l17qxYXwew
         fjhIoebmhh1WTe4Xxa2ZZx/rkm2rcaCj44CPnpw2IxldKyfdkiapFFEY8AZE2IuTHPz7
         mvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261570; x=1795866370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
        b=llDk8KIEKs1LWrVZFEJPhLbvqnpSCcsIxbjiBAL6/kDmrGZY6Rmukc1wxN7JzXZ2yX
         MUJgid0b7AFdBfTOUC5JjvTqxaMofuCXDDxFSyEhNAtM3Wk8kWX8WnvqVqtG1yG4KhJg
         kb9/VEmfe+LN5IE6RplxSSp+qT7Rfxl30OtccbJg3ieWnND6nUOtA8jLbMN1b1Re9w/D
         3eIYl42OPftLKu48t3hK024UdnwvSRuGPT0lnrPXbEtDIC+32c4t3iVYYry5BOznZeSx
         gu/mqZqg8g2dNQBAXEVNkbDV+4SL0tVR3LEwJzWRI2Xl9ncUkNf6rcu7YRnbjjz/q0lf
         fS/A==
X-Forwarded-Encrypted: i=1; AL+hErE/JGrFeUpDh9i6Hzf7DjRJgp60qfummZc3QrT+RoA1TVtphkYmQBCl8eQT4SdlVxGS1U1v34+uXWu6oaSFOz41@lists.infradead.org
X-Gm-Message-State: APuU4Z+sNaCJ8no+Z/fRHbjs00SbYmTdq9EZl839ZijUfAa1KbdNtmEd
	zbdIzGw2GCVe71YarJMVW1Y4/eulmc7mjtvC/78HWoLhVOjqudRt9w8oEj1D5tcs6Q==
X-Gm-Gg: AZFdTZeuj0fW77O4Q0dF/CflkM/yt/LZjQqBjupc2baC+tM3rf1xZ5W4Zl0R4WRVDoY
	nCj45gOZuIAFuAdycryfldSoFMnJp1Jo25h+dNixA83g8MtoIJ2A1E2tsC5PB92pItYt3yzSo5+
	VK8xKwoDLDv/UqgHfhlSZna7YKxTaIbt9H5SkNwQMyYaF70I41B/Yn8fiNd20bH8iLJ6DOKbLcX
	wQGMTbuTdjBRUsMNdw++xEQC199R11csAQ6JpUa9g4VDxQ8RDeHqjcNs7aJVHpFcn6iVslyqXG/
	Ot0qHFuuQi334tn77g9H6q9lyLL2JfXsbP1/UPPLqKi4ZI5c31+8eM1R+I9cJRLcZ9MYRB4oSdT
	9F814xUkNGsYVN2edHSaGcUNTDqkXdcgohzpgDgiEik+CR0JK9aXjubhA/zWRTvRQvA+U106hI4
	OqgXfZ1L7x1dEgCcApc33+KjblO5bzEd+G+hpOj3qC+2VmKlDjI8DQ4+euGYRVfyaYhd5nE9muu
	pRUeDCcHjHACRWi7e0CXbeAaAHSsAIHrTNWNC6pifTThOoHeQY4lJmvusaCQ78AAi4OAUeebvhY
	xfU31U5YgZBQZduWREZkBh7alT7TU2EiVmLUkiq1KxvgXjbrvhdpfuKq8y+vdpALxqGxaruTedr
	KXf9Ipg5poV1EFkKGUTfIZbEX0Vs2q/v2p7ppHQ/CAQUdjVqy1xdORjFTghzaFYlolVnmwYFHTT
	NP
X-Received: by 2002:a05:6402:134a:b0:6b9:c43e:19fb with SMTP id 4fb4d7f45d1cf-6ba37d632e0mr3291804a12.25.1795261570200;
        Sat, 21 Nov 2026 03:46:10 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm173298a12.30.2026.11.21.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:46:08 -0800 (PST)
Message-ID: <9e4c3ed3-812c-4ad4-aab8-b1a783cec95e@pardini.net>
Date: Sat, 21 Nov 2026 12:46:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/23] Synopsys DisplayPort Controller improvements
 for Rockchip platforms
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Yury Smirnov <yurymonzon@gmail.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_034611_994143_974EFACE 
X-CRM114-Status: UNSURE (   9.00  )
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

On 14/11/2026 06:00, Sebastian Reichel wrote:
> This patch series updates the Synopsys Designware DisplayPort bridge
> together with the only existing user: The Rockchip RK3576/RK3588:
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588) on
v7.4-rc3 (it needs 941e3acfb358 from linux-next to apply there):

- dp1, full-size DP: Dell U3415W at 3440x1440.
- dp0, DP alt mode through usbdp_phy0 + FUSB302 with an Apple USB-C
   Digital AV Multiport adapter (A2119, pin assignment D, HBR3 x2):
   1080p60 on a small HDMI monitor and 3440x1440@50 on the Dell's HDMI
   input. Works in both orientations, and out-of-band HPD retrains the
   link after a flip. With the adapter plugged in at boot, this also
   needs your "drm/connector: Cache out-of-band hotplug events".
- Audio on both outputs to the Dell's speakers, over S/PDIF
   (spdif_tx2/tx5, simple-audio-card, mclk-fs 512, DAI 1). It also
   needs a clk core workaround I am not sure about: AUPLL's assigned rate
   rounds to the current rate, so the S/PDIF frac notifiers get
   PRE_RATE_CHANGE without POST_RATE_CHANGE and leave the muxes on the
   gated fractional divider; no DMA requests, EIO.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo


