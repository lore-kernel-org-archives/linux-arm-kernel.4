Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2EE60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gq+z+cIS;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XC7+K9EB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=; b=Gq+z+cISFAl1ko2Rt0csTE2DyL
	oqZdtAXgodUaSGtsLqmFPgYpRxv7v8L8D04VSVTL0Fo42aEQ/+sJ9kZmxlB6/5gY1Ti0OXIwL6c4/
	n1K8o3S1KF0uTs13NME/jcC+fmvl0yXXDgSbQ4adEimvtOXin07yrbIsGMagypFxrs2R5GTLlCtr6
	/28FzLTyx2p5dvz6KDegx8rhC8aRGt6SNsWw058bcZnCCkDvWx9ZcUu1XNyMj0cT8lHAfIemXMVnC
	VemieHuLs9GHFQ1FpRcT7UfxFc59uQ7Md7cX4Kq4ZUViS0L0PRfpr+0kBZmt2ufdkRGGzug62NyKC
	o8cR70jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTerw-00000008rc0-1dPM;
	Wed, 18 Nov 2026 12:34:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTert-00000008rap-3FPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:34:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10809905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795005267; x=1795610067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=XC7+K9EBaKh+ccMK0KciS+vGQsu3wQ+5Fimfqj5vStBkSqwEK5FSzwQbtEEPoA/X6E
         1u9Sec2FtDMQQ4UEilthe+IetRaGnBaKF0y345OYzyaY91gGaPd+fvHNkamGmRjshL6D
         04dbnyINZ876d5h4NE0qDDryXDWPd8lepRJG7iR8RTmr75pfmEMs51VgFOYV4AuhMZQB
         ksfmjXlCZzSgM3cvYv0U5QBJdQxnM5wEaf+6NfTzSdP5HmReCznnU+XTlJL1C7CpOBEb
         uFpWMS71DsxZ9qCzX6WkQihoLQeiW7cOAzYalx1ElziWX2sL6MK2zp3Uhxv7Bcmf6R4D
         G+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005267; x=1795610067;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=PAqAH4sF+PVTQ7037Z6bwQAVBybCj75pDQ24EXGYvmRxVbkLNX7wGRaoHbdKUawE8c
         yHC0q8kdwGnv+LLmOjs4yQkm+ktJP+iLSx3QW+QnU3GnWI0b/IfdZ8rgnQbZrtVEXhBK
         w4aTGf8g2oid+8cqFRONey8lo3zQ3OHDqTc5UbiEUBnoowC9vweox6EJPy96wlCB+X7U
         0N+Rqc2/vT2PmhCIWdBQdeNzI6lDl3F+5UelYLgH7OxFZlCnqzin1mEQgolDISsq5UM1
         jc+TKcQCRnVEcKue7CCzubNYN0pMN1D3+ngq+VN8an+AVF1bajxrW09fErZxs+xjZDnl
         5A8A==
X-Forwarded-Encrypted: i=1; AL+hErFYZDnm/5VVqM/Cr1qrZSj1tDWoYWaFgyI/OGplZzUTpxkfhmBtbQZ4w+qbsCgcYf7g+RKbRb9E9M/9VbVmO10Q@lists.infradead.org
X-Gm-Message-State: APuU4Z/oqT3inWLR2QkEyHq3u8WRjw2DzA+LY0nYK3P5pAihROEhQPwC
	N8FUltmx8WYIeQVxe0u1/sYNtPuxOIl6r6+wTv39NMFW3f5keftqSaaQ2xHf2jSXEbM=
X-Gm-Gg: AYBFou18qQXNHKZ0UsxSkcVSVARMkEEaBjnMzogA+3YKX7J4jTjZ2t1Tpeh6VZ8R3T2
	shLJPs9OFsdynB0jtiVuZ63RmXUlpXEquFOY7cB2PZNBUeB2Nesaw0CNJhFaNZrLJOOpL4AGGbN
	GWsNCuTD97P77y9XiEPFe9PyyACxawS6xGVAUk9I3YYAWxRxHa/vpuQ7vg/QEkswf0161iTJW+7
	zoFiF54Xbn48UtEanbaOkuNZKeaXOonX37PPV7pmWycDisbCojeOXzbTYeWYhG3dBxAjA6MjUkM
	mEPjkEazXa28/kJsxNqlkTdg49HNGTPzWUx2hQTLQ8gCm/NEO9GCkmwIcEHhr/ThSJizYwtqJqX
	aRMuZa3d8yS0tc9UI1hXBh2rZgKQuJfCLOFJpu+toCRKnHzaEcvIdxLKr5oRWtAqD8zybh4NIZS
	YqmlJiVPxm90LcI6lHiMZiTQZmaVWGOplU0Z0mTWSUfCtEs6Eb/aD3ZyIZ7VXdbpn7eeEQ/aGL+
	pN6Vb6Ny58MXt4cLYvQm9tlgcrUjkcm0u61DoRMCjXIhroF+sUYbqCkZIVwz77F1CeeJ6H9C1/l
	3lLxBH1TLGt+awyU3sCi2FNDQ1yoB2gyuDupmQLkMyaKDzLUKU5YJnt64AA5MfkKR2+oHSN9ms4
	YKFTvuI+C
X-Received: by 2002:a05:600c:1d06:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb7da25158mr46260185e9.18.1795005266845;
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6ca2:2772:9e53:115b? ([2a01:e0a:106d:1080:6ca2:2772:9e53:115b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57664esm26749835e9.1.2026.11.18.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Message-ID: <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Date: Wed, 18 Nov 2026 13:34:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 05/10] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys and phy-names
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
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
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_043429_858936_5A65EEDE 
X-CRM114-Status: GOOD (  16.97  )
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

On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The HDMI TX PHY now has its own binding and driver. Describe the link
> between the HDMI TX controller and its PHY with a "phys" property
> holding a single phandle, named "hdmi" through "phy-names", and update
> the example accordingly.
> 
> The properties are optional so that existing DT, which do not describe
> the PHY, keep validating; the driver falls back to creating the PHY
> itself in that case.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml        | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index 416fe263ac92..5a033fec21b0 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -108,6 +108,12 @@ properties:
>   
>     sound-name-prefix: true
>   
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: hdmi

I don't think phys-name is necessary here.

Neil

> +
>   required:
>     - compatible
>     - reg
> @@ -136,6 +142,8 @@ examples:
>           power-domains = <&pd_vpu>;
>           #address-cells = <1>;
>           #size-cells = <0>;
> +        phys = <&hdmi_tx_phy>;
> +        phy-names = "hdmi";
>   
>           /* VPU VENC Input */
>           hdmi_tx_venc_port: port@0 {
> 


