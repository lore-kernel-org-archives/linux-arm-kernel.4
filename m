Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7A2606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nqNm4JYG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZlbugbdA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3hxNdp8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t4Dld1icNXmUDCSLkNCdijjtSGyDKFWKh8cFgLUwyhw=; b=nqNm4JYGoRLv3J
	WehuIACOFpsb0SZEeNim1WpD3pxTMMVph1KRn9xMrjrv7bZPPtUMrfPo5IbVjXtvtZTzJEYViDnH3
	cVhic+HIwqW5BfHEgviElAz6QXlqvR2e/czjBlC8cA1HkfH0gxJQWM5oddL4sykhbWRmkt4358f2O
	wNMSsujqdCuI0+UFyd0PI27b1a0m13N90P8FCEB9SDOvtPF510a8wMhC92EC37VJg6tnSx3+LRBe5
	yvuNPrxWsS0NJA/bHPvBh1DOK6vs0lNb6PoI0ZweX9hOqhN9Fk6FVcMh62iy0oYJppJlAGvVUCJ57
	7sP+6feeMcw78thwLo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURKA-0000000FXWM-1RQX;
	Fri, 20 Nov 2026 16:18:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURK6-0000000FXVp-2Dvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:18:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfgsv049068
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t4Dld1icNXmUDCSLkNCdijjtSGyDKFWKh8cFgLUwyhw=; b=ZlbugbdADM5bEepW
	juQrJ1QpPboC/UD0P9/ahdjjJvL8khpdCZF1N1R8Sn3WWEHC4D7IwOGOFyd88zwm
	cEF0r8rAssLKZBh1Y7qLrrIS21I3kWA/0nq3rzw4jjAcnwNMO9Rzjry+Y2xjlTQu
	V6IDN6D6rMjNuYlIz3uyPmifo6egm7y681+/pg1c1PVxBeIhbyA1WJW1McOJ9b4c
	Xbcn3nC8VN9FrsBfbdV5K2346HqyP/QLZ9LTSxUqglhCsrlI9obQvmBUiyrgSxBP
	4tC14qkzd/sBXXFXXCDL8uiiIU67Q255lcjfWPUkLRDJHjzN5lUgyarhCSX3hvGy
	dce/hA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4ha1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:18:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so1638105a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795191527; x=1795796327; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4Dld1icNXmUDCSLkNCdijjtSGyDKFWKh8cFgLUwyhw=;
        b=P3hxNdp86eD7ciqkuG78hn5U6hQZrrWOl316nprXfrjG906acYiAuGfpTYENx4O5+M
         22SUPNrKVRARzhrHk0hqrke/AIYYlOh/OpdXop9y4jz7D51Pj3IO1wvzfbo5mOGItdGt
         6C/Dh5meTnas0M+TKg3Dg9QyInrgpc0pHfXU3/dgvSMDWJsQ1b2MmlhbaxUu5x/k3M57
         aVnWKyeWu54F5ZQZH1xl4oJ5h//AL0Pt3pJzy1/mFD5lrG4T8RCnvK/3qM6Z9Lm3+3pY
         lzsxB6xgbX0IPhjirR9Fkkj+lIeVT0ps4F9IvIfel5HD85SIqtWQYMl/FDuR9tGY+Uvn
         NXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191527; x=1795796327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Dld1icNXmUDCSLkNCdijjtSGyDKFWKh8cFgLUwyhw=;
        b=NS/Eynqjo80sf0wWgNnCkBLiTVcjDZXPtRk7ZH9l4ttFg/n24qCAH/kgG9A4769Xj3
         JT19KW+/qKsvqnPfPEqkOwsjyiqmGJUu3P+MUyavYCrMwQz6AexRX7XIr/TpfBrG6oQK
         tkKPVWlF2iJWNW9C7QeyR44LM8Y4jlu7Bbc2+5eNdffd01eBGf0upAeIvV/YF78EFNNo
         kn+Ik1XzYpgORF59VNDl/i7YMlrXfMWzB9d/qAkTDE1g5T4SPXlUzgr/FrC5tDidzfsp
         IhuQfMLr5juXJRmxzqUv6jW5hBT2vGzGqTaCV8HDew/PZXxB3sN1OL7dSBTJ6kUzwtsg
         Uwpg==
X-Forwarded-Encrypted: i=1; AL+hErHVlLRVe0OlTntqPGC5mUBwS02nJwcTY41X+1YXnnvyGuOzcYflwwgsZbbXaE2dLVrWT4yImrMwrd61TdDa7Amy@lists.infradead.org
X-Gm-Message-State: APuU4Z+4ca4h8veJQtFz2HgzbF8QW8j9wRSODS/oylwP22aCxMlofgIj
	MGBGRoXgDRON0MsNmtlNLoOtlhfNpY8n7NQwJfjKcH/ST4jJL1BtrV99R+HlVSHRidp3j71xfOl
	Eqm08k6liU/aDAMwp86lSNg/w4AOrz3pTEcfdyi/oK8VYDgwu47EUz1LRbOkuuWWiRh1pRRj7hI
	tm7g==
