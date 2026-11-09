Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38C606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o5MsTJpd;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xzT/1yhG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=; b=o5MsTJpd/knm9ioC3Xr0pMn/kz
	3YmQ35QHyLlKwBZcxRz1XMj976sRScCcScTovxI/jxWb9ShXnmceP/aHjrGMSAL/lNddRYnkWRQxi
	pc3On3SVOADXWgR7IdT+QVyQEp5MPTJXtUtnP5Zg0bGbFBafQIxwmqVLQ5yqplz1fKwFAdcAk//Rz
	Wgc201MCE4cirvzM4ckujRev6zoZ2hkjc4CyF0ufadk1ELdDG7kA/EM/F0jx/7lywX85rQsdJ5AOD
	nwQVlh3CObCqCeOFPWRN0nwN+tDlkb1Q6BglS1MwQDPARhF+8SLYYkK5GmonqTfdLEImeRAHPJDnZ
	rgBT53QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKz8-000000006fa-0S2E;
	Mon, 09 Nov 2026 08:44:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKz5-000000006el-0ALi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:44:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so392658f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794213847; x=1794818647; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=;
        b=xzT/1yhGznFg3Vr96D5GMnt63HAEuIY0rnGrtbZHkKkBGI8VwBOq8nr11FK/I/9ght
         vIzkJmHUs18E3PhQMr7K2t4ch28RdMAmtNFtniWOmsAaJCnqcNWASxjYip97QZSw4BBT
         xBt/MNIlJ++9JgnckICR3LKUXMdBWmJ32Ar3KvZq9xa+9MGmzL8UNLx3G8+dfEuYkfjL
         ja7G4uNzyAYrj8IBG0SgGK777k3L91sFZOYIQfuOgstPtv96B4KolXiUU4E0Tkkr5PLq
         mza3mCok5aETc39IdmHrL/DyJpFzFWuKWg7f+hJtw+N+aD5pSFPBA2LYYC8zdnMjV3cj
         dn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213847; x=1794818647;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=;
        b=Bl2CIOkIf/rcJAieiy39+efWQFDLMQYhWKWjJOyhbLn5yUYeQc07Cq3Ws/a58VFFtu
         4u50VR0ImtzqTNdcZYDHHFnfx/eZBZQDhljd/5MGjYgmXvpJYjddRnfn7hJvHvvdwWJZ
         Staa4Q7ouOaKBGx7PyEXSzVWuhV9ADNhLdQitmRTdxkVVYPaud/klt2plMc+ivHdRlu6
         e4cS3j8+YS+gzhW2DG8LvD6Dwa/iN8Yaq9rOVBecsDtDQgBoQ9mTyUwv432We8kvI9vI
         /35elx6QHODj32teFLwHS1LOGfMnDcwMvtwdzlHz2WCoV8Xsc/OewRjpK9WWEIyMYhCo
         lHMQ==
X-Forwarded-Encrypted: i=1; AL+hErGwsLUUvDov/S1LTT2295+ysrK18pH9faQnx5uTF/UiC7xdP3/ndS3LSSbzyZYuP4n0pSxTh/OR0yA/tUYu+wHT@lists.infradead.org
X-Gm-Message-State: APuU4Z+hhqfTWCRtBv57p5Z6CuwcYJQUnKXtsTXwtY8aVWl2WGh/jqgB
	xE3VvF00Xq5otn+awQtcaJLmtnCwD6AfBUc4YsI/ahNXegkKqcpajVzPCi5r4uOj1kQ=
X-Gm-Gg: AYBFou0nvbxEpIl1+NCeQGlzRDt6aRdZF1hzo4tBfcURAvr8JxVeksuN6lhB2oAmzPE
	GFAnW+v2pKdyc/1tcAKxgWK46w14Iy8s4+GAAwfuqvOFAgj9N3Qq5Hz2W8SUKxJbWf0nOaqdrRx
	kx/r6vGLoRXieTWGRSrr4rCXEQfW8m1y1kKiMk6douTBts38ch2fwbR5y0axRpZDu9eVS/PyBQp
	KXUsRBvoYJxctMyJEj0fGflUa4Bv3sEpIrkmLfMLIZM+L7UwmeL/rReUH/Y47p+D8NbMykq/NzF
	a5o0YXtNT2fVUfu3w6uLRk7QUpR3Y9IhibtEnh4mIkc3Jlw6W2LQFvuG+BgXoQyz5ctImqWzpHs
	CggZ71RbzvLW92y8GKtcSdxM0EM+c/QCJN3fpVEsJp2AKUExrMQX+lsiTwrvi3Mtx2mClkNaqnj
	8/KXmOahHLpFjuZ+GnwJouHxAguQDYXMz/B1kOXB6+OYrtiHbipXI8ih/9V90g5ojzQyy9/kWO+
	Lg7M5Guc9DAHhJ3hC+kmAJpssMaHTfXJrZKmPGLLr6XMT11HfNUk/cy2KjljIgEh9a32DJutpiz
	6Lkd4jxTSYewTi3HiIjDm0LtaprZ//Yg6xammkc145Yj6heJpkRQ12bGCU/FXCvl8f7v1zWYc7+
	Vd7EyzG+KxA==
