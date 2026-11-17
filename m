Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF475606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CDkg2P3B;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hw8wn4b7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lua2E3LN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=; b=CDkg2P3Bb5Z3Vu
	FmXQfiVA9vSb9SbKT7QDftrbEK87OKCuSOV7SNIY7oyaFxRiFeJ3rGFDhv6GmiuscCe5ErZvjjG69
	zOMgOgXqFu7EVHdh9u2eRmu3dYTcMdyEFhCBCYBQ0zRX/tP62f5VJKg4p79ewkeIJ0gI1/R8EDUCe
	J1k9i5qJn5agOIBe3xfmX8bRcDSLpYqs07ogxs6So8mz0IJt5pDJciA4eE74hfn8fk9LaKpUrzGYi
	AEI1MIl1zbuMtXlQRRJUrRkPRnx/sgDas4LFwiB+ajAgH95W7jPv21N9bjF3g/4P4+9sSRABkLjgc
	Niltoin0WH8dzuJwaYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKsa-00000006HPr-1og2;
	Tue, 17 Nov 2026 15:13:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKsX-00000006HOj-23qp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:13:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0s7r3048030
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=; b=hw8wn4b7vlXPbNBb
	3ELc5vkyLGpCe4P5F8dc1zRe7dK/4lxN75fsIwO/hK4FtcUyVCCCqbCx8Yxzomp8
	cl97GeEu/WxdPNdUJirMLnByyTtIN+XhzSXvRaQzfaWGzgplPkWPHYjadzykE0LG
	z91DkaELUVH13hueRYheUj97SmaUsKr3/oQ6J8Rh2QyLQr2EKjUjcCFKovwWOl/g
	okl4AhPKF6LowSkhwOZAFdTDjMptx29x1xFZoGliV3NVUBoWyIByij/oqCjixIwC
	63DsPZ08qxEsGqCOiL58aO7DbHg1DO5YY5FHVqKB32zkglAkrXq6cbihI1g5HF3J
	ipdeRQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv117q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:13:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so2928451e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794928417; x=1795533217; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
        b=Lua2E3LNXPsgZ1Zk8CK+55n1EW4PxKOiFqA1G+9KbLftz3/Yq9b1Don059t7a6xLXG
         Swp0MZEj2vm5NqKdaus3KTOznui213TV8uI3uGDwn/6XLLLV60/d2QK87pfZdCs5Dw9y
         V8h7T1yjSP64vVLpfPy9VD8sHQQDqwPyG0C211ckojC0lC9+ReBOXs5jqQlm4isSQvTZ
         yWMXx6iIBfizw00VMinev4HuPIUfRKQQXGApKK6ewgNk/bPfxy5cSD708CvDdrf2/bX3
         UF7ERojc9uTS+zISa/EyEHzDKHZx0XNhocysZkLa7jiZJG9crwLki4wFzyvKWB6Llgcn
         5lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928417; x=1795533217;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
        b=ndV04DN9HqdI2UbvKd3AJS9tM8+U5gltyClbzPZLCnKVlJU6BdezqiCLVeQxi8ixX2
         pkmzLakmelgmbZigZElYLnPlE6ALlvbznOMsHbwFLZncGCMwZe54oHpkTbVobEbVXpaE
         1+kbXfZKMLYxGhYFgrDp4w56+g2uafQN5m94iWlbHx1CtW2riv0pmEWdHzXSMjbiba2v
         yrgQSdFp60eiToDFeVrF+PeGZkHB+jB9KAs2Ag4aU59GcfSQHZiaMdO58uAopy/8wH0l
         8axzpNLkUkITgM8QuTTT2y6v2FnPVBEcojqW8UhQkeYIOzfwUPbtMLeOagc2BMr2qWsI
         HnAQ==
X-Forwarded-Encrypted: i=1; AL+hErH3DBYX7YbXYV9yOgJ6t4w6PCi0nPZUUdjYLWp31gdNfBdLdBuEhjxXql9FxF+1F+xbIW0SI++89r1lEfferasu@lists.infradead.org
X-Gm-Message-State: APuU4Z8idccym2FBPq5Yf4YzeZwj7rR0kNE26l6U+bdgCGDAUzAOyyRW
	o0aJbh7SDpK1gcrxtEynNB5Txf2/wgX2YUBpC/XweKQ7CaC0boOweGMb7e13CFIEos3o10gnJbM
	HgHRKDfPSA0g3DUkhDhg+rz1qGvTUEj1gfLoTDlX3oP6idpZsjrTmJHpoTns2ofo26tc5jNPdlW
	lLfg==
