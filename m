Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1657F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uliZHY6v;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cTPsy6oN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=; b=uliZHY6vGOF1HkGcNqT4WNzOQn
	00x9sjU2JJ52+ug+6qykCekNU2t16q1KAsbFDSNt1CSRJvPdmVmvASZKK0kODPrcgObdLeoa62/WK
	/D7El4kv0Ko5R5PkqhLmUcP7Dq8KsqLRnAwe+ERQfCrcg3vGNkr4poAufXCPWUZd2TpS/pqtAxCGr
	5dyBH+gz4V2YW85YrShqByasfkrg5EAmgkPC+Kkc9TAs+XGsOMAYetSjKLQ8RahijWjxkYpuep8By
	Yuaep2ccq2GgtZG9Djp04jTg/Db5dlB6xlaoTQHPE2n8o64X/HS/VUQkceifDyCh8L16iwFMJR5Ih
	WGnJFftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStR7-00000001r77-1tRG;
	Mon, 16 Nov 2026 09:55:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStR4-00000001r6C-2Yp6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:55:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4922523d1afso1591831f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794822936; x=1795427736; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
        b=cTPsy6oNpCzWux9rzKrxYybE0e+ifIPxSRYx48VaXJ3IN/p90lCFQnVwJowbiRHJ2s
         sr5moQKEbLp+/Bpdp0CrEOnTHo8rsMOW27GtFnHhRYiRd8JxwFaNcWbbdLZlLC51cL3m
         RYwxL+G/e5W0iVYd1YG4+xmp3UnEBkBxkVl7Zjrv51NvpP47SZsBMX2dtB9ruIkxo80o
         jg9SP7KFYtpO1x+/1rMEBf+rRwtc4/EFc4X7cB2QDr9Ib/GfGDVD3wGvzFVJZe4avsr8
         3VfyOHOmpcl+ipJ8Zyzcr0UYVDj12ggmK8Cd7JI5SzzpkNGvpCaI1U9hNqiDrA5OpaEd
         l/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822936; x=1795427736;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
        b=HvcRmDvbujjTR4fr4OmtWzWlVw9IJOKPBlb7c6+uQm+/TPHp4VxPZ71zwP7nSHVEQL
         aHmHQFYU0eBs8WpqqUlfZOHRQBtZb1E+5iY+UMwa/cZR7i1dvYDLiA9xRJQ9rqtbX1BM
         AoLGlDyQy9XimqJUhTk0v1ILeqOFPoOh+aVZox2e4OzQY3+5AWVburk9ciBKGM1en4zy
         WFPE/pTIwV/l9QTXl+Hq1K+APe7kgAiZgQQer146jCuK/iKl/LpOMIbtLOeg7ECFKkH1
         oARaPOp+gfenL3kcCOsMnQyPdyRWjA/b2dyiNrwnsY9EQ9xA3hPtFNdR9g9qrIzvtxyl
         BqmQ==
X-Gm-Message-State: APuU4Z+1b76KUv8+S6xHS553QivqMKfkvj3+PvxqFE4/AOROFhDKOvVA
	wSirwEUixaQXdn8MwCd8H1sJ4MTzVvlq+FAeurnJqGiHqEdg5uSqh6PCWX90ChEwsFI=
X-Gm-Gg: AZFdTZff1P+C8HkhOdzPHUa+3tJCmesw4T1ww20GBn1JxI8cMJI3ZBuClMRK435Fd3J
	4i1ZeSYu2/w3sJc9lKGeEYShOdvODZsVpdXDdLLM8wD5cGgiBoJcK0sQraVoTVScip3h5e5PMMD
	wYqD4Typ0mHMP1afTgfi7fYrprYvcJG/D1qPk1ouC0kG1Dvt6bjO/19njJduXGpOhQeJ8cs0s4d
	MjCXYteJWX1vI12Fk/LEL7ZnY42dKib5UpKCP6zq0RwTrs7Z7sXQ1XNmFYJtxMvD81PnNqiqiou
	s8JcdsJUM6BExo9bts95cXdJHH7jPCR0yUoDpriICzCj3NH4UcAxCr/PAXxw7uBxqrJXc2k+GW1
	BkRpVC4z+7BMwpzDNO6p1qeqXimCDC6YGpssm1H37pZaJJRu/NiiRhx3cHDkrndWvwLgR5j19cZ
	kxN6eVIhP+/06xnIa2iq7vYMrWSxTLiYSWdMgwJDYqfWHUP7iHTwOq/Xcophr4woKw0AYPYll35
	j5xaNpto7yTkO2jr87g92K2nUg40mxd6AMHcOroAPJUondRB9x7QSoUia+sRDnc1CnrCLvCfEcY
	/qnq7TyYs8i/tXNGG2X//fFAxq3KBxIA8Ak16QE26gCJ/qAywLPXSSj8TDba/uFkArp/ALbVIUG
	9Kr9SGq3E
X-Received: by 2002:a05:6000:26cf:b0:492:f6b7:f488 with SMTP id ffacd0b85a97d-49c6fc9dbf5mr23160002f8f.7.1794822936261;
        Mon, 16 Nov 2026 01:55:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm20884339f8f.12.2026.11.16.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:55:35 -0800 (PST)
Message-ID: <19786c13-d3fd-4258-a1d5-2a28a1dccc31@linaro.org>
Date: Mon, 16 Nov 2026 10:55:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/7] arm64: dts: amlogic: Fix dtc warnings with W=1
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
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
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015538_693779_2318D93D 
X-CRM114-Status: GOOD (  11.93  )
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

On 11/15/26 23:29, Ronald Claveau via B4 Relay wrote:
> Building the Amlogic device trees with W=1 CHECK_DTBS=y currently
> produces several dtc warnings, all related to the same pattern:
> 
>    Warning (unit_address_vs_reg): /soc/bus@.../pinctrl@XXXX: node has a
>    unit name, but no reg or ranges property
>    Warning (simple_bus_reg): /soc/bus@.../pinctrl@XXXX: missing or
>    empty reg/ranges property
> 
> The pinctrl nodes use an empty "ranges;" while having a unit address.
> 
> With this series applied, the Amlogic DTBs build without any warning
> with:
> 
>    make ARCH=arm64 W=1 CHECK_DTBS=y amlogic/
> 
> Boot tested on Khadas VIM1 (GXL) and Khadas VIM4 (T7)
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (7):
>        arm64: dts: amlogic: t7: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: a1: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: axg: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: g12: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: gxbb: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: gxl: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: s4: Add ranges to periphs pinctrl node
> 
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi       | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++----
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 2 +-
>   7 files changed, 14 insertions(+), 13 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20261115-fix-amlogic-dt-warnings-7cba2a4eb9d4
> 
> Best regards,
> --
> Ronald Claveau <linux-kernel-dev@aliel.fr>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

