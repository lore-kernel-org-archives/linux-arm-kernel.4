Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CF3606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FKcUpXTf;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S78Vco0Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=; b=FKcUpXTffvXCETDYZRct3vDBj5
	aZ33dUNcEcP3Vqi7oL9FycKrK2IaheinCTbzXURetCgRa3c5+epxldIRKLQaK/x5n+3qnnJii0yDi
	z+Aqlm+UZ2xNQ/gkYMuDsf3cXEic4quHHewQva/K01Eohvyrx0B4Lva5sGtXtMjPGDKzleqpm+PsD
	QfggOyiWIwKVo5SUPGRHyv+orGxFs1BKtPNTSiguANhKlwZcQimjwNEUPjt77SwxDfUoaBliZVdln
	r1FPt58IuyxX6K3nwPngIcq+FuRgIQv6ccgUElUzCGeeNrPDFNQuhpZNvpvDYiF1zR6IHqDe7UaP6
	IRr8ATcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVm-00000001sBy-0v0W;
	Mon, 16 Nov 2026 10:00:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVY-00000001s5h-2N1L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:00:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so23012685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823214; x=1795428014; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=S78Vco0YSIKfCt9VKHH0iq98gXaE2zrQYvGUSavcngfrC32b/DM7eMQKAo57LeUSwD
         OzT/mUb1f2B0q0pDgD4E0VLq/7/eorFCyidGGQslMHTB/yNvSXu40UcyMjOtlJD1fEs9
         SNMQ0oqU0bYqY1Ycm9oLoBYRA98fyscOEHzr/qyNtldrE56MN84c4nnzX8T5zyBMfacB
         tYaVx5JEf2WO0lk61U3GZwdaescSdOJEO1fNzKWlduFAKisOjMWKEoGpfRh9zFR1iZCp
         xDvAlYqGBWo9MjDXGK2lntVLbAnBB1HGLnmjn0BCnLoKrOep4FlaL7BXo5s5axnHiXU2
         bLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823214; x=1795428014;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=iujWYSmE+eGG5RPEX+rfH42HbeB8bmrtMezynSR98iRcKSNfC/ozR/cL5Z25o6sz3Y
         94aJ7UZ11CZjhq92TdEqfGFvaTuKfuM2C5fSuFmUwuQ4M/pMIkcIka/OUvWTkPD3oKv6
         V3zXBBSf+mlbf9cGZuALEaZdKFlEAwQMi4td5jl9K1Q+oORnKaxuD2T8AFzGmJtxP0XR
         8IKsBY94YQut2ZG6suVH22PY9dVw6e9h3hAJKqh+kfUktjsb9EjQ2hQhercO4FPYBfvJ
         s59/QDeAV8gIsz0IZCDDm9K9Gy6wAaCfQdhDGHCyB1KmrSaUkRdhz5gNyXo5Rkt5U8Rv
         vXkw==
X-Gm-Message-State: APuU4Z+bUn1I0vMpExM//ZrhKnfZKjrWigOa+Wk8Krv6bgl/o2e2UV6V
	O5gSi3WciumaLYuiPutjwtEbCB5fVQFwFmieHp6j8sUyW1PNtuUKFbK7SAO0twaK2vs=
X-Gm-Gg: AYBFou3cGPwHiRc53gquLlYg31e9mMrfExu/Pp4DJe9oi9iceVtHrn+Rrkd7SqC2+wX
	yiW+MhoE8lVZKnfkpfQFrg2TwHrSHs0s8seYAx/5pagcffJZXBZxgrx4kmGO3dJnUyTg8eLyDF7
	+VeIaxCMFHED/tCFVc4z67ebVfcV7JVwcCmHWnIVjTqNLIjHFjhE2s6C1M2sP9/8LrIGIcVhQDW
	Vd4SemN3WEjexvP3rB+QZQLz9PtcDQDgGh4tCtmPWj7hHr8nkttd6NvwIjfiphr1yv3R9GUEV47
	vGryFfF7f6rUrepJySuLTZUH8QlIfsPy92LKsgKMeOPedUtzdbZ+EXGoXFsK8k+MrB5bQ7T5RIk
	KKixiOnjiFNTt2lcVnjJmGWG2h0lQk1CR7G/I77InjqMWE5VIgePrYri/hDHtdUopm3X6PrubxE
	yHStz0YA9pfu00MysAPP/3LKZxvfZIW9Tokks2bhVh/zNVSECFbSvxOs/xUsdL+BDsB4t77LDpL
	rYt+R4MlBcNFlCtTXKAaY6kLa4T6uxhhBLCBouGksCNtL9oDbg5frPFiwUg9D/F9jkOuOq/g7IG
	vAQo0AniKCEBs12rfDf5iJhO9KtbSZjCBXylD7wyKUVTiMNr7tLKD9JtLuEpDfUDEQh0EARFPKd
	KllkVuvUP
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr218070545e9.4.1794823213643;
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm375110715e9.6.2026.11.16.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Message-ID: <c458eba8-553e-4c5d-a280-918bec25b041@linaro.org>
Date: Mon, 16 Nov 2026 11:00:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: zhentao.guo@amlogic.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020016_618360_3263E577 
X-CRM114-Status: GOOD (  12.46  )
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

On 10/22/26 07:26, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW to the secure monitor command enum
> to allow decoder drivers to load firmware through the meson_sm
> interface.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   include/linux/firmware/meson/meson_sm.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 3ebc2bd9a976..3b90b49d0552 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>   	SM_THERMAL_CALIB_READ,
>   	SM_A1_PWRC_SET,
>   	SM_A1_PWRC_GET,
> +	SM_LOAD_VIDEO_FW,
>   };
>   
>   struct meson_sm_firmware;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