X-Received: by 2002:a05:6000:2485:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-49582bad522mr8029699f8f.19.1794213847391;
        Mon, 09 Nov 2026 00:44:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f398a4sm8133300f8f.6.2026.11.09.00.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:44:06 -0800 (PST)
Message-ID: <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
Date: Mon, 9 Nov 2026 09:44:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, christian.koever-draxl@student.uibk.ac.at,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
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
In-Reply-To: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004411_130964_895B41A5 
X-CRM114-Status: GOOD (  34.19  )
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

On 11/8/26 22:45, Martin Blumenstingl wrote:
> On Tue, Nov 3, 2026 at 10:46 AM Chuan Liu <chuan.liu@amlogic.com> wrote:
>>
>> Hi Martin,
>>       Thank you for joining this discussion. :)
>>
>> I have re-examined the capabilities provided by pm_opp and cpufreq-dt,
>> and it seems that we may also be able to adapt A9 fairly well based on
>> the amlogic-cpufreq.c here. So we have no objections to the driver
>> implementation in amlogic-cpufreq.c here.
>>
>> I was most worried about before was that cpufreq-dt might not fully
>> handle the complicated clock and supply adjustment logic between
>> multiple clusters, which would have required adding a separate
>> cpufreq_driver. But it now looks like this can be solved by adding the
>> corresponding config_clks() and config_regulators() callbacks in
>> dev_pm_opp_set_config().
> That's great news, indeed!
> 
> [...]
>>> - Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
>>> the CPU clock to XTAL for stable operating during clock changes (which
>>> should go into a cpufreq driver that implements target_intermediate).
>>> There's no secure monitor or firmware involved for CPU clocks.
>>
>> BTW, could we put the CPU clock handling logic in the clock driver like
>> G12A does (though, of course, handling it in the cpufreq driver might
>> minimize the coupling between the clock and cpufreq drivers)? That way
>> we could fully reuse the existing cpufreq-dt?
> Common clock framework maintainers don't want muxes to be programmed
> magically in clock notifiers (which is what G12A and Meson8* do).
> So there's a chance that for new drivers they would just NACK that approach.
> I don't recall the exact reason anymore - but from my perspective
> using a cpufreq driver for this is the cleanest approach (although a
> few lines of code extra).

It would move the soc-specific logic from a soc-specific clk driver
to soc specific cpufreq tree handling clock muxing. I kind of
disagree on this approach. If some logic is needed to handled clock
parking while switching clock sub-trees and notifiers is not
accepted them the CCF should evolve to handle that, not moving
this logic elsewhere and have a proliferation of clk mux related
code in cpufreq.

> 
> Additionally: I believe the udelay(100) in the G12A and Meson8*
> implementation is not even clock related but a delay to wait for the
> regulator to become stable.

It's highly probable

> 
>>> - GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
>>> we're good with what we have (meaning: no custom cpufreq driver
>>> needed)
>>> - G12A single cluster, no DSU: needs a cpufreq driver that implements
>>> target_intermediate (currently it's managed on clock driver side in
>>> kernel space, no firmware involved)
>>> - G12B multi cluster, no DSU: needs a cpufreq driver that implements
>>> target_intermediate (currently it's managed on clock driver side in
>>> kernel space, no firmware involved)
>>
>> The cpufreq-related resources on the SoCs mentioned above are relatively
>> clean: each cluster has only one independent clock and supply of its
>> own, and these SoCs also do not support voltage selection based on chip
>> binning.
> That makes things simple, indeed: each cluster follows the same logic
> using it's own resources.
> 
>>> - SM1 single cluster and DSU: needs a cpufreq driver that implements
>>> target_intermediate (currently it's managed on clock driver side in
>>> kernel space, no firmware involved)
>>
>> Compared with the SoCs above, the difference for SM1 is that it needs to
>> additionally manage a DSU clock. In this case, the clock-related
>> handling can be added in dev_pm_opp_set_config() in amlogic-cpufreq.c
>> (by implementing clk_names and config_clks in struct dev_pm_opp_config).
> I think so far mainline is not touching the DSU clock at all.
> 
> [...]
>> All in all, it looks like we can currently support all Amlogic SoCs in a
>> single amlogic-cpufreq.c? Then, for the specific characteristics of
>> different SoCs, we can differentiate them through the "compatible"
>> property and add the corresponding drvdata for each.
>>
>> I'll also try to support S7/A9 with representative differences based on
>> this patch.
> Great, let's look at some code rather than discussing theory on how to
> write code :-)
> 
> There's one last detail that we have to manage in case we also want to
> include the Meson8* code into the same file:
> config MESON_SM depends on ARM64_4K_PAGES
> 32-bit kernel builds can't satisfy this (meaning: we end up with
> linker errors). I think a simple way to get around this is to add stub
> functions to include/linux/firmware/meson/meson_sm.h.
> I'll take care of that once I can submit Meson8 support patches for
> your upcoming amlogic-cpufreq.c!
> 
> 
> Best regards,
> Martin


