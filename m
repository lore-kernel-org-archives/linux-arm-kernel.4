Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB26606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YI5yeev4;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2r2Wi12
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=; b=YI5yeev45WNSMA8msJ4o2HVC+r
	9S7yjZSIg1dVbbKKRNQGyUlI35WMo4PH6xsf2pvQQcW4eXFCeVWGr43BU0qbv9olU9eWBnRRZwWYG
	ErEK3/a4/BMCykv3IQlAb2cR2NY02rxST+QhlMv5G3XPXhgya7rJW1oT1Pcx1DizsXiQtKL6empEU
	hp7LiD0OqN7GQALVws9AfbBogyI4YdZ5CIZf6eE6oAzMen6SMDrD5d2xIVFvYOYpETfKpiuAkMtIt
	6vdIlCcvfFQyO6l4vKZpraytzQC8ODThYHNYioXjtRK96Ync8qaAGOnHVeByXGL3ARCi5D5GmEBJb
	ZkYsRusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStQ7-00000001qua-0kvG;
	Mon, 16 Nov 2026 09:54:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStQ5-00000001qtU-39RR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:54:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-491971ac844so2841948f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794822875; x=1795427675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=L2r2Wi12kRZTHZ/xWFnV/G/6a64mNFQljNqE07vIvrsT2wLEfbpr9I7Fz47ARWN8Ab
         lxxMLSKhJkKGWtcwXMqf8rBWqlylK2/buU1J8eYRlzhjEg7ShC2RFL9/2rcIV9zHbXYc
         ui26CfGdT1ICfNF3Kfsl4w1HtcRNVVXF+h1AQ+gfBKxfpX1REQxKy4+pb5hPcH7fWH6Z
         Wn+pIVZI77pL+Nu3SCoGgbOquV+R5IfSO7Zmb2hODrJ83ThKNnGpKsDyQ7WcpgAfdd8C
         2Oo9Iit9klG5/kjEzopigPomDEYsH8IjAConPolfVMGnd8L/1851/3JLFQRBpWuveYO8
         ljFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822875; x=1795427675;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=1ZFg9PNyL3iazUmrkFJsJ8VLJvb6DVloyFXTcP+FPNtJBCCB4qracXIDG2ytua8cpg
         pKTVViN9Ry0VN2sPjFydp1KtI8Pt2OhLallRNeH+qg2mtZOvku5cIjQt/YW0Nwbcvkja
         a0/cOWajjd6Yt6W/CHCMuNeY8AU7Z7WCFNcBiipeXsgjMLKkPSC5NR8rANza83sRQpzs
         IzcLQysNGCvSCporEp0tlPeUGyXqdCE70Fa4iqrTkS/5MTofrFPCrtibHLlnprTZ7GZt
         Ofs8qkB3nmfTzBMn4ckPQ+ZWijwimVPRNhOfBLQJuVY7dUZ1AeK49rjUhu2I8Q0G0vTN
         nNLQ==
X-Gm-Message-State: APuU4Z96bDLZV8o1XAMH6zoF3OFH52qr0mdaIYQSv85tjIjQ9+B9W9mR
	VIvHcacCUlEwAWR+VnhV+alVb3APDOGkSv4fvbJ+Ic9m7K570J677SqQppmTlrr4BfM=
X-Gm-Gg: AZFdTZeNQ4T6WijTDmhMyYTMcnvBHLvwZbf5NbjY09hlmY0YD8qivFXX4brf4ImLgKw
	7MwfKb/4BE7rq8ChUBp3fiYPnseau/sLdd3zKzjmJPhiBbunyVhmwau+3GgACHug9ooClB0c/N4
	JfsTorvLVqfJkeepavAh2kRyapAdNx5f4nMh0ecfh0zF4hDdduW2XH0m4pP5lPfw3MtlhwEPH4H
	C8d01Rj9HTFvcfIF2i92mQWIdvJNExyzhojZJeJlSxnWA5B0hInuVUqIiKBVUwHDkArlK5lZN9W
	F+VLwLQO8YLMZPXxbQw65PIGABg/CSHN8ekXCntpUYAq7/Mf67O0Z9fw9ah2HqGDa6lsw3acVdG
	EM04/c8hkNQY0HCKwEF8y5YGdma1LGGSxuYGAPl0r3n801B/TTe8GzGo1I76XsNAp0NR+6jeNRN
	pJKne6Kq5QBcDZDYbV2s0wC8raBURm35JkK3zY8dPgrCn3PA+kDqYqM+av0X9UZtzqhTW3w65hQ
	z63+vDB/53hqvbboDE8UfPUTTbn1ZL+0PthQ1h1nXHOVYfDl5ZjtZiNGvpR1OopdprUG+B1dz2/
	98z0kBZ1+LAXLbV0OVxszwWwQ4UbRT+YimO1jgeY7+rhG9SMfsEGrFYs3/hvme4zsBwj2dgKz3V
	UoDedpvawqw==
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-49c714a2a99mr14346569f8f.24.1794822874794;
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20221619f8f.37.2026.11.16.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Message-ID: <93587a88-7b6d-4fd7-95d0-f958fc3ce1e8@linaro.org>
Date: Mon, 16 Nov 2026 10:54:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linusw@kernel.org, linux-amlogic@lists.infradead.org,
 linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015437_826025_186F81B3 
X-CRM114-Status: GOOD (  14.82  )
X-Spam-Score: 0.4 (/)
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

On 11/15/26 23:41, Martin Blumenstingl wrote:
> The I2S pin groups are registered without the _pins suffix, but the
> i2s_groups array still references them with the _pins suffix.
> Update the group names so that the I2S pin groups can be referenced.
> 
> Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
> index 3da7f3799c3f..1f58752637a3 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
> @@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
>   };
>   
>   static const char * const i2s_groups[] = {
> -	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
> -	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
> -	"i2s_am_clk_pins", "i2s_out_ch78_pins"
> +	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
> +	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
> +	"i2s_am_clk", "i2s_out_ch78"
>   };
>   
>   static const char * const sd_c_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

