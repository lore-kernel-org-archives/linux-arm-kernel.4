Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B93606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZE1fdgVk;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=amRkfW6m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=; b=ZE1fdgVkg1QQ/ZEGxHkQ7BxgAP
	RREXMIHy+7BSYloRPW/X4xUU4TJNIQnxodz4ua6ls6y6OzmY7y+/37zNajv+xA0gOp74Khf0GCmek
	UgEZIB3nIk5jWMnW3qvzSZDaSEvXXh1S4BVnDQygiPudYYaF3d1kgoDpVBBjF70NZ0i5EdBe47Wja
	WTpH+7Qcy2FByHnqrfAHwH66DdbfCG/FIEKMrBpja3qiFOTWevIW1OX3LqC9d16v/V3BR7nRhJdTW
	ChQhoA3c1yypKs5fn7aNxgnaZHtIg+rkoFwOquavB0zyCmpbvh6yaqgU1I2Gwv0WToLxU0MAAOuWY
	VF04mwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89x-000000091FX-19tT;
	Wed, 25 Nov 2026 08:15:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89Y-0000000913a-3UP4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:14:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so53520455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795594495; x=1796199295; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=;
        b=amRkfW6mBhHowcM1XSnCqpAiOuudZRpQEOtJQ/e13mrKu8Ijl1dp7fqAL+5OyJ0fm0
         +Cp554gxiryPNUX33Ac202vcuit8OSifP7VxdJGipAjnfam6H7pyggtaZ2tW05pk54XZ
         5XesgzkIBNmC2V1PhqYXaPVZb2Xah1f42avHZRZLGaYLp47WuR61IwzrCt4bABlinCa4
         lRfnqc/sDtvS9PQ7RhRF1NeiyDVnyiSi1SEdtqMpnr/sC6m2e85N2z33TKAtj2vV2SV/
         aHs5azNfS7OhQ6burN6SOC9VN6Fsg65Fj/2OE3dfGEt3oTmr/FrFIkDAEFeoqh574Zqs
         LVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594495; x=1796199295;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=;
        b=W1Tdw0s1JVY1oURDTCZ4usyrozrDUUNnHx4VzeD8H9s/OhAMFpbD7kRfgWYsOLZTLv
         U34jMGejKeCXbAluGus0deJSnXjDy0kjHAjUcQsNAZnhqif5wys+YYO7DPt3bD4q1BYz
         1wyx2e2PiH490/6057Co38kn0rFd53ca6g2eibZLRmZbzyPlxUKycnDuSSgEdObJLEeM
         cY+Jicc20m/5yoEKxIXafjVWnp8UaMS4wkLNfjs3f2ywX/7ouNBrChis3CICwDimsEkU
         gcI2BxzHIKpFeZnYMGlLOfXE8bshd56lVkLqybrMVJyD9njdA+25ElKPYuYud1OL+ZO1
         AIpg==
X-Forwarded-Encrypted: i=1; AL+hErEUJazKCyKfzJFxyZuD0Z3t89QUkaucqxRZvxdLFSmDp/tEUyKpUTUYd1r0ieiRfJdrfflV5L9Zwy3qgQAqpOPb@lists.infradead.org
X-Gm-Message-State: APuU4Z8bejePhai7MPl7ZpMkGz04Fzs1x43sFIXv3ZvQM/2nXGv5y80I
	hOpZQg/8KakZy5IwA/b7BHrRu3kcOlWQU74DMKdGvIgOIkQdGp+cRNzklGS5DX6SqCA=
X-Gm-Gg: AZFdTZepvubYSEs9UESlWzAXvjS0T0dkdZhvJ/ufZ2x34vH4ispAutRVHfRPlTIqvo8
	DNv7dm1NA3T4tjthADNBYR00JUWDLy7gpG7/4BzGLZJc81dGhcg57apb459M9Ok+PW6l82yaHDc
	yaxy/OIBkf0aPxnCpbnDIRBpX2DHERRqhRkrHQYUIHg6WotKl9ZUD4Y396A2RZqlZvM01h+BTNn
	T9k4upm4tcHLgDD0E1VvbNWFDB5/MfqkG8MsQJm+gx8f0AAro0OlZlV9L0qhSEVbz58kdJ6FChH
	1W9DiGl0G1waxiQM91lSOcx9d3n9oIXaJQ42WpKClIFhGi1TWkHY7ea2Hi3MY//PxtMqONeUqAB
	wnaK/1MvAG2IElbOs6ZFKdHqK2HEh5txpJNPNXJjreNbF50I+JGiK2+rkmN0VU0v6fc9fq05fav
	bVOxe6qyPHbc/qeRc+ocOaF5yCC6eZ/KczsMOXdcrCk0r8WYawEKZFpshysdbbBPFQKQsXUdUdg
	wgTMRF5BFz4J6cvwHSwinDwEnl9Qawma3JUqIV7RDP/MbknfgI0+mo3U73QPKR0FfM0HfjQwt2G
	RdSvjo6Jrxf1uIWh76CRJRYF7qctwLHO5KkNOcoCFnOUkY2gd0RJ77xh2KnlufXiz66UE5+fZYK
	uD7XAWvIs
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr372318965e9.7.1795594494562;
        Wed, 25 Nov 2026 00:14:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba3d3679bsm26993885e9.2.2026.11.25.00.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:14:54 -0800 (PST)
Message-ID: <6e408f48-17ca-4927-ae09-c4153e294371@linaro.org>
Date: Wed, 25 Nov 2026 09:14:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel-dev@aliel.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
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
In-Reply-To: <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_001456_919896_8FBB7A6A 
X-CRM114-Status: GOOD (  20.07  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 23:05, Martin Blumenstingl wrote:
> Hi Ronald, Hi Neil,
> 
> first of all: thanks Ronald for picking this up!
> I like the overall approach. Before I dive deep into this series I
> will finish the code-review of Valerio's AUDIN series.
> 
> Two quick notes below.
> 
> On Mon, Nov 23, 2026 at 8:38 PM Ronald Claveau via B4 Relay
> <devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
> [...]
>> Overview of the series:
>> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>>    add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>>    "hdmi-phy" child node under the HHI syscon.
> It's been a long time, but I think we've been asked by the devicetree
> maintainers to have reg properties for the nodes within &hhi
> But I can't find the message at the moment.

The hhi syscon nodes doesn't have #[address|size]-cells and so far it
wasn't required, let's wait for a review from DT maintainers, I'm fine
with the current design

> 
>> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>>    PHY configuration ops, along with the temporary legacy creation
>>    helper.
> At quick glance your PHY approach would also fit phy-meson8-hdmi-tx.c
> There seem to be minor differences:
> - two additional enable bits in HHI_HDMI_PHY_CNTL1 on GXBB and newer:
> HDMI_FIFO_ENABLE=BIT(2) and  HDMI_FIFO_WR_ENALBE=BIT(3)
> - newer SoCs seem to have HHI_HDMI_PHY_CNTL3..5
> 
> Meson8/8b/8m2 HDMI support is not upstream yet. That's why those SoC's
> won't need the backwards compatibility code. So if you need to tweak
> the driver: feel free, there's not much you can break!
> 
> 
> Best regards,
> Martin

Thanks,
Neil

