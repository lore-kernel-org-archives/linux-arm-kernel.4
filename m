Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6926360A2600
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CmtyjMHc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m58+Jm/s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbNaVHJ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=; b=CmtyjMHc/auuNX
	BAFx2NMtYsxoL39iZDFNysDtur69x6EaSjF4YYNiDv4k/vFye+Mo0s+lrtMqFMKdNeuEM4OGQyCWo
	GLoHnCSEHmiqDAiWyuJtB+K/FjT4K8eBJ967en77qMNe3bk0EZEyIDSso0+qhhnSmI5LE6p7IA3tN
	xji0Greyaso+jZTBK3NPrxqVNSNkNuoJp24CysPyOBOLmqUTMxjk4gsPtJzBCkbiIPOa8yPxX7oJq
	WofAJrIGQgVvm+2RwyT9X9Dc8CeGfZWjw4G+j6D2RdWBXZyFvmL3BGPE2ljhfHjkFWy4dm72+WYbu
	n0wjrZV3mBrJ85lmPV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeRt-00000008nZp-2Yyb;
	Wed, 18 Nov 2026 12:07:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeRq-00000008nZD-0isi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:07:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkqJC3691271
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=; b=m58+Jm/s2vJ3gqKq
	VaIH92ZTzASJ8eohtgzW4HaXPbcN4/uG5hzGXLarxQPmRO/bzpvmqyjUIrp4kfjr
	hKXH33GInbgViG+pEmT72S9Lp30a/zFDeJRk2IKV+e+qqzp95GZ9Ulns1tixorkw
	hkPS52oR7qvebFIexEgTea9dL/4n4h8h299CPEL3JUda3yWx7bDpBrYFPYtWN/cX
	MXQcnKiHhnjLpSx0AWDdcX3D9dl4YiTbR48sNKFHwkvGGK+8A/kG7rR+E/7Q3H8c
	uVxBfrJnsaAlNGD6acv5biTuOwrXR0kV+HXmQ+MZ5/dDgnjeZ4j6lvmGZJmBzA+F
	bWHALg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9avx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:07:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso178412285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003652; x=1795608452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
        b=NbNaVHJ29h4Jc60z89yT/mYFKV1MPknKRDSuVBuC398vRB2ZMzlD61qN+501emv64h
         95se2jElT2bf4uGYOmSl09DcTurkZfFk3BWF0P1gtXT8X4VxSs0tRiKz7R4b+WkvWrtn
         Vl+KbTxQr98egV8uhNS2ukwdOKk1aVZr/Ym0z6nBY5ICYPACej+EYdYMoPmG05Hweddj
         d14F6bIWKUHjb/nLdT3Jo2BZYjxzuTg1CfQYoOo53PprZKcxlXZdyukJSJg3XPz0A3UV
         c1QzxSBcokDELds1PhULxuLGL4W/ujwroRACyag0rUobZpEDpBL0EYJpxzxUZBdVxyM4
         I70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003652; x=1795608452;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PGo0AutLiiy0hLAKmKu1B2JYnOQu7NjGJUl6O0s5Glk=;
        b=PR4irFrcctmiqiH0Nc4Ud4QCMpFCCRCoS0eyVISdqT1mbINzGdtHHjmAGZ++LL5G2P
         iRiDpH5/1rhR3h7tzjmDawvDxItZJlsJbUb6Pl3diY2h4Lq8P9kIWbquBGlhC90p6WBC
         D7vriBBgzDr9uGWp7Yq7K5blP8lCUaKSCDBCKYkwzC9aBd/Euvaxg9hN3Oadbt1RHMp4
         TFN+Yach1kaEOCuq/YXpIB4m+dpgzEq5mDw/n1sPb2kG1a7fNBYZhjgcIz0VoKshI9fg
         eRWe1nCOWD9zkEDQ5DYmLiwHT6cXx9lpYrdQk1H8PPcaCW4FjQ0tGd1GH0F+KIrzweu0
         4mCw==
X-Forwarded-Encrypted: i=1; AL+hErH4oF+sg0QaGCq+i6LP///tg3W0qQ+zqnrdZUDKceDTENRC08bq9LRFnSLtVCD7kc5HcgzNVGN5fxzG6oadne+6@lists.infradead.org
X-Gm-Message-State: APuU4Z96cloqXSZX51goX44IL6RBIUz1YXyh6unOCktHSvdQRBdkX3Yk
	mJLDvwacffyYf9xjUU7umMrlegs/5bWnIqqDipGxcsnwGwH8/tllGSuA1XKmxHJ3yfyGxEQPEi9
	VZg7H8CrqNDO8yV1ZvscsBvm1xIPq94wjBd4RIJHLV6m4R/vVHWnfQprBWrXsF6o+E9LZOUtJwj
	nJpQ==
