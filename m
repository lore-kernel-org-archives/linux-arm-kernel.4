Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E696606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LG9c7lk7;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kvJGMwdE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=; b=LG9c7lk7Z1jZJ9RA1eyZSU67g5
	uEcP0l7QGmS7pBPH7gQDVgeiLXopcQQxHrYxKFiFGBP3rYTlorenVeeqw1F1nVTzKGSk26qmZ1Kox
	w8AcjHxki+TU85d5iseRhMwjEcVZVXYj04V2rrW082IDd5NqCwF+97Inf3Su30n4Q7Ljdcp/afbDQ
	DrjJWczV8zZuF3Q+BdCiinUT+QEoSRbboGYnoFzdAGTluC8EvgJ1dOdRrumXdzELDozwHrCw9WhKG
	rK3VWdMG2rDhZQQJcK98vN8Vip8tCzQynwOb0mb65jlnBC/HypH6oKRdu8e/Am/ZoZRlMLF/lZNRu
	UPpHSi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVu-00000001sFr-1lmo;
	Mon, 16 Nov 2026 10:00:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVg-00000001s96-1jIn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:00:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso19114575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823222; x=1795428022; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=kvJGMwdEzbrcYijvZ6vYnDj3zqW/0FptPO/Hqbu43z4tL9BKra5JG7TdTeNS+sBvaw
         p/FQxyI995yC4ZJD0J4AJaAH24OEfTKPAap8DLYbPncKBfbInNuYJ2MpAdHiJo7jZEaf
         oMdjiwfzNd1hE446gJbVV1mpX/ubBbVZ9oHv0q+9ZBphZdX+A5Qw7z8oyl9OigYtOEp1
         JQ8aGJTBOtBcKwElO/TcN1ts2icyOcKL9KEaoSlzaC0o2qdXCZRlJf9uPMYkHAU1Ayj9
         Etj3p9CNmdubIgg75WmeFnGlMHXEAdaifdtFc/AzwwXod69EkTlUh7G8Mj7cek+Yng8Y
         aklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823222; x=1795428022;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=hd6CxBdTmREd1suIyvAwkJrsekkTtGlBIgEAR7Fd/7gHbRErGxdETYwseBQCdFFLR8
         7Ml1WZVC3YwSxPSK2oK/pPpJuzsxZkgiwr904pWTScoTs7GuMGvfFeuU6jiBZi19zY2D
         v4UK+nPK31MTZoKDwwxPa7w0rrHocme3KyUK4Q8BC15T21Q5o1Jt97b3wnM8dOeTjShK
         KtTIQtQBiSXxOHdrDzVqlQpJ7hW4pI9acZAQJPFQkNym9eREYIJZpCYw9mcukaqmfsKK
         TqaI5MzqoWyzwTkjXVululB4wUIMDCxAAbtHQz7Q46OUvbIwWCBqEjrTzYnDnKvYPItv
         DIKg==
X-Gm-Message-State: APuU4Z83GrDq2o139YhSUPQJfU6yugIDjvffv4NhvFCL80D84dNyO35Y
	CQkoC4i56ak2khfS3r7Mg5S7Nv7TG3nHO1ZMIphaF9lbxbgXWWeJ6EOXKycIwYbmhKM=
X-Gm-Gg: AYBFou3S1DJOv0cqJFSIqqE1p+NY7y6EBUAEbaqtI3GIMAnAZxPYky7P/QdL8GarpWw
	RB9li0Y4gnCOwxg9ntA1xW6mairTOshgOls3Q3zf/a4+8KcZZV73kBXjJN1vaj1siotyp27Zj92
	o1PyRGhSmExcsULujUXiHfGW3sTzCDEAzu5vOzv3+3yR4imUz19I797vVw8bq6jInGG2j7WM19w
	IhY/EBAUOXWoYugTci+aSLU4lFMOlQn9SiPWV52bfGnIeGKHcSR4qejZL9C1I8yM79TLXrc+Up/
	f1XYJj/UUCY3GcgXAZVWf0pZQBO2VrWZpMZ98AJ4RLrBvac4ElxyV1+JwSmE2kjiZOI1EcHUpNQ
	ZGUeKCRa8p/xoE5tNRywxCeExK6e0uGZxle99VauNRj+z9+dCumhwM1Kv/1taIkeS2fSA2tCd6l
	WSfDQQblccDftjQj4/RW65Ev5UKMpacaVDbqqhR7kcAQSyM1QyKVGDfXgiBUb8RpTQWuuQafaTn
	wl/On543XmS1OX/EXRLDsm5jgLJ7W4RNJte5i+O4o/SsnWHeEZLVCIUMT223nP9pLmp5GCUC04F
	yU663wrHzQGx40XlUdCQ6UuDegaeTzeeT/GTgwwFy6Pi854g4I4YJ4WtKxN8nAZiAuD8jbbr2YO
	FuVG92CHB
X-Received: by 2002:a05:600c:a012:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb55a907cfmr204744635e9.31.1794823221901;
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm282702355e9.9.2026.11.16.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Message-ID: <0498194e-6428-4424-82b6-c6e52ba25adb@linaro.org>
Date: Mon, 16 Nov 2026 11:00:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
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
 <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020024_783883_29502478 
X-CRM114-Status: GOOD (  13.11  )
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

On 10/22/26 07:27, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
> table to load video firmware.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index ab9751a59b55..887caa5c625d 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
>   		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>   		CMD(SM_A1_PWRC_SET,		0x82000093),
>   		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
>   		{ /* sentinel */ },
>   	},
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

