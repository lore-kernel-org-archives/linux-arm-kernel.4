Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odj70z5N;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IK5Q+ySv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=; b=odj70z5NDqc6ldcEuklPotoOy8
	K2WqDWWzi8HWhOEOHLT4JH35BVLGZA/K3DOJhpxO0pdNLMs6ncGBUkIj0aG/aHzoO4L/DfAm6faNT
	jsYiJJ6CNINWuyYyNzrp5nGz6p+D/Y+MWFB6cenCnz33Wf/yPct71qlRiQrR28A574xW4PfD49cWq
	TB7kLXCDiYeV8uKtzh4XU5lhcXkdLJnDLuFx9r9IWWUFJJT6/mYkQgbelzCcvyQNos7yhkwWpv/nn
	UOjzeumzz8gBK/SC0c6PjGjPUGJBe+uPSFpEDq0JgtFiXGM3gOL+cHELQPer2Oq7PTVWeARooPUiL
	31vxtJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRHT-00000002wme-1dTN;
	Mon, 23 Nov 2026 10:28:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRHN-00000002wkn-0rNG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:28:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1899350f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795429687; x=1796034487; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=IK5Q+ySvvdq9Fd56tyhug1NVOnrnlmLFe4r5b7OUdG00tZcxU1ueVEW0T5NbaRd6QC
         rE9HbE+JtR6e5S+yRUzbXeAoM/RJ7L4/zQNv9aIS6W9RwGFHIuWKcsEYMmdToD7RY3EZ
         a/P+6IO3SevCsRZjreR6LNqDL6o8umuSVIzkKvTG9URGvdMbKY/1syaczoDICTNKk/33
         ooRJN5J9E8p+/7zjxLS2UNgnpRf4TWfHddrIuNQ8/XzIrvuiKMCtWRCfutGuOe7kOMZq
         PFXWaXUBbjxgB2cgJWkFkaZ+Vgnfy/3O8+R+Bzm1Ogd6soj8jgpH0JXsSiSwe4a67t0N
         HI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429687; x=1796034487;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSV9ZwQQbuEr7tABo+53Rdjj4FxBuFl09OY95TNBjKs=;
        b=OMFcTsk+0TZmIK4K8Y8o50YHP5MsFxBgymiKictonyw7FZlD58iegVTF5ueXoLdaQO
         Q+/yD6gjUDmGWz1oKDAgO+2ut6SwyEQgePWgCxmYTwV6AUnBrZtm26uVDNbg5ebsw7T+
         V6jhL2wFDZB3hiPMOA1rt7MBiMoe+/2KUiGau8wVKiK81g89O8BwLxFEPKLKoQIIdW2O
         Scn505IMkj6cEDIYXlbHZP41zYA+By/B8j3F9j76XoJOvglmZVs0mpxko05re7lv0/bT
         Ef6PUMipqC440ESwdR366JifNguWFOK8lG1/HqXz7MMHgDfhgBgh62kTp5jzHMAMUCsb
         S77A==
X-Gm-Message-State: APuU4Z9VkSz8vFpZKYdKbX2jwrnuL893VjudbS1/wRFwD7mT3J0EUiCz
	5xoHgrk/yLyaXnW8Ul0yXdNXMljFZk8ncs4aUptW3oxVC7bUFm4S7Y7YgaN4b9U2cNc=
X-Gm-Gg: AZFdTZep8XThu6ayJ/wQmDstJ14td1I22BJp9dHSgaOji+/abid0V9x9hmPQToRIAsX
	O0kmRlhgM6dw3QHEdV/4sigF8R47w8fM0rahAUnGxnQk3NO5Vn+/d4R6WUr4kSXzUJbVl2foATa
	zArYM2pvbMjYXL3V4xoSOKdqo7evD/tcJwNddp9IQ08krLzMfOtkxjQVYZ+aEYUKB58VOiwHAA3
	gSJhptZJKIQyy4/2nxm/Q+s6O7GlAzBeu9X6PUZB7d4tOT6nOn7grEMt2vIgU/TayvXtzHPYlij
	RBFiRYiLjYUNOGcJTYv0Oc4Or6xbzYDQQwJzz5g/BoT+n/H1T7dOtFnr/FgiAJrr7JJ80s6zU9M
	V1Nc2wvDDi6D2Rc4u9cOc7VfdYSRgml0UbeM7S3BLhkbQ/glcO5dbyBa3qGCH0G3bRrInhc34Ji
	NDNM+d1hYRHJyNsJzjM+4dGMKkOXheudWsr57KSkkOTmqXy42WiNpNaZLlUUj/JIsh0kwRu1NIf
	KSRi1wpcAAS2e/Yul/UCRpw9luSj+nvHFIMCC4K9Zu6fMv0HmIphULCJJSyXI42vd/TXAXuhv3l
	OZeC2XeT3AVIA8vx94OJAjlR1fe3TL798GzBcuOGXFDsQou+NrEiW5cu6E3hvYUQ9j6TuQxobz9
	bwbKv2g0C
X-Received: by 2002:a05:6000:29ce:b0:4aa:6e52:23a9 with SMTP id ffacd0b85a97d-4abb0e46a60mr14731002f8f.15.1795429687181;
        Mon, 23 Nov 2026 02:28:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:121b:474b:8d1f:a239? ([2a01:e0a:106d:1080:121b:474b:8d1f:a239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm21617870f8f.44.2026.11.23.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:28:06 -0800 (PST)
Message-ID: <5f61fd6f-309f-4e8c-9df1-3c532a79cd4c@linaro.org>
Date: Mon, 23 Nov 2026 11:28:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: amlogic: a4: fix pinctrl node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
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
In-Reply-To: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_022809_280958_54894E28 
X-CRM114-Status: GOOD (  12.85  )
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

On 11/23/26 09:24, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Fix incorrect pinctrl device reference when adding GPIO to pinctrl device.
> 
> Fixes: e9bb91734871 ("arm64: dts: amlogic: a4: add pinctrl node")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Fix A4 pinctrl node.
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index fce45933fa28..6587e3578f8d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -218,7 +218,7 @@ gpioao: gpio@4 {
>   			reg-names = "gpio", "mux";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
>   		};
>   
>   		test_n: gpio@44 {
> @@ -226,7 +226,7 @@ test_n: gpio@44 {
>   			reg-names = "gpio";
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>   		};
>   	};
>   
> 
> ---
> base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
> change-id: 20260128-fix-a4-pinctl-node-6d7f9c29b32a
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