X-Gm-Gg: AZFdTZfnHh07JELZZziwzag7AHlo+vTtiyIYeCLIuH4rnjTHxiRsIiAFeyHlas8mAtX
	brQMztVdHvL95Y/cmL6aar7KpQxAj1f4Y83rhEYeTvvzqgRGXj//LopPOLpGySf2tPfvsrJ5ot6
	/PP29xE1ExDV4EDbvXwm3Z40QWCA+YqdaUdsrx1FLtxuQcSwZ24JJd6ceAmhSadHN5SWknyfQG0
	QyuDcFG/jJY/Vp+uhvqDVa1gOkXO4/c4llLDY1D32+SnrnNgPKf5zXymcnGQl2iwetO7nd4wcnl
	XU/dVW4d0oT8tPtWI8RS72Uv38NKrFWHgESDkZPNfD91HYFi+uHy+wIfGtejsCu3vszpls8YGNN
	UyQsA/sh7K/JBYPMTQN9ztWDPJ5Hs+6zu/5KQ8yxULYVj60EVvWEVHnUiy7SBtsL0uoEOcP/IjA
	WDmFUTPrAd
X-Received: by 2002:a17:90b:384d:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b41c8528b4mr3720501a91.2.1795191526810;
        Fri, 20 Nov 2026 08:18:46 -0800 (PST)
X-Received: by 2002:a17:90b:384d:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b41c8528b4mr3720458a91.2.1795191526149;
        Fri, 20 Nov 2026 08:18:46 -0800 (PST)
Received: from [192.168.29.31] ([49.43.232.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ff2561asm1701473a91.1.2026.11.20.08.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:18:45 -0800 (PST)
Message-ID: <72fcd590-cdb7-4223-942d-329ecbd950e0@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 21:48:28 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v27 00/10] Implement PSCI reboot mode driver for PSCI
 resets
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <CAPx+jO-WLCnVecquKbVaCcErbhuFt6OHFUmzbgNHjixx0r-wMw@mail.gmail.com>
 <avo8wrWBjsk0RU6s@venus>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <avo8wrWBjsk0RU6s@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lsmhEI17wK3m8hx7BolDnwnoXk8u2lLn
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b0072e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=rVPHjc/N4E3dzGhKvu3xTA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=wsFT6AapSP24iMOhd5AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX5TLSby4RP6vE
 cLpRQjN2wqn/SYNjxLw1lHqWHs7k0KdIpr8Md39P2Dqq64rRD9TrVYgE6Tyag4fCV7rtYOk4dCH
 hpX1GOJVEbJ56AABcUjuAmU0GhBqUdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX7QC4oSfmEhFE
 whHhZu3rCP5gh+6UIKSGBui32A0rk+Wyzreu/wFtE6KtDW3tPC6+AKHNsbnTdg8tXVozMjsziAn
 9ltoDbuyIxf+Rs56Mbws5BysyTolWBG5NPxRF7HgwnsfCIyOk+8bqWJxXS1Z+hG05TTRGdTqDDo
 NDqXhxHdFWgHt6uQNXVITY6IHbZkxqL+kyeYR3sPbrtoIVVsX7fMIcaAMapYpQT6xiio7KpAsgy
 JCUCQj7LNZKdJK9qN8H20IdPgE28yxwKjc0Rw5jMudkHWzgMEcHEdjsnNGu6OQmUjHJcXMk5/hl
 XW8Vl73NNSzLJX4jsqYxI1r/omE8IGpAd7WEMiJ91feSbQ19v05ht7ERUsmpBOeIWwsPjWwmsX1
 t37Rcn0gehz4oU7UTIUI+sdzNR6itHlZvrj6zllox78aW5uwNCXQWO3r0pNItqzMZbg4R8/8hM/
 UMDbBns6ui4pZSF7HSg==
X-Proofpoint-GUID: lsmhEI17wK3m8hx7BolDnwnoXk8u2lLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_081850_700241_B79EED05 
X-CRM114-Status: GOOD (  22.36  )
X-Spam-Score: -2.8 (--)
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



On 11/16/2026 4:44 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Nov 09, 2026 at 04:47:29PM +0100, Ulf Hansson wrote:
>> On Thu, Oct 29, 2026 at 10:01 AM Shivendra Pratap
>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>
>>> Userspace should be able to initiate device reboots using the various
>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>> patch series introduces psci-reboot-mode driver that will induce
>>> command-based resets to psci driver for executing the device reset.
>>>
>>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>>> It defines predefined reset types, such as warm and cold reset, and
>>> vendor-specific reset types which are SoC vendor specific. To support
>>> these requirements, the reboot-mode framework is enhanced in two key
>>> ways:
>>> 1. Support upto three 32 bit magic values as arguments. This enables to
>>> support for a 32 bit reset_type and a 64 bit cookie).
>>> 2. Predefined modes: Add support for predefined reboot modes in the
>>> framework.
>>>
>>> With these enhancements, the patch series enables:
>>>   - Arch Warm reset and system reset cold as predefined reboot modes.
>>>   - Vendor-specific resets, configurable via the SoC-specific device tree.
>>>
>>> Together, these changes allow userspace to trigger all above PSCI resets
>>> from userspace.
>>>
>>> Note on introducing psci aux devices:
>>> Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
>>> uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
>>> psci-reboot-mode probed through a common PSCI aux device enumerator.
>>> Reference discussions on this:
>>> https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com/
>>>
>>> ---
>>> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
>>> qcs615-ride.
>>>
>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>
>>> Changes in v27:
>>> - Removed unnecessary headers from psci-reboot-mode - By Bart
>>> - Rebased onto current linux-next.
>>> - Link to v26: https://patch.msgid.link/20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com
>>
>> Overall this looks reasonable to me, but I will take a closer look in
>> the next few days.
>>
>> When it comes to the merging strategy, it seems like the best way
>> would be to funnel this via my pmdomain tree. But I need an ack from
>> the relevant maintainers to make sure there are no issues with that.
> 
> Works for me.
> 

Hi Lorenzo,

Can you please review?

thanks,
Shivendra