X-Gm-Gg: AYBFou2dt7kvpNI+b1122iCs1xZLQ1p0tjWqndeyhkjzPAvwbZjYKkhZTk2fNyGQQ8J
	IEFk2tKmzOyh1RFggnFeOtLp+m9W1E2wYAlP5mAIORAoWnNPA1rdAUyVepnA61nxCLgvJ3gGYk1
	LByk/Il8PyENkUYgHuC79fPyhagkpz+YT4NK057hf5D6M/BQbI/HKFl2DjIQ9oz3r0n6S5KM/MK
	QIyRKE7czR+al/v6GO+bo71vUg658yBKxKovsjKgRZeIWdYMpH2wIL1LvTM5+C1Hqb7l7LpjrmE
	/G2NyKIILgFgnl1qo0o7Cnhk8ny4yS5/s5aStI9uT7VPPbcx2IM2rcPkdZi+a0VsOfiHdd/ndiX
	ubwZdTMQTtKRsUIyCd2xk5x9hJLY2LfLu/MyvFk6aXf+Awfs1aQ7zZ3k40HDSNK6yChHsZv2i8j
	k=
X-Received: by 2002:a05:620a:1a07:b0:93e:60e8:c9ad with SMTP id af79cd13be357-949995f6f18mr450726485a.12.1795003652107;
        Wed, 18 Nov 2026 04:07:32 -0800 (PST)
X-Received: by 2002:a05:620a:1a07:b0:93e:60e8:c9ad with SMTP id af79cd13be357-949995f6f18mr450720985a.12.1795003651629;
        Wed, 18 Nov 2026 04:07:31 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm3923461f8f.12.2026.11.18.04.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:07:30 -0800 (PST)
Message-ID: <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:07:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
 <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
 <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e9bfca58-666c-45d8-bd5d-9405b068bd08@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXzq+v2kLbq3Fd
 Cz2HzOD3WPC7HON3HxfeAoFmd8x4muynwDck2owF0VyDn2kEXg5N4e59DUAAHVJM78c6D/ETmG1
 J32mV35e6DGF8L9PvmhtWu4XN+YgLEE=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd9505 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tsTWcAnlPx0FCvilErIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX7sB2Wolwm5m+
 EfvCOigpj4WiInxZ6ThWODWszITa5ArRV3UfDltgGse8mChwBFYw1BniARby5RrE76JT7ZSs+Jo
 gDE8iuED32n2aIi6BPoYZkLnBNTmOm2BGAMPBYXOJuKP2qvJ4i9l+7VUGAqrET3dfjKq0rSuzrx
 eCL1yXO1BZUZ5FijyRoqrQ4twU5gh7hkRveL3Vf1avvo2llBDKZ6tzrDyk9wPErAOkq4FXRUHXL
 UXd8TzBn252N4ZqwHcLVGW148lW2yvDwFH3y0Z7f+SeXKv9VVuEetQWL2pWt8FGucCc+RhGEpd1
 g5AQQ+E1tv7BM4BLAvqSqVbH6m4x4cCc99ONEnA3XGwXud6At1KcXQW73nNsDkXM8x65/+v2HxP
 emg2IRVOFd5fhZ1Afni+d6pjL6Xi/WnkgABcQgqKQE1fZyHaA7DRLLoSkeo+7z2RS4avdcp68fi
 7ntcqcnbgnjzQJEmYqg==
X-Proofpoint-ORIG-GUID: Pcnm-z_I5DGgIOJ-eZoUmcuLp0El-Z4P
X-Proofpoint-GUID: Pcnm-z_I5DGgIOJ-eZoUmcuLp0El-Z4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_040734_340097_AEFC3CE9 
X-CRM114-Status: GOOD (  18.02  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 17:24, Marek Vasut wrote:
> On 11/17/26 4:13 PM, Krzysztof Kozlowski wrote:
>> On 17/11/2026 14:41, Marek Vasut wrote:
>>> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>>>> The eeprom0wl alias was never approved by Devicetree maintainers,
>>>> because it was never documented as actual ABI.  There is no in-kernel
>>>> user of it, although there might be U-Boot.  External DTS users cannot
>>>> rely on undocumented ABI, thus these are pretty safe to drop.
>>>>
>>>> No new custom aliases are allowed for years now.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> index bcf63e2ea989..5795b352fccf 100644
>>>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>>>> @@ -10,7 +10,6 @@ aliases {
>>>>    		serial0 = &usart6;
>>>>    		serial1 = &uart8;
>>>>    		eeprom0 = &eeprom0;
>>>> -		eeprom0wl = &eeprom0wl;
>>>>    		rtc0 = &rv3032;
>>>>    		rtc1 = &rtc;
>>>>    	};
>>>
>>> U-Boot depends on the alias, so please don't drop this one.
>>
>> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
>> user as understood in Linux kernel policy "we do not break users".
>> Especially that U-Boot does not even consume that DTS! We do not break
>> U-Boot as long as it is about documented ABI.
>>
>> Here U-Boot won't be really affected, because updating DTB in the
>> kernel, does not update the one in bootloader. It does not go that way.
>> It could go opposite, so from bootloader -> kernel, but not the other
>> way around.
> U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .

Cannot, otherwise it would have document that ABI. That is the
requirement of using OF_UPSTREAM - you also use upstream ABI. You cannot
use upstream DTS with downstream ABI.


Best regards,
Krzysztof

