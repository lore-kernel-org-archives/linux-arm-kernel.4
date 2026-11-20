Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q8iDjp0I;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMCcsE8t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3wMzIMI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zuSAV0ASIkI+OH27bfS7LAMz0ZPMgX2c/e9d/b6BkGI=; b=Q8iDjp0IaYNtya
	GPZ5xS4Yg/ld2Xlqf06GMLkh5wn55sjiKJmBRf7vtIhAzZygBR7TyhpN0AI1a0thaSiYAdE1DU2XD
	2PyGfp3DJDIffpnrF8FhFdmt2bo3hre+v8lif3IYFtL6Xs4ZAZ0Q8tTEghAyc6MWXF3hNi3NwL1lU
	Z3JrExOLrigRWSDQtSDi8IVThSzLnenfi0aZp2pi9zgowPUT964mstYdqu7DxLSwgmHtV2ehPMCVf
	Lcf6xtacc4DROAjgGGaN48fLJ19Csdn5zkREEvIs31fLN4xeQ11m/9qsgcMCHCx7TeLNC+HnRudR6
	CQVcRUvQdTJhj/VDLnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKP7-0000000EP1t-0g4z;
	Fri, 20 Nov 2026 08:55:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKOr-0000000EP0K-1Ius
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:55:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f48Y1742148
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuSAV0ASIkI+OH27bfS7LAMz0ZPMgX2c/e9d/b6BkGI=; b=aMCcsE8tdnNgQ7jJ
	oz6XOXh9ftErExtdKSrIyufISfvsF726z5JjuYh6aajkVn33WsfJw013/4rciw6m
	Fr8Uby2k9cLG1dLfTLJlZdjNMy4ylwz/AGtrdiEaq0QM4oOtjvV8LMCA80ZJU63/
	uJxkss2qsMyohpReEef8S6V5SSyyg5PjKZMB8FpV2u8ZD2/OsqoC30NO/pKgrc96
	vy1bq6Bwz4GQUnG2dm2BTD/QamFf8iiZi2pKIHlUmNJN3fPoUivV27q8zI9to74g
	6MlsgZuoYWJ0nDhDwhgz1rsey+SKy1v+hIASqiUp+o6XGEKmKfsRgsmIf33MUejj
	B39t8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yh144-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:55:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so130769285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164915; x=1795769715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zuSAV0ASIkI+OH27bfS7LAMz0ZPMgX2c/e9d/b6BkGI=;
        b=e3wMzIMIRWTbecZhYFRqXgvH1gz4lSZSLK/NtisDIVHcxHn6l370ZGLd8IUAA+rYIr
         7cKcsHm9amljqmy5yzYowfmqEQ3Mp5Blgt0C8yKvKfTEByAyWQFKqf+/fuWvTq058gQl
         3ZBQ7Kg/kJSjHjQyvVQrLgWOQcX9RIkeMWoC2SawQlaoExZmL9PS4ci4NzTx5LOL+TRb
         sWpiQR9xT762MLRvfkNq7UvkfRh+/e5DR+zHgXSzZP32YvRS9zDGFk60l1odlbNNk7Lk
         rPZ0N/mgX//5CR2vJ1pmYOkQwpCcgXkwTSU1MA/L/eiTlmmZagmEfB6r9+nlyA0uQwpd
         pe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164915; x=1795769715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zuSAV0ASIkI+OH27bfS7LAMz0ZPMgX2c/e9d/b6BkGI=;
        b=KHbJkGpbEVxbe34mqOkfwweNbWlTEwSV/Rjq+GyKVGccTOQ2kX08hC5nfaV75tPtof
         5EEUr0SaIkr9qOXsgwqr5q1XkFmCKw9pMRmF/qoNX+ohFqkgQ+4c5ozUlm0TS+erHSaA
         CmXPh/haNFlVCV3UlVBvr8QjnCJm+8WVPqtC4nXiGQ9bn6IAk/GIv7LWd0m7ftOQdapJ
         7vs5b3unl5LJhQW5YJYAkg0oavq2bQmwpMuqUPzMwansI01HFW+66z0wx2ZAFXt/cJTT
         vZ1BdfmuV1/yss705wiMIQwTrRTIttKuoJemh8ucR+XJQ7fCqvSIKpgaszFx+/BJ3iHk
         +MQw==
X-Forwarded-Encrypted: i=1; AL+hErFSqrh1HwUPJwAax4+nl2JwbLdpciiojxuOVkyvIJPPfTbWobZZb7owWpXYZE1uTWkOGh0/dWbooUuQn/BPEhNK@lists.infradead.org
X-Gm-Message-State: APuU4Z9hu04xgY44V1OGhLPBNlKdh4FD9SWA3/KhSwYJYOlC50MqO6cB
	br/u/vsdUdVc1+REf7FAsNf/XYPMmlxkLS9FYFRn5fBjzuRhocQOQ4OFrJF7VTJkJQbyrpMUhV6
	kA7qAWEclZyQBH2Unn23vHWmxOAj+Vok8LYbMN7w1QrzHE+8x9imG4/4zAgFnVKpgMGfQEFcGIa
	mT+IOOtlY0Cw==
