Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA836606EEA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W3wibKGu;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UhZdcFQL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=; b=W3wibKGuCSj7m8qkoXbFbUluJy
	Xwl4+SQedf8TktVGwzMoagEk9/rZOsT1gCf6VtBRx4RKZHqYT5TDEcUjpLuH6EbcwkuXlt92H59UB
	A43Bi+DKUfK2Ov7JFyNL40FWRh8Cl3oS4bge9IRNj7oH+ZxR2kAAkptPyba9TqDKBMH+fXhhOHfVk
	CO4C/96MJZlYjqEEJXG5rxRVfEAVy3wle2E3yOZ9HjMkGLvDtFVHNBsJHsxccb+AlpDmLT8P07Lym
	yxvGMDN259IWFOakzVSCL2X/0lmB5fmyyRbHVxZilnTv4xe57x9PckxETlidEFci1nRdlu7WCPRTc
	KZEaF8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKzT-000000006lq-1Yx6;
	Mon, 09 Nov 2026 08:44:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKzL-000000006im-0iPv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:44:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so345925f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794213865; x=1794818665; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
        b=UhZdcFQLGu84G6p0KCpY5JdxJchWguBz+wADvDPjW5cfNfPH+6nUdhdGFzYoZYIJGD
         fNUbr+Oy/AbhuVafiCeyvPOW1XeBtSMCVItSUK19Whz4ya28USQF2IRgUUczqy9F8AYO
         Ao1GRuW0Cc2zV3d0FOgNSxnTPLDbtLlj9rMeMKzXnWiunk4OnZW3xjAt4kbG36zgljBP
         jdo8GJzRGp/LrPk/iXQd8w4wWg9B68diaTSytTpu723izOuihYobGuJAN2F9ho6JJ8a1
         ieK755dIDbpV4Jm58OV5yrxoNykV+0v+I3ElgfW5iB3fEu202yf3I0VYY0SSYvujx5X2
         InZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213865; x=1794818665;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
        b=nXvKhzd/qovtCxaZaxP3S33F8YE2uagr9F2bTFY754ihGsNvWww65fV5jtBySYI1XV
         9RsgDzXaGYSQjdm8vo9RKHYJTVw+MjbdEjuctw1zUPF8WI1ANx+z7GHPFj59yuVLoUds
         Ns15VGiwSNO/Kspwy9uGB4ntRLSfU1G3NRrdWyUVpDhJSUpg3/+hR8RPAsCQCmbSY+2a
         LNcH+XgWSzqaRHZozLwdKPIaUlhR/BNkumWJvlQa3qUEAe7O/PRtD7xnAM4rlnf4Lnpz
         Ppx9IeTYe3guWsPws8WwHIO8Teaq9AB8CLqPGJyyoMiLFCocW+YwR67eK/qg07GIlLNm
         pLcw==
X-Forwarded-Encrypted: i=1; AL+hErETpctozXf4llFH2zFS3IfEUFwzuTJExFE6zXExitQ4S8/1zDVLJDky3zVYh4Ws+4SCigwuC5BZnpZvgbauOmex@lists.infradead.org
X-Gm-Message-State: APuU4Z+TwaH+DFJpr2iQBcF8caxldL8reHNJ9rmAdHTdZaReKNqpTTlU
	5aXkb0PQh5HRN5v9bWPF5GDiOoLyCWnBQz8Siersm6m7E/5xKu7/bO4iKsnBisoCKrc=
X-Gm-Gg: AYBFou0VUv+U0CaBcNqyMBUGMHrxshXajirDPPGbfyy2j7RF2WINI1S6YHWvjVvgBE1
	im8VN+CMXka1As0XwXgqPpEwzNHy9sGED+aL27gBGorfFMviNo+GFpJ2NigQc8YJ77RRJEblzY9
	o27u7fHbNB4hh2BoHYdsXRFY+g8NRYTpiJy6QEauKpI7tpT7oIP4In4BCz4g7q4B2PLgarfk6h/
	PfOWjn+bTp02BhQ994/ARFMMtsgvBZX9N3MjMZgPkgt9rz7DCfvfYwDi0ejGbUOS5RnF0LhZDU/
	2tJPNKfvcobFNM5nHsifS0GIKoyrqDB6ev6i42hsAsXx5S+GYz2As0J4IhYAoDmxVN2hhYT6vSV
	sgGxA+7y1boPUdHWh198fxX8W+6+TvCGAXsNZV2x5kp1B+fULYBTV0/6MCxzj57D+DIepzTaaKU
	j4nTK0WyypAefKlZlpvvypGCU5r/eD/gxxuBwcTmy1DDEaseJv2ujI9UnASc5H2FuAklu1xddG0
	iWsZQe+Uir6sYw72ecHJhoIPP3Z2Ud0SFqKremXjkEvudL4ca95v4WU7B//+SbbN5kb4tTzpxkO
	bdDLJbGRvDODnv4l79WWI79R8OV9kNcmjLWNK2xFnkGTzFz+6sGdUJ3sYDyovJhKrlkckninsyZ
	JV9Ewdl8=
X-Received: by 2002:a05:6000:4287:b0:490:369b:f50e with SMTP id ffacd0b85a97d-49582e8e536mr6741411f8f.19.1794213864879;
        Mon, 09 Nov 2026 00:44:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4974b7645cesm1840521f8f.32.2026.11.09.00.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:44:24 -0800 (PST)
Message-ID: <14a650ed-e409-402d-b278-5af4c6c0d6dd@linaro.org>
Date: Mon, 9 Nov 2026 09:44:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: mark the Ethernet
 PHY as a wakeup source
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
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
In-Reply-To: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004430_434205_2D294EB6 
X-CRM114-Status: GOOD (  22.13  )
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

On 11/9/26 01:57, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The RTL8211F interrupt is wired to GPIOZ_14 and described in the PHY
> node, but the node does not declare that it can wake the board. Without
> wakeup-source the Realtek driver does not make the PHY wakeup capable,
> so phylink leaves Wake-on-LAN to the MAC, and a magic packet does not
> wake the board from s2idle.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ODROID-HC4 with Linux 7.4-rc1 and the U-Boot and .config of
> Armbian: s2idle, Wake-on-LAN set with ethtool after the link is up. With
> this change a magic packet woke the board 5 of 5 times, in 8 s, with
> pm_wakeup_irq pointing at the PHY. Without it, 0 of 2: the RTC alarm
> woke the board.
> 
> The test DTB had two other changes: the RTC alarm interrupt [1] and PCIe
> disabled. With PCIe enabled the board did not resume 2 of 2. In the one
> console capture resume starts when the packet is sent, then a hard LOCKUP
> and a panic follow while pci_pm_resume_noirq() of the root port runs;
> pci-meson has no system PM. So on the HC4 with its stock DT this property
> alone does not give working Wake-on-LAN yet.
> 
> Not tested on ODROID-C4, which shares this node.
> 
> [1] https://lore.kernel.org/r/20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index e6f02d738a21..9a4684dfbde3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -277,6 +277,7 @@ external_phy: ethernet-phy@0 {
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
>   		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
> +		wakeup-source;
>   	};
>   };
>   
> 
> ---
> base-commit: 81e55899e134541583a4e611ff750e1868671c67
> change-id: 20261109-hc4-phy-wakeup-9c15ebaa311e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