X-Gm-Gg: AYBFou0HqjattFE43nZnTzsBWURh11CgLN2AC1ltW1enoRj+Dk5iQ9uIrKmm1kVuV4N
	KPWpSGszxDYblnAf1lrU54IShLxxUs/jnIhqdvXxNgs61OImV5XdDo8SPu6ne9DgCqqyFANCX3U
	GG+QNprifjQ7qBknLvYzYb7BHmPD3j8971JyozQFP5sg/jTRmPNVBl42Wq8j9XlhV+NuRP6LDY8
	zYPs3KpSuxuttvEkTGSJwjqBgJCVu18HGzV65S30XeAzXryMlgav7PfBAxdU+2axR9UYjF7NTeZ
	XXujyqBCd8vJptZS51w+Mn4b70l9kTcdXDAgr5slbljTkK96RaNwZ2cNAS/re/nwLX9EkQi0mCe
	Kqngtqq4aj28YAb0kxwgCqhSl9NmUuvfDIQa8MOadjRQRyW0s65AxxC9+GzDzZFEr8KZRlIg89Q
	o=
X-Received: by 2002:a05:6122:21a5:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee34a469b0mr5819009e0c.5.1794928417390;
        Tue, 17 Nov 2026 07:13:37 -0800 (PST)
X-Received: by 2002:a05:6122:21a5:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee34a469b0mr5818968e0c.5.1794928416943;
        Tue, 17 Nov 2026 07:13:36 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm108262885e9.7.2026.11.17.07.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:13:36 -0800 (PST)
Message-ID: <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:13:34 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8r8JGAcyuFaUcH5ADx0BF4LNYUfiq3nB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfXyroMxc6zOCY9
 iwQQ0uXsvLBAkYcAhupakV0Jftvhq2PdSbgh3hwqqRh0D57Gef4oa3TIKcQ/cjAkaGCdSHBjFGi
 r27kFBn4T7BTnSPZK0chVs1ypznP8vU=
X-Proofpoint-ORIG-GUID: 8r8JGAcyuFaUcH5ADx0BF4LNYUfiq3nB
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc6f22 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-9-fYqzskX8NnebTxdYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX9z8f7V/mUXP0
 A2MIZ2CmciqZkOGs2rxjtaU5/WvEPzw79JalIkyktiA/I4ZJEOkbLEwLYh6mdaLzWPrIrR89R7U
 k5tPvYc4boS8oLnsNCWjG3KVIntz8Epba1Hz/wdBSxOZ7wxxe7VUFK4t5wLe/Q9MbH7ZXtO+nX7
 wEGbES7OsCVybKj4wWgTGDp6s+z3ORCl36OathTy0szK0buXvGUmIAvEk2Zm+NUVeEzGxuzxD5R
 nS8sELPW/5BZBa/FKAxyUcQqXyF4SnHqE06QyQjwNOOIT6nBdnmtMZsjgBqo8zFB2w5BwfeglTP
 f8l7EmwiCgnQMH3k6M9a+aam1Mm4eL6NLSA+pOf/QsA0cT4svu/DNvCj9RPrmcW6NYA6jT9iyup
 nB3J2Rf+Jwi9F37HKYKf6ye/H+CMH9SDrKFsP0AXoWin6rwSLl/T5YKle/HK90bIoTt+EaFMWwo
 w+mGzCNj+npISnsKzDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_071349_541394_16CAD6EB 
X-CRM114-Status: GOOD (  19.10  )
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

On 17/11/2026 14:41, Marek Vasut wrote:
> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>> The eeprom0wl alias was never approved by Devicetree maintainers,
>> because it was never documented as actual ABI.  There is no in-kernel
>> user of it, although there might be U-Boot.  External DTS users cannot
>> rely on undocumented ABI, thus these are pretty safe to drop.
>>
>> No new custom aliases are allowed for years now.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> index bcf63e2ea989..5795b352fccf 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> @@ -10,7 +10,6 @@ aliases {
>>   		serial0 = &usart6;
>>   		serial1 = &uart8;
>>   		eeprom0 = &eeprom0;
>> -		eeprom0wl = &eeprom0wl;
>>   		rtc0 = &rv3032;
>>   		rtc1 = &rtc;
>>   	};
> 
> U-Boot depends on the alias, so please don't drop this one.

As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
user as understood in Linux kernel policy "we do not break users".
Especially that U-Boot does not even consume that DTS! We do not break
U-Boot as long as it is about documented ABI.

Here U-Boot won't be really affected, because updating DTB in the
kernel, does not update the one in bootloader. It does not go that way.
It could go opposite, so from bootloader -> kernel, but not the other
way around.

Best regards,
Krzysztof