X-Gm-Gg: AYBFou26ljXIKNSc1n1z6vXovQrMjxoG/J1lxZE9VuKEWFbeZEPw3OvVjZizJxW3xVw
	Z8eHWiRN+kyErmr7mQkyPeAn3U+YrMssy2EXdS6PIX6KETJsLVHnvZ43mi0jRLq9/zHwGlrhAQH
	XCyA4080RjwemMyuG4TQPONpucAzTlDO7AYh9f7S7HdoDM77xx9EjIrZGevEQCkA9KwR5BAC7XD
	Md0abgmV2NcXyx24HSNGlYGC871516uXTbtVjbTgxA0ttbJdFD7LZV8LJv3IoiiMaYdScyCYCnz
	CmAe0+Hzjh4jR9fPmCcnWsTaTrv/57Nmcy8DcoTednlskHDViBqQuMzWWLLQrbVsyX37yNyWHlT
	XJ/+7hnSRWH74vLcZnXk0CNodIIdN/M++yqRNFeMOKR4bEdqlNqvYc/8ui4yWiddHTqhG71Wgd2
	c=
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr388720985a.14.1795164915478;
        Fri, 20 Nov 2026 00:55:15 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr388719085a.14.1795164915073;
        Fri, 20 Nov 2026 00:55:15 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm4620628f8f.59.2026.11.20.00.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:55:14 -0800 (PST)
Message-ID: <b5138676-fbd0-4922-9200-2ae600613c0b@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:55:12 +0100
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
 <8d0810f5-e90e-4a70-be9d-89215d02b74c@oss.qualcomm.com>
 <77bbefd5-3e05-45e4-9e0a-02063ebf3e06@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77bbefd5-3e05-45e4-9e0a-02063ebf3e06@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b000af3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bQMwIwtNPVeBncCEftwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX9Ta074SgQTML
 WiwaRpI6mjLCsFOwum9VzPNHcpUutcPXdXrsPjXhj+lOHp+eLxQtgAD4X7GzuzDsW8voKyyz+Qo
 /dvO4C2czGN5M8ETrzQ82zwjIIt1yoqRuyDvih1s8J68tPsiWP9dQQV/PWiiY237mT3UnwKlvVm
 1j3ZZcla8f0bSmPOKhOAUp/88qKT5llAViHjEe/eSxeF8oodAXixNobzDMLBd2RJLU+++dEXNpy
 QtKN7mKHya+Ujl8EKbpsz7nYQ80vTu5PnjpwYYKn66oUzlOVonF8lV54zlLBWOUcAku+VYDUIBH
 kTGJVSEFdYSqAXUxc1BTwVFeT9BrCVC6izjUZblF+AHx+JyS8hAQom/zdXiETvRjgdyq0cscAxL
 s349OiQ+WJ4EPEpL+XtPmKeDUSt3bAHHj8dRDr2jbfHmn8TVNKh/HpXYWOXlNEX1fpZZzvf2e2g
 l58o4Lm/XN9HJ9SCsWQ==
X-Proofpoint-GUID: xB67tq4eemCXxdJ2kGxn5i2VeAv_zbW0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX4ERG1VmkDXYd
 M4C1e+yQa3nQxazLiEjeTbQPAktEa/U86ZTKXiQDeAP5OV77IVnrV3lqqKyENlpDGJSCiUlN+ll
 KvKzQMkG9fsJTxz5CT8KGGE3WS+i3Q0=
X-Proofpoint-ORIG-GUID: xB67tq4eemCXxdJ2kGxn5i2VeAv_zbW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_005517_738381_7CE41B12 
X-CRM114-Status: GOOD (  15.42  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 08:41, Marek Vasut wrote:
>>>> As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
>>>> user as understood in Linux kernel policy "we do not break users".
>>>> Especially that U-Boot does not even consume that DTS! We do not break
>>>> U-Boot as long as it is about documented ABI.
>>>>
>>>> Here U-Boot won't be really affected, because updating DTB in the
>>>> kernel, does not update the one in bootloader. It does not go that way.
>>>> It could go opposite, so from bootloader -> kernel, but not the other
>>>> way around.
>>> U-Boot does consume Linux DTs via its CONFIG_OF_UPSTREAM .
>>
>> Cannot, otherwise it would have document that ABI. That is the
>> requirement of using OF_UPSTREAM - you also use upstream ABI. You cannot
>> use upstream DTS with downstream ABI.
> What option do I have here that does not break existing use case ? (I 
> can patch the U-Boot board code which depends on this, that is a non-issue)

Yes, please fix U-Boot.

> 
> Is there a schema which lists approved aliases now ?

Every device schema which requires custom aliases lists them. Another
point is that custom aliases are not allowed.

Best regards,
Krzysztof

